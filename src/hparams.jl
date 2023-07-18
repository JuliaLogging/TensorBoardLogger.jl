import .tensorboard_plugin_hparams.hparams: var"#DataType" as HParamDataType, DatasetType as HDatasetType
import .tensorboard_plugin_hparams.google.protobuf: ListValue as HListValue, Value as HValue
import .tensorboard_plugin_hparams.hparams as HP
import ProtoBuf as PB

struct HParamRealDomain
    min_value::Float64
    max_value::Float64
end
struct HParamSetDomain{T<:Union{String,Bool,Float64}}
    values::Vector{T}
end
Base.@kwdef struct HParamConfig
    name::String
    datatype::DataType
    displayname::String = ""
    description::String = ""
    domain::Union{Nothing,HParamRealDomain,HParamSetDomain} = nothing
end
Base.@kwdef struct MetricConfig
    name::String
    displayname::String = ""
    description::String = ""
end

default_domain(::Val{Bool}) = HParamSetDomain([false, true])
default_domain(::Val{Float64}) = HParamRealDomain(typemin(Float64), typemax(Float64))
default_domain(::Val{String}) = nothing

_to_proto_hparam_dtype(::Val{Bool}) = HParamDataType.DATA_TYPE_BOOL
_to_proto_hparam_dtype(::Val{Float64}) = HParamDataType.DATA_TYPE_FLOAT64
_to_proto_hparam_dtype(::Val{String}) = HParamDataType.DATA_TYPE_STRING

function _convert_value(v::T) where {T<:Union{String,Bool,Real}}
    if v isa String
        return HValue(OneOf(:string_value, v))
    elseif v isa Bool
        return HValue(OneOf(:bool_value, v))
    elseif v isa Real
        return HValue(OneOf(:number_value, Float64(v)))
    else
        error("Unrecognised type!")
    end
end

_convert_hparam_domain(::Nothing) = nothing
_convert_hparam_domain(domain::HParamRealDomain) = OneOf(:domain_interval, HP.Interval(domain.min_value, domain.max_value))
_convert_hparam_domain(domain::HParamSetDomain) = OneOf(:domain_discrete, HListValue([_convert_value(v) for v in domain.values]))

function hparam_info(c::HParamConfig)
    datatype = c.datatype
    domain = c.domain
    if isnothing(c.domain)
        domain = default_domain(Val(datatype))
    else
        if isa(domain, HParamRealDomain)
            @assert datatype == Float64 "Real domains require Float64"
        elseif isa(domain, HParamSetDomain{String})
            @assert datatype == String "Domains with strings require a datatype of String"
        elseif isa(domain, HParamSetDomain{Bool})
            @assert datatype == Bool "Domains with bools require a datatype of Bool"
        elseif isa(domain, HParamSetDomain{Float64})
            @assert datatype <: Real "Domains with floats require a datatype a Real datatype"
        end
    end

    dtype = _to_proto_hparam_dtype(Val(datatype))
    converted_domain = _convert_hparam_domain(domain)
    return HP.HParamInfo(c.name, c.displayname, c.description, dtype, converted_domain)
end
function metric_info(c::MetricConfig)
    mname = HP.MetricName("", c.name)
    return HP.MetricInfo(mname, c.displayname, c.description, HDatasetType.DATASET_UNKNOWN)
end

function encode_bytes(content::HP.HParamsPluginData)
    data = PipeBuffer()
    encode(ProtoEncoder(data), content)
    return take!(data)
end

# Dictionary serialisation in ProtoBuf does not work for this specific map type
# and must be overloaded so that it can be parsed. The format was derived by
# looking at the binary output of a log file created by tensorboardX.
# These protobuf overloads should be removed once https://github.com/JuliaIO/ProtoBuf.jl/pull/234 is merged.
function PB.encode(e::ProtoEncoder, i::Int, x::Dict{String,HValue})
    for (k, v) in x
        PB.Codecs.encode_tag(e, 1, PB.Codecs.LENGTH_DELIMITED)
        total_size = PB.Codecs._encoded_size(k, 1) + PB.Codecs._encoded_size(v, 2)
        PB.Codecs.vbyte_encode(e.io, UInt32(total_size)) # Add two for the wire type and length
        PB.Codecs.encode(e, 1, k)
        PB.Codecs.encode(e, 2, v)
    end
    return nothing
end

# Similarly, we must overload the size calculation to take into account the new
# format.
function PB.Codecs._encoded_size(d::Dict{String,HValue}, i::Int)
    mapreduce(x->begin
        total_size = PB.Codecs._encoded_size(x.first, 1) + PB.Codecs._encoded_size(x.second, 2)
        return 1 + PB.Codecs._varint_size(total_size) + total_size
    end, +, d, init=0)
end


"""
    write_hparams!(logger::TBLogger, hparams::Dict{String, Any}, metrics::AbstractArray{String})

Writes the supplied hyperparameters to the logger, along with noting all metrics that should be tracked.

The value of `hparams` can be a `String`, `Bool` or a subtype of `Real`. All `Real` values are converted
to `Float64` when writing the logs.

`metrics` should be a list of tags, which correspond to scalars that have been logged. Tensorboard will
automatically extract the latest metric logged to use for this value.
"""
function write_hparams!(logger::TBLogger, hparams::Dict{String,<:Any}, metrics::AbstractArray{String})
    PLUGIN_NAME = "hparams"
    PLUGIN_DATA_VERSION = 0

    EXPERIMENT_TAG = "_hparams_/experiment"
    SESSION_START_INFO_TAG = "_hparams_/session_start_info"
    SESSION_END_INFO_TAG = "_hparams_/session_end_info"

    # Check for datatypes
    for (k, v) in hparams
        @assert typeof(v) <: Union{Bool,String,Real} "Hyperparameters must be of types String, Bool or Real"
        # Cast non-supported numerical values to Float64
        if !(typeof(v) <: Bool) && typeof(v) <: Real
            hparams[k] = Float64(v)
        end
    end

    hparam_infos = [hparam_info(HParamConfig(; name=k, datatype=typeof(v))) for (k, v) in hparams]
    metric_infos = [metric_info(MetricConfig(; name=metric)) for metric in metrics]

    hparams_dict = Dict(k => _convert_value(v) for (k, v) in hparams)

    experiment = HP.Experiment("", "", "", time(), hparam_infos, metric_infos)
    experiment_content = HP.HParamsPluginData(PLUGIN_DATA_VERSION, OneOf(:experiment, experiment))
    experiment_md = SummaryMetadata(SummaryMetadata_PluginData(PLUGIN_NAME, encode_bytes(experiment_content)), "", "", DataClass.DATA_CLASS_UNKNOWN)
    experiment_summary = Summary([Summary_Value("", EXPERIMENT_TAG, experiment_md, nothing)])

    session_start_info = HP.SessionStartInfo(hparams_dict, "", "", "", time())
    session_start_content = HP.HParamsPluginData(PLUGIN_DATA_VERSION, OneOf(:session_start_info, session_start_info))
    session_start_md = SummaryMetadata(SummaryMetadata_PluginData(PLUGIN_NAME, encode_bytes(session_start_content)), "", "", DataClass.DATA_CLASS_UNKNOWN)
    session_start_summary = Summary([Summary_Value("", SESSION_START_INFO_TAG, session_start_md, nothing)])

    session_end_info = HP.SessionEndInfo(HP.Status.STATUS_SUCCESS, time())
    session_end_content = HP.HParamsPluginData(PLUGIN_DATA_VERSION, OneOf(:session_end_info, session_end_info))
    session_end_md = SummaryMetadata(SummaryMetadata_PluginData(PLUGIN_NAME, encode_bytes(session_end_content)), "", "", DataClass.DATA_CLASS_UNKNOWN)
    session_end_summary = Summary([Summary_Value("", SESSION_END_INFO_TAG, session_end_md, nothing)])

    for s in (experiment_summary, session_start_summary, session_end_summary)
        event = make_event(logger, s)
        write_event(logger, event)
    end
    nothing
end
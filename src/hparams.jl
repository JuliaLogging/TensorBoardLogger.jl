import .tensorboard_plugin_hparams.hparams: Interval, MetricInfo, MetricName, HParamInfo, Experiment, HParams
import .tensorboard_plugin_hparams.hparams: var"#DataType" as HParamDataType, DatasetType as HDatasetType
import .tensorboard_plugin_hparams.google.protobuf: ListValue as HListValue, OneOf as HOneOf, Value as HValue
import .tensorboard_plugin_hparams.hparams as HP
import .tensorboard: DataClass

struct HParamRealDomain
    min_value::Float64
    max_value::Float64
end
struct HParamSetDomain{T<:Union{String, Bool, Float64}}
    values::Vector{T}
end
Base.@kwdef struct HParamConfig
    name::String
    datatype::DataType
    displayname::String = ""
    description::String = ""
    domain::Union{Nothing, HParamRealDomain, HParamSetDomain} = nothing
end
Base.@kwdef struct MetricConfig
    name::String
    displayname::String = ""
    description::String = ""
end

# default_domain(::Val{Bool}) = HParamSetDomain([false, true])
# default_domain(::Val{Float64}) = HParamRealDomain(typemin(Float64), typemax(Float64))
default_domain(::Val{Bool}) = nothing
default_domain(::Val{Float64}) = nothing
default_domain(::Val{String}) = nothing

_to_proto_hparam_dtype(::Val{Bool}) = HParamDataType.DATA_TYPE_BOOL
_to_proto_hparam_dtype(::Val{String}) = HParamDataType.DATA_TYPE_STRING
_to_proto_hparam_dtype(::Val{Float64}) = HParamDataType.DATA_TYPE_FLOAT64

function _convert_value(v::T) where {T<:Union{String, Bool, Float64}}
    if v isa String
        return HValue(HOneOf(:string_value, v))
    elseif v isa Bool
        return HValue(HOneOf(:bool_value, v))
    elseif v isa Float64
        return HValue(HOneOf(:number_value, v))
    else
        error("Unrecognised type!")
    end
end

_convert_hparam_domain(::Nothing) = nothing
_convert_hparam_domain(domain::HParamRealDomain) = HOneOf(:domain_interval, Interval(domain.min_value, domain.max_value))
_convert_hparam_domain(domain::HParamSetDomain) = HOneOf(:domain_discrete, HListValue([_convert_value(v) for v in domain.values]))


function hparam_info(c::HParamConfig)
    datatype = c.datatype
    domain = c.domain
    if isnothing(c.domain)
        domain = default_domain(Val(datatype))
    else
        if isa(domain, HParamRealDomain)
            @assert datatype==Float64 "Real domains require Float64"
        elseif isa(domain, HParamSetDomain{String})
            @assert datatype==String "Domains with strings require a datatype of String"
        elseif isa(domain, HParamSetDomain{Bool})
            @assert datatype==Bool "Domains with bools require a datatype of Bool"
        elseif isa(domain, HParamSetDomain{Float64})
            @assert datatype==Float64 "Domains with floats require a datatype of Float64"
        end
    end
    
    dtype = _to_proto_hparam_dtype(Val(datatype))
    converted_domain = _convert_hparam_domain(domain)
    return HParamInfo(c.name, c.displayname, c.description, dtype, converted_domain)
end
function decode_metric_name(name)
    if contains(name, '/')
        return (split(name, '/', limit=2)...,)
    else
        return ("", name)
    end
end
function metric_info(c::MetricConfig)    
    # group, tag = decode_metric_name(c.name)
    mname = MetricName("", c.name)
    return MetricInfo(mname, c.displayname, c.description, HDatasetType.DATASET_UNKNOWN)
end

function encode_bytes(content::HP.HParamsPluginData)
    data = PipeBuffer();
    encode(ProtoEncoder(data), content)
    return take!(data)
end

function write_hparams!(logger::TBLogger, hparams::Dict{String, Any}, metrics::AbstractArray{String})
    PLUGIN_NAME = "hparams"
    PLUGIN_DATA_VERSION = 0

    EXPERIMENT_TAG = "_hparams_/experiment"
    SESSION_START_INFO_TAG = "_hparams_/session_start_info"
    SESSION_END_INFO_TAG = "_hparams_/session_end_info"

    # Check for datatypes
    for v in values(hparams)
        @assert typeof(v) <: Union{Bool, String, Float64} "Hyperparameters must be of types String, Bool or Float64"
    end

    hparam_infos = [hparam_info(HParamConfig(; name=k, datatype=typeof(v))) for (k, v) in hparams]
    metric_infos = [metric_info(MetricConfig(; name=metric)) for metric in metrics]

    hparams_dict = Dict{String, HValue}(k=>_convert_value(v) for (k,v) in hparams)

    session_start_info = HP.SessionStartInfo(hparams_dict, "", "", "", zero(Float64))
    session_start_content = HP.HParamsPluginData(PLUGIN_DATA_VERSION, HOneOf(:session_start_info, session_start_info))
    session_start_md = SummaryMetadata(SummaryMetadata_PluginData(PLUGIN_NAME, encode_bytes(session_start_content)), PLUGIN_NAME, "", DataClass.DATA_CLASS_UNKNOWN)
    session_start_summary = Summary([Summary_Value("", SESSION_START_INFO_TAG, session_start_md, nothing)])
    
    experiment = HP.Experiment("", "", "", zero(Float64), hparam_infos, metric_infos)
    experiment_content = HP.HParamsPluginData(PLUGIN_DATA_VERSION, HOneOf(:experiment, experiment))
    experiment_md = SummaryMetadata(SummaryMetadata_PluginData(PLUGIN_NAME, encode_bytes(experiment_content)), PLUGIN_NAME, "", DataClass.DATA_CLASS_UNKNOWN)
    experiment_summary = Summary([Summary_Value("", EXPERIMENT_TAG, experiment_md, nothing)])

    session_end_info = HP.SessionEndInfo(HP.Status.STATUS_SUCCESS, zero(Float64))
    # session_end_info = HP.SessionEndInfo(HP.Status.STATUS_SUCCESS, zero(Float64))
    session_end_content = HP.HParamsPluginData(PLUGIN_DATA_VERSION, HOneOf(:session_end_info, session_end_info))
    session_end_md = SummaryMetadata(SummaryMetadata_PluginData(PLUGIN_NAME, encode_bytes(session_end_content)), PLUGIN_NAME, "", DataClass.DATA_CLASS_UNKNOWN)
    session_end_summary = Summary([Summary_Value("", SESSION_END_INFO_TAG, session_end_md, nothing)])

    # file = add_eventfile(logger, "hparams")
    # eventfile = logger.all_files[file]
    for s in (session_start_summary, experiment_summary, session_end_summary)
        event = Event(zero(Float64), zero(Int64), OneOf(:summary, s), nothing)
        write_event(logger, event)
    end
    nothing
end


export write_hparams!
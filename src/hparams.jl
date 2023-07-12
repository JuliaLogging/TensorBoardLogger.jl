import .tensorboard_plugin_hparams.hparams: Interval, MetricInfo, MetricName, HParamInfo, Experiment, HParams
import .tensorboard_plugin_hparams.hparams: var"#DataType" as HParamDataType
import .tensorboard_plugin_hparams.google.protobuf: ListValue as HListValue, OneOf as HOneOf, Value as HValue
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
    domain::Union{Nothing, HParamRealDomain, HParamSetDomain}
end
Base.@kwdef struct MetricConfig
    name::String
    datatype::DataType
    displayname::String = ""
    description::String = ""
end

default_domain(::Val{Bool}) = HParamSetDomain([true, false])
default_domain(::Val{Float64}) = HParamRealDomain(typemin(Float64), typemax(Float64))
default_domain(::Val{String}) = nothing

_to_proto_hparam_dtype(::Val{Bool}) = HParamDataType.DATA_TYPE_BOOL
_to_proto_hparam_dtype(::Val{String}) = HParamDataType.DATA_TYPE_STRING
_to_proto_hparam_dtype(::Val{Float64}) = HParamDataType.DATA_TYPE_FLOAT64

function _convert_value(v::T) where {T<:Union{String, Bool, Float64}}
    if T == String
        return HValue(HOneOf(:string_value, v))
    elseif T == Bool
        return HValue(HOneOf(:bool_value, v))
    elseif T == Float64
        return HValue(HOneOf(:number_value, v))
    end
end

_convert_hparam_domain(::Nothing) = nothing
_convert_hparam_domain(domain::HParamRealDomain) = HOneOf(:domain_interval, Interval(domain.min_value, domain.max_value))
_convert_hparam_domain(domain::HParamSetDomain) = HOneOf(:domain_discrete, HListValue([_convert_value(v) for v in domain.values]))


function hparam_info(c::HParamConfig)
    domain = if isnothing(c.domain)
        domain = default_domain(Val(datatype))
        domain
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

        c.domain
    end
    
    dtype = _to_proto_hparam_dtype(Val(c.datatype))
    converted_domain = _convert_hparam_domain(domain)
    return HParamInfo(c.name, c.displayname, c.description, dtype, converted_domain)
end
function decode_metric_name(name)
    if contains(name, '/')
        return (split(name, '/', limit=2)...)
    else
        return ("", name)
    end
end
function metric_info(c::MetricConfig)
    dtype = _to_proto_hparam_dtype(Val(c.datatype))
    
    group, tag = decode_metric_name(c.name)
    mname = MetricName(group, tag)
    return MetricInfo(mname, c.displayname, c.description, dtype)
end

function init_hparams!(logger::TBLogger, param_configs::AbstractArray{HParamConfig}, metric_configs::AbstractArray{MetricConfig}; name="", description="", user="")
     # Convert to proto types
    hparam_infos = hparam_info.(param_configs)
    metric_infos = metric_configs.(metric_configs)
    # Create the proto experiment type to serialise
    experiment = Experiment(name, description, user, zero(Float64), hparam_infos, metric_infos)

    # Write this event to a separate file
    filename = add_eventfile(logger, "hparams_config")
    eventfile = logger.all_files[filename]
    write_event(eventfile, experiment)
    nothing
end

function write_hparams!(logger::TBLogger, hparams::Dict{String, Any})
    # Check the input types
    for v in values(hparams)
        @assert typeof(v) <: Union{Bool, String, Float64} "Hyperparameters must be of types String, Bool or Float64"
    end
    # Convert to protobuf types
    hparams = HParams(Dict{String, HValue}(k=>_convert_value(v) for (k,v) in hparams))

    # Write the configuration to a new event file
    filename = add_eventfile(logger, "hparams")
    eventfile = logger.all_files[filename]
    write_event(eventfile, hparams)
    nothing
end

export init_hparams!, write_hparams!, HParamRealDomain, HParamSetDomain, HParamConfig, MetricConfig
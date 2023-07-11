import .tensorboard_plugin_hparams.hparams: Interval, MetricInfo, MetricName, HParamInfo
import .tensorboard_plugin_hparams.hparams: var"#DataType" as HParamDataType
import .tensorboard_plugin_hparams.google.protobuf: ListValue as HListValue, OneOf as HOneOf, Value as HValue
struct HParamRealDomain
    min_value::Float64
    max_value::Float64
end
struct HParamSetDomain{T<:Union{String, Bool, Float64}}
    values::Vector{T}
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


function hparam_info(name, datatype; displayname="", description="", domain=nothing)
    if isnothing(domain)
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
    return HParamInfo(name, displayname, description, dtype, converted_domain)
end
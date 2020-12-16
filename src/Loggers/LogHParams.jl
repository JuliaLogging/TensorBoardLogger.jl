PLUGIN_NAME = "hparams"
PLUGIN_DATA_VERSION = 0

EXPERIMENT_TAG = "_hparams_/experiment"
SESSION_START_INFO_TAG = "_hparams_/session_start_info"


struct DiscreteDomain{T}
    values::AbstractVector{T}
end

DiscreteDomainElem = Union{String, Float64, Bool}

hparams_datatype_sym(::Type{String}) = :DATA_TYPE_STRING
hparams_datatype_sym(::Type{Float64}) = :DATA_TYPE_FLOAT64
hparams_datatype_sym(::Type{Bool}) = :DATA_TYPE_BOOL

function hparams_datatype(domain::DiscreteDomain{T}) where T <: DiscreteDomainElem
    tensorboard.hparams._DataType[hparams_datatype_sym(T)]
end

ProtoBuf.google.protobuf.Value(x::Number) = Value(number_value=x)
ProtoBuf.google.protobuf.Value(x::Bool) = Value(bool_value=x)
ProtoBuf.google.protobuf.Value(x::AbstractString) = Value(string_value=x)
function ProtoBuf.google.protobuf.Value(x)
    @warn "Cannot create a ProtoBuf.google.protobuf.Value of type $(typeof(x)), defaulting to null."
    Value(null_value=Int32(0))
end


function ProtoBuf.google.protobuf.ListValue(domain::DiscreteDomain{T}) where T <: DiscreteDomainElem
    ProtoBuf.google.protobuf.ListValue(
        values = ProtoBuf.google.protobuf.Value.(domain.values)
    )
end

struct IntervalDomain
    min_value::Float64
    max_value::Float64
end

Interval(d::IntervalDomain) = Interval(min_value=d.min_value, max_value=d.max_value)

HParamDomain = Union{IntervalDomain, DiscreteDomain}

struct HParam
    name::AbstractString
    domain::HParamDomain
    display_name::AbstractString
    description::AbstractString
end


function HParamInfo(hparam::HParam)
    domain = hparam.domain
    domain_kwargs = if isa(domain, IntervalDomain)
                        (;domain_interval = Interval(domain))
                    else
                        @assert isa(domain, DiscreteDomain)
                        (_type = hparams_datatype(domain),
                        domain_discrete = ProtoBuf.google.protobuf.ListValue(domain))
                    end
    HParamInfo(;name = hparam.name,
               description = hparam.description,
               display_name = hparam.display_name,
               domain_kwargs...)
end

struct Metric
    tag::AbstractString
    group::AbstractString
    display_name::AbstractString
    description::AbstractString
    dataset_type::Symbol

    function Metric(tag::AbstractString,
                    group::AbstractString,
                    display_name::AbstractString,
                    description::AbstractString,
                    dataset_type::Symbol)
        valid_dataset_types = keys(tensorboard.hparams.DatasetType)
        if dataset_type ∉ valid_dataset_types
            throw(ArgumentError("dataset_type of $(dataset_type) is not one of $(map(string, valid_dataset_types))."))
        else
            new(tag, group, display_name, description, dataset_type)
        end
    end
end

function MetricInfo(metric::Metric)
    MetricInfo(
        name=MetricName(
            group=metric.group,
            tag=metric.tag,
        ),
        display_name=metric.display_name,
        description=metric.description,
        dataset_type=tensorboard.hparams.DatasetType[metric.dataset_type]
    )
end

struct HParamsConfig
    hparams::AbstractVector{HParam}
    metrics::AbstractVector{Metric}
    time_created_secs::Float64
end

function SummaryMetadata(hparams_plugin_data::HParamsPluginData)
    SummaryMetadata(
        plugin_data = SummaryMetadata_PluginData(
            plugin_name = PLUGIN_NAME,
            content = serialize_proto(hparams_plugin_data)
        )
    )
end

function Summary_Value(tag, hparams_plugin_data::HParamsPluginData)
    null_tensor = TensorProto(dtype = _DataType.DT_FLOAT, tensor_shape = TensorShapeProto(dim=[]))
    Summary_Value(
        tag = tag,
        metadata = SummaryMetadata(hparams_plugin_data),
        tensor = null_tensor
    )
end

function log_hparams_config(logger::TBLogger,
                            hparams_config::HParamsConfig;
                            step=nothing)
    summ = SummaryCollection(
        hparams_config_summary(hparams_config)
    )
    write_event(logger.file, make_event(logger, summ, step=step))
end

function hparams_config_summary(config::HParamsConfig)
    Summary_Value(
        EXPERIMENT_TAG,
        HParamsPluginData(
            version = PLUGIN_DATA_VERSION,
            experiment = Experiment(
                hparam_infos = HParamInfo.(config.hparams),
                metric_infos = MetricInfo.(config.metrics),
                time_created_secs = config.time_created_secs
            )
        )
    )
end

function log_hparams(logger::TBLogger,
                     hparams_dict::Dict{HParam, Any},
                     group_name::AbstractString,
                     trial_id::AbstractString,
                     start_time_secs::Union{Float64, Nothing};
                     step=nothing)
    summ = SummaryCollection(
        hparams_summary(hparams_dict,
                        group_name,
                        trial_id,
                        start_time_secs)
    )
    write_event(logger.file, make_event(logger, summ, step=step))
end

function hparams_summary(hparams_dict::Dict{HParam, Any},
                         group_name::AbstractString,
                         trial_id::AbstractString,
                         start_time_secs=Union{Float64, Nothing})
    if start_time_secs === nothing:
        start_time_secs = time()
    end

    Summary_Value(
        SESSION_START_INFO_TAG,
        HParamsPluginData(
            version = PLUGIN_DATA_VERSION,
            session_start_info = SessionStartInfo(
                group_name = group_name,
                start_time_secs = start_time_secs,
                hparams = Dict(
                    hparam.name => ProtoBuf.google.protobuf.Value(val)
                    for (hparam, val) ∈ hparams_dict
                )
            )
        )
    )
end


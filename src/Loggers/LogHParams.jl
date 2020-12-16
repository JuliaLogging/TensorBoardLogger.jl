PLUGIN_NAME = "hparams"
PLUGIN_DATA_VERSION = 0

EXPERIMENT_TAG = "_hparams_/experiment"
SESSION_START_INFO_TAG = "_hparams_/session_start_info"
SESSION_END_INFO_TAG = "_hparams_/session_end_info"


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

function ProtoBuf.google.protobuf.ListValue(domain::DiscreteDomain{T}) where T <: DiscreteDomainElem
    ProtoBuf.google.protobuf.ListValue(
        values = ProtoBuf.google.protobuf.Value.(domain.values)
    )
end

HParamDomain = Union{Interval, DiscreteDomain}

struct HParam
    name::AbstractString
    domain::HParamDomain
    display_name::AbstractString
    description::AbstractString
end

HParamValue = Union{String, Int64, Float64, Bool}


function HParamInfo(hparam::HParam)
    kwargs = (
        name = hparam.name,
        description = hparam.description,
        display_name = hparam.display_name,
    )
    domain = hparam.domain
    if isa(domain, Interval)
        HParamInfo(;
                   domain_interval = domain,
                   kwargs...
                   )
    elseif isa(domain, DiscreteDomain)
        HParamInfo(;
                   _type = hparams_datatype(domain),
                   domain_discrete = ProtoBuf.google.protobuf.ListValue(domain),
                   kwargs...
                   )
    end
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

function hparams_summary(hparams_dict::Dict{HParam, HParamValue},
                         trial_id::AbstractString,
                         group_name::AbstractString,
                         start_time_secs=Union{Float64, Nothing})
    if isnothing(start_time_secs)
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

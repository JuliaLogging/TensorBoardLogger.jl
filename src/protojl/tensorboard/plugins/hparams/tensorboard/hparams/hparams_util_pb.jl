# Autogenerated using ProtoBuf.jl v1.0.11 on 2023-06-19T18:18:25.011
# original file: /home/lior/TensorBoardLogger.jl/gen/proto/tensorboard/plugins/hparams/hparams_util.proto (proto3 syntax)

import ProtoBuf as PB
using ProtoBuf: OneOf
using ProtoBuf.EnumX: @enumx

export MetricInfosList, HParams, HParamInfosList

struct MetricInfosList
    metric_infos::Vector{MetricInfo}
end
PB.default_values(::Type{MetricInfosList}) = (;metric_infos = Vector{MetricInfo}())
PB.field_numbers(::Type{MetricInfosList}) = (;metric_infos = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:MetricInfosList})
    metric_infos = PB.BufferedVector{MetricInfo}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, metric_infos)
        else
            PB.skip(d, wire_type)
        end
    end
    return MetricInfosList(metric_infos[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::MetricInfosList)
    initpos = position(e.io)
    !isempty(x.metric_infos) && PB.encode(e, 1, x.metric_infos)
    return position(e.io) - initpos
end
function PB._encoded_size(x::MetricInfosList)
    encoded_size = 0
    !isempty(x.metric_infos) && (encoded_size += PB._encoded_size(x.metric_infos, 1))
    return encoded_size
end

struct HParams
    hparams::Dict{String,google.protobuf.Value}
end
PB.default_values(::Type{HParams}) = (;hparams = Dict{String,google.protobuf.Value}())
PB.field_numbers(::Type{HParams}) = (;hparams = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:HParams})
    hparams = Dict{String,google.protobuf.Value}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, hparams)
        else
            PB.skip(d, wire_type)
        end
    end
    return HParams(hparams)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::HParams)
    initpos = position(e.io)
    !isempty(x.hparams) && PB.encode(e, 1, x.hparams)
    return position(e.io) - initpos
end
function PB._encoded_size(x::HParams)
    encoded_size = 0
    !isempty(x.hparams) && (encoded_size += PB._encoded_size(x.hparams, 1))
    return encoded_size
end

struct HParamInfosList
    hparam_infos::Vector{HParamInfo}
end
PB.default_values(::Type{HParamInfosList}) = (;hparam_infos = Vector{HParamInfo}())
PB.field_numbers(::Type{HParamInfosList}) = (;hparam_infos = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:HParamInfosList})
    hparam_infos = PB.BufferedVector{HParamInfo}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, hparam_infos)
        else
            PB.skip(d, wire_type)
        end
    end
    return HParamInfosList(hparam_infos[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::HParamInfosList)
    initpos = position(e.io)
    !isempty(x.hparam_infos) && PB.encode(e, 1, x.hparam_infos)
    return position(e.io) - initpos
end
function PB._encoded_size(x::HParamInfosList)
    encoded_size = 0
    !isempty(x.hparam_infos) && (encoded_size += PB._encoded_size(x.hparam_infos, 1))
    return encoded_size
end
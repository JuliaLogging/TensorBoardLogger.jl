# Autogenerated using ProtoBuf.jl v1.0.11 on 2023-08-08T14:34:18.374
# original path: protojl/tensorboard/plugins/text/tensorboard/plugin_data.proto (proto3 syntax)

import ProtoBuf as PB
using ProtoBuf: OneOf
using ProtoBuf.EnumX: @enumx

export TextPluginData

struct TextPluginData
    version::Int32
end
PB.default_values(::Type{TextPluginData}) = (;version = zero(Int32))
PB.field_numbers(::Type{TextPluginData}) = (;version = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:TextPluginData})
    version = zero(Int32)
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            version = PB.decode(d, Int32)
        else
            PB.skip(d, wire_type)
        end
    end
    return TextPluginData(version)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::TextPluginData)
    initpos = position(e.io)
    x.version != zero(Int32) && PB.encode(e, 1, x.version)
    return position(e.io) - initpos
end
function PB._encoded_size(x::TextPluginData)
    encoded_size = 0
    x.version != zero(Int32) && (encoded_size += PB._encoded_size(x.version, 1))
    return encoded_size
end
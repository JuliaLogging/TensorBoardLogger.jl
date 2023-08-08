# Autogenerated using ProtoBuf.jl v1.0.11 on 2023-08-08T14:37:02.037
# original path: proto/tensorboard/google/protobuf/wrappers.proto (proto3 syntax)

import ProtoBuf as PB
using ProtoBuf: OneOf
using ProtoBuf.EnumX: @enumx

export BoolValue, Int64Value, FloatValue, Int32Value, DoubleValue, UInt64Value, UInt32Value
export BytesValue, StringValue

struct BoolValue
    value::Bool
end
PB.default_values(::Type{BoolValue}) = (;value = false)
PB.field_numbers(::Type{BoolValue}) = (;value = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:BoolValue})
    value = false
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            value = PB.decode(d, Bool)
        else
            PB.skip(d, wire_type)
        end
    end
    return BoolValue(value)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::BoolValue)
    initpos = position(e.io)
    x.value != false && PB.encode(e, 1, x.value)
    return position(e.io) - initpos
end
function PB._encoded_size(x::BoolValue)
    encoded_size = 0
    x.value != false && (encoded_size += PB._encoded_size(x.value, 1))
    return encoded_size
end

struct Int64Value
    value::Int64
end
PB.default_values(::Type{Int64Value}) = (;value = zero(Int64))
PB.field_numbers(::Type{Int64Value}) = (;value = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:Int64Value})
    value = zero(Int64)
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            value = PB.decode(d, Int64)
        else
            PB.skip(d, wire_type)
        end
    end
    return Int64Value(value)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::Int64Value)
    initpos = position(e.io)
    x.value != zero(Int64) && PB.encode(e, 1, x.value)
    return position(e.io) - initpos
end
function PB._encoded_size(x::Int64Value)
    encoded_size = 0
    x.value != zero(Int64) && (encoded_size += PB._encoded_size(x.value, 1))
    return encoded_size
end

struct FloatValue
    value::Float32
end
PB.default_values(::Type{FloatValue}) = (;value = zero(Float32))
PB.field_numbers(::Type{FloatValue}) = (;value = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:FloatValue})
    value = zero(Float32)
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            value = PB.decode(d, Float32)
        else
            PB.skip(d, wire_type)
        end
    end
    return FloatValue(value)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::FloatValue)
    initpos = position(e.io)
    x.value != zero(Float32) && PB.encode(e, 1, x.value)
    return position(e.io) - initpos
end
function PB._encoded_size(x::FloatValue)
    encoded_size = 0
    x.value != zero(Float32) && (encoded_size += PB._encoded_size(x.value, 1))
    return encoded_size
end

struct Int32Value
    value::Int32
end
PB.default_values(::Type{Int32Value}) = (;value = zero(Int32))
PB.field_numbers(::Type{Int32Value}) = (;value = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:Int32Value})
    value = zero(Int32)
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            value = PB.decode(d, Int32)
        else
            PB.skip(d, wire_type)
        end
    end
    return Int32Value(value)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::Int32Value)
    initpos = position(e.io)
    x.value != zero(Int32) && PB.encode(e, 1, x.value)
    return position(e.io) - initpos
end
function PB._encoded_size(x::Int32Value)
    encoded_size = 0
    x.value != zero(Int32) && (encoded_size += PB._encoded_size(x.value, 1))
    return encoded_size
end

struct DoubleValue
    value::Float64
end
PB.default_values(::Type{DoubleValue}) = (;value = zero(Float64))
PB.field_numbers(::Type{DoubleValue}) = (;value = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:DoubleValue})
    value = zero(Float64)
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            value = PB.decode(d, Float64)
        else
            PB.skip(d, wire_type)
        end
    end
    return DoubleValue(value)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::DoubleValue)
    initpos = position(e.io)
    x.value != zero(Float64) && PB.encode(e, 1, x.value)
    return position(e.io) - initpos
end
function PB._encoded_size(x::DoubleValue)
    encoded_size = 0
    x.value != zero(Float64) && (encoded_size += PB._encoded_size(x.value, 1))
    return encoded_size
end

struct UInt64Value
    value::UInt64
end
PB.default_values(::Type{UInt64Value}) = (;value = zero(UInt64))
PB.field_numbers(::Type{UInt64Value}) = (;value = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:UInt64Value})
    value = zero(UInt64)
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            value = PB.decode(d, UInt64)
        else
            PB.skip(d, wire_type)
        end
    end
    return UInt64Value(value)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::UInt64Value)
    initpos = position(e.io)
    x.value != zero(UInt64) && PB.encode(e, 1, x.value)
    return position(e.io) - initpos
end
function PB._encoded_size(x::UInt64Value)
    encoded_size = 0
    x.value != zero(UInt64) && (encoded_size += PB._encoded_size(x.value, 1))
    return encoded_size
end

struct UInt32Value
    value::UInt32
end
PB.default_values(::Type{UInt32Value}) = (;value = zero(UInt32))
PB.field_numbers(::Type{UInt32Value}) = (;value = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:UInt32Value})
    value = zero(UInt32)
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            value = PB.decode(d, UInt32)
        else
            PB.skip(d, wire_type)
        end
    end
    return UInt32Value(value)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::UInt32Value)
    initpos = position(e.io)
    x.value != zero(UInt32) && PB.encode(e, 1, x.value)
    return position(e.io) - initpos
end
function PB._encoded_size(x::UInt32Value)
    encoded_size = 0
    x.value != zero(UInt32) && (encoded_size += PB._encoded_size(x.value, 1))
    return encoded_size
end

struct BytesValue
    value::Vector{UInt8}
end
PB.default_values(::Type{BytesValue}) = (;value = UInt8[])
PB.field_numbers(::Type{BytesValue}) = (;value = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:BytesValue})
    value = UInt8[]
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            value = PB.decode(d, Vector{UInt8})
        else
            PB.skip(d, wire_type)
        end
    end
    return BytesValue(value)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::BytesValue)
    initpos = position(e.io)
    !isempty(x.value) && PB.encode(e, 1, x.value)
    return position(e.io) - initpos
end
function PB._encoded_size(x::BytesValue)
    encoded_size = 0
    !isempty(x.value) && (encoded_size += PB._encoded_size(x.value, 1))
    return encoded_size
end

struct StringValue
    value::String
end
PB.default_values(::Type{StringValue}) = (;value = "")
PB.field_numbers(::Type{StringValue}) = (;value = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:StringValue})
    value = ""
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            value = PB.decode(d, String)
        else
            PB.skip(d, wire_type)
        end
    end
    return StringValue(value)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::StringValue)
    initpos = position(e.io)
    !isempty(x.value) && PB.encode(e, 1, x.value)
    return position(e.io) - initpos
end
function PB._encoded_size(x::StringValue)
    encoded_size = 0
    !isempty(x.value) && (encoded_size += PB._encoded_size(x.value, 1))
    return encoded_size
end
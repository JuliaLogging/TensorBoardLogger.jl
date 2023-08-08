# Autogenerated using ProtoBuf.jl v1.0.11 on 2023-08-08T14:34:18.322
# original path: protojl/tensorboard/tensorboard/resource_handle.proto (proto3 syntax)

import ProtoBuf as PB
using ProtoBuf: OneOf
using ProtoBuf.EnumX: @enumx

export var"ResourceHandleProto.DtypeAndShape", ResourceHandleProto

struct var"ResourceHandleProto.DtypeAndShape"
    dtype::var"#DataType".T
    shape::Union{Nothing,TensorShapeProto}
end
PB.default_values(::Type{var"ResourceHandleProto.DtypeAndShape"}) = (;dtype = var"#DataType".DT_INVALID, shape = nothing)
PB.field_numbers(::Type{var"ResourceHandleProto.DtypeAndShape"}) = (;dtype = 1, shape = 2)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:var"ResourceHandleProto.DtypeAndShape"})
    dtype = var"#DataType".DT_INVALID
    shape = Ref{Union{Nothing,TensorShapeProto}}(nothing)
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            dtype = PB.decode(d, var"#DataType".T)
        elseif field_number == 2
            PB.decode!(d, shape)
        else
            PB.skip(d, wire_type)
        end
    end
    return var"ResourceHandleProto.DtypeAndShape"(dtype, shape[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::var"ResourceHandleProto.DtypeAndShape")
    initpos = position(e.io)
    x.dtype != var"#DataType".DT_INVALID && PB.encode(e, 1, x.dtype)
    !isnothing(x.shape) && PB.encode(e, 2, x.shape)
    return position(e.io) - initpos
end
function PB._encoded_size(x::var"ResourceHandleProto.DtypeAndShape")
    encoded_size = 0
    x.dtype != var"#DataType".DT_INVALID && (encoded_size += PB._encoded_size(x.dtype, 1))
    !isnothing(x.shape) && (encoded_size += PB._encoded_size(x.shape, 2))
    return encoded_size
end

struct ResourceHandleProto
    device::String
    container::String
    name::String
    hash_code::UInt64
    maybe_type_name::String
    dtypes_and_shapes::Vector{var"ResourceHandleProto.DtypeAndShape"}
end
PB.reserved_fields(::Type{ResourceHandleProto}) = (names = String[], numbers = Union{Int,UnitRange{Int}}[7])
PB.default_values(::Type{ResourceHandleProto}) = (;device = "", container = "", name = "", hash_code = zero(UInt64), maybe_type_name = "", dtypes_and_shapes = Vector{var"ResourceHandleProto.DtypeAndShape"}())
PB.field_numbers(::Type{ResourceHandleProto}) = (;device = 1, container = 2, name = 3, hash_code = 4, maybe_type_name = 5, dtypes_and_shapes = 6)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:ResourceHandleProto})
    device = ""
    container = ""
    name = ""
    hash_code = zero(UInt64)
    maybe_type_name = ""
    dtypes_and_shapes = PB.BufferedVector{var"ResourceHandleProto.DtypeAndShape"}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            device = PB.decode(d, String)
        elseif field_number == 2
            container = PB.decode(d, String)
        elseif field_number == 3
            name = PB.decode(d, String)
        elseif field_number == 4
            hash_code = PB.decode(d, UInt64)
        elseif field_number == 5
            maybe_type_name = PB.decode(d, String)
        elseif field_number == 6
            PB.decode!(d, dtypes_and_shapes)
        else
            PB.skip(d, wire_type)
        end
    end
    return ResourceHandleProto(device, container, name, hash_code, maybe_type_name, dtypes_and_shapes[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::ResourceHandleProto)
    initpos = position(e.io)
    !isempty(x.device) && PB.encode(e, 1, x.device)
    !isempty(x.container) && PB.encode(e, 2, x.container)
    !isempty(x.name) && PB.encode(e, 3, x.name)
    x.hash_code != zero(UInt64) && PB.encode(e, 4, x.hash_code)
    !isempty(x.maybe_type_name) && PB.encode(e, 5, x.maybe_type_name)
    !isempty(x.dtypes_and_shapes) && PB.encode(e, 6, x.dtypes_and_shapes)
    return position(e.io) - initpos
end
function PB._encoded_size(x::ResourceHandleProto)
    encoded_size = 0
    !isempty(x.device) && (encoded_size += PB._encoded_size(x.device, 1))
    !isempty(x.container) && (encoded_size += PB._encoded_size(x.container, 2))
    !isempty(x.name) && (encoded_size += PB._encoded_size(x.name, 3))
    x.hash_code != zero(UInt64) && (encoded_size += PB._encoded_size(x.hash_code, 4))
    !isempty(x.maybe_type_name) && (encoded_size += PB._encoded_size(x.maybe_type_name, 5))
    !isempty(x.dtypes_and_shapes) && (encoded_size += PB._encoded_size(x.dtypes_and_shapes, 6))
    return encoded_size
end
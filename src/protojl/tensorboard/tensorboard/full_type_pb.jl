# Autogenerated using ProtoBuf.jl v1.0.11 on 2023-08-09T10:18:18.293
# original file: proto/tensorboard/tensorboard/full_type.proto (proto3 syntax)

import ProtoBuf as PB
using ProtoBuf: OneOf
using ProtoBuf.EnumX: @enumx

export FullTypeId, FullTypeDef

# Abstract types to help resolve mutually recursive definitions
abstract type var"##AbstractFullTypeDef" end


@enumx FullTypeId TFT_UNSET=0 TFT_VAR=1 TFT_ANY=2 TFT_PRODUCT=3 TFT_NAMED=4 TFT_FOR_EACH=20 TFT_CALLABLE=100 TFT_TENSOR=1000 TFT_ARRAY=1001 TFT_OPTIONAL=1002 TFT_LITERAL=1003 TFT_ENCODED=1004 TFT_SHAPE_TENSOR=1005 TFT_BOOL=200 TFT_UINT8=201 TFT_UINT16=202 TFT_UINT32=203 TFT_UINT64=204 TFT_INT8=205 TFT_INT16=206 TFT_INT32=207 TFT_INT64=208 TFT_HALF=209 TFT_FLOAT=210 TFT_DOUBLE=211 TFT_BFLOAT16=215 TFT_COMPLEX64=212 TFT_COMPLEX128=213 TFT_STRING=214 TFT_DATASET=10102 TFT_RAGGED=10103 TFT_ITERATOR=10104 TFT_MUTEX_LOCK=10202 TFT_LEGACY_VARIANT=10203

struct FullTypeDef <: var"##AbstractFullTypeDef"
    type_id::FullTypeId.T
    args::Vector{<:FullTypeDef}
    attr::Union{Nothing,OneOf{<:Union{String,Int64}}}
end
PB.oneof_field_types(::Type{FullTypeDef}) = (;
    attr = (;s=String, i=Int64),
)
PB.default_values(::Type{FullTypeDef}) = (;type_id = FullTypeId.TFT_UNSET, args = Vector{FullTypeDef}(), s = "", i = zero(Int64))
PB.field_numbers(::Type{FullTypeDef}) = (;type_id = 1, args = 2, s = 3, i = 4)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:FullTypeDef})
    type_id = FullTypeId.TFT_UNSET
    args = PB.BufferedVector{FullTypeDef}()
    attr = nothing
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            type_id = PB.decode(d, FullTypeId.T)
        elseif field_number == 2
            PB.decode!(d, args)
        elseif field_number == 3
            attr = OneOf(:s, PB.decode(d, String))
        elseif field_number == 4
            attr = OneOf(:i, PB.decode(d, Int64))
        else
            PB.skip(d, wire_type)
        end
    end
    return FullTypeDef(type_id, args[], attr)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::FullTypeDef)
    initpos = position(e.io)
    x.type_id != FullTypeId.TFT_UNSET && PB.encode(e, 1, x.type_id)
    !isempty(x.args) && PB.encode(e, 2, x.args)
    if isnothing(x.attr);
    elseif x.attr.name === :s
        PB.encode(e, 3, x.attr[]::String)
    elseif x.attr.name === :i
        PB.encode(e, 4, x.attr[]::Int64)
    end
    return position(e.io) - initpos
end
function PB._encoded_size(x::FullTypeDef)
    encoded_size = 0
    x.type_id != FullTypeId.TFT_UNSET && (encoded_size += PB._encoded_size(x.type_id, 1))
    !isempty(x.args) && (encoded_size += PB._encoded_size(x.args, 2))
    if isnothing(x.attr);
    elseif x.attr.name === :s
        encoded_size += PB._encoded_size(x.attr[]::String, 3)
    elseif x.attr.name === :i
        encoded_size += PB._encoded_size(x.attr[]::Int64, 4)
    end
    return encoded_size
end
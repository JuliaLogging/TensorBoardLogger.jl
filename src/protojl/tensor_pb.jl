# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct TensorProto <: ProtoType
    dtype::Int32
    tensor_shape::TensorShapeProto
    version_number::Int32
    tensor_content::Array{UInt8,1}
    half_val::Base.Vector{Int32}
    float_val::Base.Vector{Float32}
    double_val::Base.Vector{Float64}
    int_val::Base.Vector{Int32}
    string_val::Base.Vector{Array{UInt8,1}}
    scomplex_val::Base.Vector{Float32}
    int64_val::Base.Vector{Int64}
    bool_val::Base.Vector{Bool}
    dcomplex_val::Base.Vector{Float64}
    resource_handle_val::Base.Vector{ResourceHandleProto}
    TensorProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct TensorProto
const __fnum_TensorProto = Int[1,2,3,4,13,5,6,7,8,9,10,11,12,14]
const __pack_TensorProto = Symbol[:half_val,:float_val,:double_val,:int_val,:scomplex_val,:int64_val,:bool_val,:dcomplex_val]
meta(t::Type{TensorProto}) = meta(t, ProtoBuf.DEF_REQ, __fnum_TensorProto, ProtoBuf.DEF_VAL, true, __pack_TensorProto, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

export TensorProto

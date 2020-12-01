# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct TensorProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function TensorProto(; kwargs...)
        obj = new(meta(TensorProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct TensorProto (has cyclic type dependency)
const __meta_TensorProto = Ref{ProtoMeta}()
function meta(::Type{TensorProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_TensorProto)
            __meta_TensorProto[] = target = ProtoMeta(TensorProto)
            fnum = Int[1,2,3,4,13,5,6,7,8,9,10,11,12,14,15,16,17]
            pack = Symbol[:half_val,:float_val,:double_val,:int_val,:scomplex_val,:int64_val,:bool_val,:dcomplex_val,:uint32_val,:uint64_val]
            allflds = Pair{Symbol,Union{Type,String}}[:dtype => Int32, :tensor_shape => TensorShapeProto, :version_number => Int32, :tensor_content => Vector{UInt8}, :half_val => Base.Vector{Int32}, :float_val => Base.Vector{Float32}, :double_val => Base.Vector{Float64}, :int_val => Base.Vector{Int32}, :string_val => Base.Vector{Vector{UInt8}}, :scomplex_val => Base.Vector{Float32}, :int64_val => Base.Vector{Int64}, :bool_val => Base.Vector{Bool}, :dcomplex_val => Base.Vector{Float64}, :resource_handle_val => Base.Vector{ResourceHandleProto}, :variant_val => "Base.Vector{VariantTensorDataProto}", :uint32_val => Base.Vector{UInt32}, :uint64_val => Base.Vector{UInt64}]
            meta(target, TensorProto, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, pack, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_TensorProto[]
    end
end
function Base.getproperty(obj::TensorProto, name::Symbol)
    if name === :dtype
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :tensor_shape
        return (obj.__protobuf_jl_internal_values[name])::TensorShapeProto
    elseif name === :version_number
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :tensor_content
        return (obj.__protobuf_jl_internal_values[name])::Vector{UInt8}
    elseif name === :half_val
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    elseif name === :float_val
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Float32}
    elseif name === :double_val
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Float64}
    elseif name === :int_val
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    elseif name === :string_val
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Vector{UInt8}}
    elseif name === :scomplex_val
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Float32}
    elseif name === :int64_val
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int64}
    elseif name === :bool_val
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Bool}
    elseif name === :dcomplex_val
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Float64}
    elseif name === :resource_handle_val
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ResourceHandleProto}
    elseif name === :variant_val
        return (obj.__protobuf_jl_internal_values[name])::Any
    elseif name === :uint32_val
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{UInt32}
    elseif name === :uint64_val
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{UInt64}
    else
        getfield(obj, name)
    end
end

mutable struct VariantTensorDataProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function VariantTensorDataProto(; kwargs...)
        obj = new(meta(VariantTensorDataProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct VariantTensorDataProto (has cyclic type dependency)
const __meta_VariantTensorDataProto = Ref{ProtoMeta}()
function meta(::Type{VariantTensorDataProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_VariantTensorDataProto)
            __meta_VariantTensorDataProto[] = target = ProtoMeta(VariantTensorDataProto)
            allflds = Pair{Symbol,Union{Type,String}}[:type_name => AbstractString, :metadata => Vector{UInt8}, :tensors => Base.Vector{TensorProto}]
            meta(target, VariantTensorDataProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_VariantTensorDataProto[]
    end
end
function Base.getproperty(obj::VariantTensorDataProto, name::Symbol)
    if name === :type_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :metadata
        return (obj.__protobuf_jl_internal_values[name])::Vector{UInt8}
    elseif name === :tensors
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{TensorProto}
    else
        getfield(obj, name)
    end
end

export TensorProto, VariantTensorDataProto, TensorProto, VariantTensorDataProto

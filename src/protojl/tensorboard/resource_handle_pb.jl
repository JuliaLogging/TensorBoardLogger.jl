# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct ResourceHandleProto_DtypeAndShape <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ResourceHandleProto_DtypeAndShape(; kwargs...)
        obj = new(meta(ResourceHandleProto_DtypeAndShape), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ResourceHandleProto_DtypeAndShape
const __meta_ResourceHandleProto_DtypeAndShape = Ref{ProtoMeta}()
function meta(::Type{ResourceHandleProto_DtypeAndShape})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ResourceHandleProto_DtypeAndShape)
            __meta_ResourceHandleProto_DtypeAndShape[] = target = ProtoMeta(ResourceHandleProto_DtypeAndShape)
            allflds = Pair{Symbol,Union{Type,String}}[:dtype => Int32, :shape => TensorShapeProto]
            meta(target, ResourceHandleProto_DtypeAndShape, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ResourceHandleProto_DtypeAndShape[]
    end
end
function Base.getproperty(obj::ResourceHandleProto_DtypeAndShape, name::Symbol)
    if name === :dtype
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :shape
        return (obj.__protobuf_jl_internal_values[name])::TensorShapeProto
    else
        getfield(obj, name)
    end
end

mutable struct ResourceHandleProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ResourceHandleProto(; kwargs...)
        obj = new(meta(ResourceHandleProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ResourceHandleProto
const __meta_ResourceHandleProto = Ref{ProtoMeta}()
function meta(::Type{ResourceHandleProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ResourceHandleProto)
            __meta_ResourceHandleProto[] = target = ProtoMeta(ResourceHandleProto)
            allflds = Pair{Symbol,Union{Type,String}}[:device => AbstractString, :container => AbstractString, :name => AbstractString, :hash_code => UInt64, :maybe_type_name => AbstractString, :dtypes_and_shapes => Base.Vector{ResourceHandleProto_DtypeAndShape}]
            meta(target, ResourceHandleProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ResourceHandleProto[]
    end
end
function Base.getproperty(obj::ResourceHandleProto, name::Symbol)
    if name === :device
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :container
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :hash_code
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :maybe_type_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :dtypes_and_shapes
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ResourceHandleProto_DtypeAndShape}
    else
        getfield(obj, name)
    end
end

export ResourceHandleProto_DtypeAndShape, ResourceHandleProto

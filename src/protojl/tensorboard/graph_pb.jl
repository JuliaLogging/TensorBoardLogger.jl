# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct GraphDef <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function GraphDef(; kwargs...)
        obj = new(meta(GraphDef), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct GraphDef
const __meta_GraphDef = Ref{ProtoMeta}()
function meta(::Type{GraphDef})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GraphDef)
            __meta_GraphDef[] = target = ProtoMeta(GraphDef)
            fnum = Int[1,4,3,2]
            allflds = Pair{Symbol,Union{Type,String}}[:node => Base.Vector{NodeDef}, :versions => VersionDef, :version => Int32, :library => FunctionDefLibrary]
            meta(target, GraphDef, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GraphDef[]
    end
end
function Base.getproperty(obj::GraphDef, name::Symbol)
    if name === :node
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{NodeDef}
    elseif name === :versions
        return (obj.__protobuf_jl_internal_values[name])::VersionDef
    elseif name === :version
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :library
        return (obj.__protobuf_jl_internal_values[name])::FunctionDefLibrary
    else
        getfield(obj, name)
    end
end

export GraphDef

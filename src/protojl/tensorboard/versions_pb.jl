# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct VersionDef <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function VersionDef(; kwargs...)
        obj = new(meta(VersionDef), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct VersionDef
const __meta_VersionDef = Ref{ProtoMeta}()
function meta(::Type{VersionDef})
    ProtoBuf.metalock() do
        if !isassigned(__meta_VersionDef)
            __meta_VersionDef[] = target = ProtoMeta(VersionDef)
            pack = Symbol[:bad_consumers]
            allflds = Pair{Symbol,Union{Type,String}}[:producer => Int32, :min_consumer => Int32, :bad_consumers => Base.Vector{Int32}]
            meta(target, VersionDef, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, pack, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_VersionDef[]
    end
end
function Base.getproperty(obj::VersionDef, name::Symbol)
    if name === :producer
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :min_consumer
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :bad_consumers
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    else
        getfield(obj, name)
    end
end

export VersionDef

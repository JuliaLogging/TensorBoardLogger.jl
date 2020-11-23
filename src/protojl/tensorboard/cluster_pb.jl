# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct JobDef_TasksEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function JobDef_TasksEntry(; kwargs...)
        obj = new(meta(JobDef_TasksEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct JobDef_TasksEntry (mapentry)
const __meta_JobDef_TasksEntry = Ref{ProtoMeta}()
function meta(::Type{JobDef_TasksEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_JobDef_TasksEntry)
            __meta_JobDef_TasksEntry[] = target = ProtoMeta(JobDef_TasksEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => Int32, :value => AbstractString]
            meta(target, JobDef_TasksEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_JobDef_TasksEntry[]
    end
end
function Base.getproperty(obj::JobDef_TasksEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct JobDef <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function JobDef(; kwargs...)
        obj = new(meta(JobDef), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct JobDef
const __meta_JobDef = Ref{ProtoMeta}()
function meta(::Type{JobDef})
    ProtoBuf.metalock() do
        if !isassigned(__meta_JobDef)
            __meta_JobDef[] = target = ProtoMeta(JobDef)
            allflds = Pair{Symbol,Union{Type,String}}[:name => AbstractString, :tasks => Base.Dict{Int32,AbstractString}]
            meta(target, JobDef, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_JobDef[]
    end
end
function Base.getproperty(obj::JobDef, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :tasks
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{Int32,AbstractString}
    else
        getfield(obj, name)
    end
end

mutable struct ClusterDef <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ClusterDef(; kwargs...)
        obj = new(meta(ClusterDef), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ClusterDef
const __meta_ClusterDef = Ref{ProtoMeta}()
function meta(::Type{ClusterDef})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ClusterDef)
            __meta_ClusterDef[] = target = ProtoMeta(ClusterDef)
            allflds = Pair{Symbol,Union{Type,String}}[:job => Base.Vector{JobDef}]
            meta(target, ClusterDef, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ClusterDef[]
    end
end
function Base.getproperty(obj::ClusterDef, name::Symbol)
    if name === :job
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{JobDef}
    else
        getfield(obj, name)
    end
end

export JobDef_TasksEntry, JobDef, ClusterDef
# mapentries: "JobDef_TasksEntry" => ("Int32", "AbstractString")

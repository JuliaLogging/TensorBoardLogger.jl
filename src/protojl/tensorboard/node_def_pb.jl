# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct NodeDef_AttrEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function NodeDef_AttrEntry(; kwargs...)
        obj = new(meta(NodeDef_AttrEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct NodeDef_AttrEntry (mapentry)
const __meta_NodeDef_AttrEntry = Ref{ProtoMeta}()
function meta(::Type{NodeDef_AttrEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_NodeDef_AttrEntry)
            __meta_NodeDef_AttrEntry[] = target = ProtoMeta(NodeDef_AttrEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => AttrValue]
            meta(target, NodeDef_AttrEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_NodeDef_AttrEntry[]
    end
end
function Base.getproperty(obj::NodeDef_AttrEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::AttrValue
    else
        getfield(obj, name)
    end
end

mutable struct NodeDef_ExperimentalDebugInfo <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function NodeDef_ExperimentalDebugInfo(; kwargs...)
        obj = new(meta(NodeDef_ExperimentalDebugInfo), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct NodeDef_ExperimentalDebugInfo
const __meta_NodeDef_ExperimentalDebugInfo = Ref{ProtoMeta}()
function meta(::Type{NodeDef_ExperimentalDebugInfo})
    ProtoBuf.metalock() do
        if !isassigned(__meta_NodeDef_ExperimentalDebugInfo)
            __meta_NodeDef_ExperimentalDebugInfo[] = target = ProtoMeta(NodeDef_ExperimentalDebugInfo)
            allflds = Pair{Symbol,Union{Type,String}}[:original_node_names => Base.Vector{AbstractString}, :original_func_names => Base.Vector{AbstractString}]
            meta(target, NodeDef_ExperimentalDebugInfo, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_NodeDef_ExperimentalDebugInfo[]
    end
end
function Base.getproperty(obj::NodeDef_ExperimentalDebugInfo, name::Symbol)
    if name === :original_node_names
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :original_func_names
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    else
        getfield(obj, name)
    end
end

mutable struct NodeDef <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function NodeDef(; kwargs...)
        obj = new(meta(NodeDef), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct NodeDef
const __meta_NodeDef = Ref{ProtoMeta}()
function meta(::Type{NodeDef})
    ProtoBuf.metalock() do
        if !isassigned(__meta_NodeDef)
            __meta_NodeDef[] = target = ProtoMeta(NodeDef)
            allflds = Pair{Symbol,Union{Type,String}}[:name => AbstractString, :op => AbstractString, :input => Base.Vector{AbstractString}, :device => AbstractString, :attr => Base.Dict{AbstractString,AttrValue}, :experimental_debug_info => NodeDef_ExperimentalDebugInfo]
            meta(target, NodeDef, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_NodeDef[]
    end
end
function Base.getproperty(obj::NodeDef, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :op
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :input
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :device
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :attr
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{AbstractString,AttrValue}
    elseif name === :experimental_debug_info
        return (obj.__protobuf_jl_internal_values[name])::NodeDef_ExperimentalDebugInfo
    else
        getfield(obj, name)
    end
end

export NodeDef_AttrEntry, NodeDef_ExperimentalDebugInfo, NodeDef
# mapentries: "NodeDef_AttrEntry" => ("AbstractString", "AttrValue")

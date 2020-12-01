# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct TrackableObjectGraph_TrackableObject_ObjectReference <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function TrackableObjectGraph_TrackableObject_ObjectReference(; kwargs...)
        obj = new(meta(TrackableObjectGraph_TrackableObject_ObjectReference), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct TrackableObjectGraph_TrackableObject_ObjectReference
const __meta_TrackableObjectGraph_TrackableObject_ObjectReference = Ref{ProtoMeta}()
function meta(::Type{TrackableObjectGraph_TrackableObject_ObjectReference})
    ProtoBuf.metalock() do
        if !isassigned(__meta_TrackableObjectGraph_TrackableObject_ObjectReference)
            __meta_TrackableObjectGraph_TrackableObject_ObjectReference[] = target = ProtoMeta(TrackableObjectGraph_TrackableObject_ObjectReference)
            allflds = Pair{Symbol,Union{Type,String}}[:node_id => Int32, :local_name => AbstractString]
            meta(target, TrackableObjectGraph_TrackableObject_ObjectReference, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_TrackableObjectGraph_TrackableObject_ObjectReference[]
    end
end
function Base.getproperty(obj::TrackableObjectGraph_TrackableObject_ObjectReference, name::Symbol)
    if name === :node_id
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :local_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct TrackableObjectGraph_TrackableObject_SerializedTensor <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function TrackableObjectGraph_TrackableObject_SerializedTensor(; kwargs...)
        obj = new(meta(TrackableObjectGraph_TrackableObject_SerializedTensor), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct TrackableObjectGraph_TrackableObject_SerializedTensor
const __meta_TrackableObjectGraph_TrackableObject_SerializedTensor = Ref{ProtoMeta}()
function meta(::Type{TrackableObjectGraph_TrackableObject_SerializedTensor})
    ProtoBuf.metalock() do
        if !isassigned(__meta_TrackableObjectGraph_TrackableObject_SerializedTensor)
            __meta_TrackableObjectGraph_TrackableObject_SerializedTensor[] = target = ProtoMeta(TrackableObjectGraph_TrackableObject_SerializedTensor)
            allflds = Pair{Symbol,Union{Type,String}}[:name => AbstractString, :full_name => AbstractString, :checkpoint_key => AbstractString, :optional_restore => Bool]
            meta(target, TrackableObjectGraph_TrackableObject_SerializedTensor, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_TrackableObjectGraph_TrackableObject_SerializedTensor[]
    end
end
function Base.getproperty(obj::TrackableObjectGraph_TrackableObject_SerializedTensor, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :full_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :checkpoint_key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :optional_restore
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct TrackableObjectGraph_TrackableObject_SlotVariableReference <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function TrackableObjectGraph_TrackableObject_SlotVariableReference(; kwargs...)
        obj = new(meta(TrackableObjectGraph_TrackableObject_SlotVariableReference), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct TrackableObjectGraph_TrackableObject_SlotVariableReference
const __meta_TrackableObjectGraph_TrackableObject_SlotVariableReference = Ref{ProtoMeta}()
function meta(::Type{TrackableObjectGraph_TrackableObject_SlotVariableReference})
    ProtoBuf.metalock() do
        if !isassigned(__meta_TrackableObjectGraph_TrackableObject_SlotVariableReference)
            __meta_TrackableObjectGraph_TrackableObject_SlotVariableReference[] = target = ProtoMeta(TrackableObjectGraph_TrackableObject_SlotVariableReference)
            allflds = Pair{Symbol,Union{Type,String}}[:original_variable_node_id => Int32, :slot_name => AbstractString, :slot_variable_node_id => Int32]
            meta(target, TrackableObjectGraph_TrackableObject_SlotVariableReference, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_TrackableObjectGraph_TrackableObject_SlotVariableReference[]
    end
end
function Base.getproperty(obj::TrackableObjectGraph_TrackableObject_SlotVariableReference, name::Symbol)
    if name === :original_variable_node_id
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :slot_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :slot_variable_node_id
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct TrackableObjectGraph_TrackableObject <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function TrackableObjectGraph_TrackableObject(; kwargs...)
        obj = new(meta(TrackableObjectGraph_TrackableObject), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct TrackableObjectGraph_TrackableObject
const __meta_TrackableObjectGraph_TrackableObject = Ref{ProtoMeta}()
function meta(::Type{TrackableObjectGraph_TrackableObject})
    ProtoBuf.metalock() do
        if !isassigned(__meta_TrackableObjectGraph_TrackableObject)
            __meta_TrackableObjectGraph_TrackableObject[] = target = ProtoMeta(TrackableObjectGraph_TrackableObject)
            allflds = Pair{Symbol,Union{Type,String}}[:children => Base.Vector{TrackableObjectGraph_TrackableObject_ObjectReference}, :attributes => Base.Vector{TrackableObjectGraph_TrackableObject_SerializedTensor}, :slot_variables => Base.Vector{TrackableObjectGraph_TrackableObject_SlotVariableReference}]
            meta(target, TrackableObjectGraph_TrackableObject, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_TrackableObjectGraph_TrackableObject[]
    end
end
function Base.getproperty(obj::TrackableObjectGraph_TrackableObject, name::Symbol)
    if name === :children
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{TrackableObjectGraph_TrackableObject_ObjectReference}
    elseif name === :attributes
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{TrackableObjectGraph_TrackableObject_SerializedTensor}
    elseif name === :slot_variables
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{TrackableObjectGraph_TrackableObject_SlotVariableReference}
    else
        getfield(obj, name)
    end
end

mutable struct TrackableObjectGraph <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function TrackableObjectGraph(; kwargs...)
        obj = new(meta(TrackableObjectGraph), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct TrackableObjectGraph
const __meta_TrackableObjectGraph = Ref{ProtoMeta}()
function meta(::Type{TrackableObjectGraph})
    ProtoBuf.metalock() do
        if !isassigned(__meta_TrackableObjectGraph)
            __meta_TrackableObjectGraph[] = target = ProtoMeta(TrackableObjectGraph)
            allflds = Pair{Symbol,Union{Type,String}}[:nodes => Base.Vector{TrackableObjectGraph_TrackableObject}]
            meta(target, TrackableObjectGraph, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_TrackableObjectGraph[]
    end
end
function Base.getproperty(obj::TrackableObjectGraph, name::Symbol)
    if name === :nodes
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{TrackableObjectGraph_TrackableObject}
    else
        getfield(obj, name)
    end
end

export TrackableObjectGraph_TrackableObject_ObjectReference, TrackableObjectGraph_TrackableObject_SerializedTensor, TrackableObjectGraph_TrackableObject_SlotVariableReference, TrackableObjectGraph_TrackableObject, TrackableObjectGraph

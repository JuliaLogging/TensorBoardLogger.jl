# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct AttrValue_ListValue <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function AttrValue_ListValue(; kwargs...)
        obj = new(meta(AttrValue_ListValue), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct AttrValue_ListValue (has cyclic type dependency)
const __meta_AttrValue_ListValue = Ref{ProtoMeta}()
function meta(::Type{AttrValue_ListValue})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AttrValue_ListValue)
            __meta_AttrValue_ListValue[] = target = ProtoMeta(AttrValue_ListValue)
            fnum = Int[2,3,4,5,6,7,8,9]
            pack = Symbol[:i,:f,:b,:_type]
            allflds = Pair{Symbol,Union{Type,String}}[:s => Base.Vector{Vector{UInt8}}, :i => Base.Vector{Int64}, :f => Base.Vector{Float32}, :b => Base.Vector{Bool}, :_type => Base.Vector{Int32}, :shape => Base.Vector{TensorShapeProto}, :tensor => Base.Vector{TensorProto}, :func => "Base.Vector{NameAttrList}"]
            meta(target, AttrValue_ListValue, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, pack, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_AttrValue_ListValue[]
    end
end
function Base.getproperty(obj::AttrValue_ListValue, name::Symbol)
    if name === :s
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Vector{UInt8}}
    elseif name === :i
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int64}
    elseif name === :f
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Float32}
    elseif name === :b
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Bool}
    elseif name === :_type
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    elseif name === :shape
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{TensorShapeProto}
    elseif name === :tensor
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{TensorProto}
    elseif name === :func
        return (obj.__protobuf_jl_internal_values[name])::Any
    else
        getfield(obj, name)
    end
end

mutable struct AttrValue <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function AttrValue(; kwargs...)
        obj = new(meta(AttrValue), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct AttrValue (has cyclic type dependency)
const __meta_AttrValue = Ref{ProtoMeta}()
function meta(::Type{AttrValue})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AttrValue)
            __meta_AttrValue[] = target = ProtoMeta(AttrValue)
            fnum = Int[2,3,4,5,6,7,8,1,10,9]
            allflds = Pair{Symbol,Union{Type,String}}[:s => Vector{UInt8}, :i => Int64, :f => Float32, :b => Bool, :_type => Int32, :shape => TensorShapeProto, :tensor => TensorProto, :list => AttrValue_ListValue, :func => "NameAttrList", :placeholder => AbstractString]
            oneofs = Int[1,1,1,1,1,1,1,1,1,1]
            oneof_names = Symbol[Symbol("value")]
            meta(target, AttrValue, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, oneofs, oneof_names)
        end
        __meta_AttrValue[]
    end
end
function Base.getproperty(obj::AttrValue, name::Symbol)
    if name === :s
        return (obj.__protobuf_jl_internal_values[name])::Vector{UInt8}
    elseif name === :i
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :f
        return (obj.__protobuf_jl_internal_values[name])::Float32
    elseif name === :b
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :shape
        return (obj.__protobuf_jl_internal_values[name])::TensorShapeProto
    elseif name === :tensor
        return (obj.__protobuf_jl_internal_values[name])::TensorProto
    elseif name === :list
        return (obj.__protobuf_jl_internal_values[name])::AttrValue_ListValue
    elseif name === :func
        return (obj.__protobuf_jl_internal_values[name])::Any
    elseif name === :placeholder
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct NameAttrList_AttrEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function NameAttrList_AttrEntry(; kwargs...)
        obj = new(meta(NameAttrList_AttrEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct NameAttrList_AttrEntry (mapentry) (has cyclic type dependency)
const __meta_NameAttrList_AttrEntry = Ref{ProtoMeta}()
function meta(::Type{NameAttrList_AttrEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_NameAttrList_AttrEntry)
            __meta_NameAttrList_AttrEntry[] = target = ProtoMeta(NameAttrList_AttrEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => AttrValue]
            meta(target, NameAttrList_AttrEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_NameAttrList_AttrEntry[]
    end
end
function Base.getproperty(obj::NameAttrList_AttrEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::AttrValue
    else
        getfield(obj, name)
    end
end

mutable struct NameAttrList <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function NameAttrList(; kwargs...)
        obj = new(meta(NameAttrList), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct NameAttrList (has cyclic type dependency)
const __meta_NameAttrList = Ref{ProtoMeta}()
function meta(::Type{NameAttrList})
    ProtoBuf.metalock() do
        if !isassigned(__meta_NameAttrList)
            __meta_NameAttrList[] = target = ProtoMeta(NameAttrList)
            allflds = Pair{Symbol,Union{Type,String}}[:name => AbstractString, :attr => "Base.Dict{AbstractString,AttrValue}"]
            meta(target, NameAttrList, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_NameAttrList[]
    end
end
function Base.getproperty(obj::NameAttrList, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :attr
        return (obj.__protobuf_jl_internal_values[name])::Any
    else
        getfield(obj, name)
    end
end

export AttrValue_ListValue, AttrValue, NameAttrList_AttrEntry, NameAttrList, AttrValue_ListValue, AttrValue, NameAttrList_AttrEntry, NameAttrList
# mapentries: "NameAttrList_AttrEntry" => ("AbstractString", "AttrValue")

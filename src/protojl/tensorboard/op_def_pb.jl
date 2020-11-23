# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct OpDeprecation <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function OpDeprecation(; kwargs...)
        obj = new(meta(OpDeprecation), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct OpDeprecation
const __meta_OpDeprecation = Ref{ProtoMeta}()
function meta(::Type{OpDeprecation})
    ProtoBuf.metalock() do
        if !isassigned(__meta_OpDeprecation)
            __meta_OpDeprecation[] = target = ProtoMeta(OpDeprecation)
            allflds = Pair{Symbol,Union{Type,String}}[:version => Int32, :explanation => AbstractString]
            meta(target, OpDeprecation, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_OpDeprecation[]
    end
end
function Base.getproperty(obj::OpDeprecation, name::Symbol)
    if name === :version
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :explanation
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct OpDef_ArgDef <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function OpDef_ArgDef(; kwargs...)
        obj = new(meta(OpDef_ArgDef), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct OpDef_ArgDef
const __meta_OpDef_ArgDef = Ref{ProtoMeta}()
function meta(::Type{OpDef_ArgDef})
    ProtoBuf.metalock() do
        if !isassigned(__meta_OpDef_ArgDef)
            __meta_OpDef_ArgDef[] = target = ProtoMeta(OpDef_ArgDef)
            fnum = Int[1,2,3,4,5,6,16]
            allflds = Pair{Symbol,Union{Type,String}}[:name => AbstractString, :description => AbstractString, :_type => Int32, :type_attr => AbstractString, :number_attr => AbstractString, :type_list_attr => AbstractString, :is_ref => Bool]
            meta(target, OpDef_ArgDef, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_OpDef_ArgDef[]
    end
end
function Base.getproperty(obj::OpDef_ArgDef, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :description
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :type_attr
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :number_attr
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :type_list_attr
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :is_ref
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct OpDef_AttrDef <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function OpDef_AttrDef(; kwargs...)
        obj = new(meta(OpDef_AttrDef), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct OpDef_AttrDef
const __meta_OpDef_AttrDef = Ref{ProtoMeta}()
function meta(::Type{OpDef_AttrDef})
    ProtoBuf.metalock() do
        if !isassigned(__meta_OpDef_AttrDef)
            __meta_OpDef_AttrDef[] = target = ProtoMeta(OpDef_AttrDef)
            allflds = Pair{Symbol,Union{Type,String}}[:name => AbstractString, :_type => AbstractString, :default_value => AttrValue, :description => AbstractString, :has_minimum => Bool, :minimum => Int64, :allowed_values => AttrValue]
            meta(target, OpDef_AttrDef, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_OpDef_AttrDef[]
    end
end
function Base.getproperty(obj::OpDef_AttrDef, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :_type
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :default_value
        return (obj.__protobuf_jl_internal_values[name])::AttrValue
    elseif name === :description
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :has_minimum
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :minimum
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :allowed_values
        return (obj.__protobuf_jl_internal_values[name])::AttrValue
    else
        getfield(obj, name)
    end
end

mutable struct OpDef <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function OpDef(; kwargs...)
        obj = new(meta(OpDef), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct OpDef
const __meta_OpDef = Ref{ProtoMeta}()
function meta(::Type{OpDef})
    ProtoBuf.metalock() do
        if !isassigned(__meta_OpDef)
            __meta_OpDef[] = target = ProtoMeta(OpDef)
            fnum = Int[1,2,3,20,4,8,5,6,18,16,17,19]
            allflds = Pair{Symbol,Union{Type,String}}[:name => AbstractString, :input_arg => Base.Vector{OpDef_ArgDef}, :output_arg => Base.Vector{OpDef_ArgDef}, :control_output => Base.Vector{AbstractString}, :attr => Base.Vector{OpDef_AttrDef}, :deprecation => OpDeprecation, :summary => AbstractString, :description => AbstractString, :is_commutative => Bool, :is_aggregate => Bool, :is_stateful => Bool, :allows_uninitialized_input => Bool]
            meta(target, OpDef, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_OpDef[]
    end
end
function Base.getproperty(obj::OpDef, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :input_arg
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{OpDef_ArgDef}
    elseif name === :output_arg
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{OpDef_ArgDef}
    elseif name === :control_output
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :attr
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{OpDef_AttrDef}
    elseif name === :deprecation
        return (obj.__protobuf_jl_internal_values[name])::OpDeprecation
    elseif name === :summary
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :description
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :is_commutative
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :is_aggregate
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :is_stateful
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :allows_uninitialized_input
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct OpList <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function OpList(; kwargs...)
        obj = new(meta(OpList), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct OpList
const __meta_OpList = Ref{ProtoMeta}()
function meta(::Type{OpList})
    ProtoBuf.metalock() do
        if !isassigned(__meta_OpList)
            __meta_OpList[] = target = ProtoMeta(OpList)
            allflds = Pair{Symbol,Union{Type,String}}[:op => Base.Vector{OpDef}]
            meta(target, OpList, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_OpList[]
    end
end
function Base.getproperty(obj::OpList, name::Symbol)
    if name === :op
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{OpDef}
    else
        getfield(obj, name)
    end
end

export OpDef_ArgDef, OpDef_AttrDef, OpDef, OpDeprecation, OpList

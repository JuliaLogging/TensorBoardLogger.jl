# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

const ApiDef_Visibility = (;[
    Symbol("DEFAULT_VISIBILITY") => Int32(0),
    Symbol("VISIBLE") => Int32(1),
    Symbol("SKIP") => Int32(2),
    Symbol("HIDDEN") => Int32(3),
]...)

mutable struct ApiDef_Endpoint <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ApiDef_Endpoint(; kwargs...)
        obj = new(meta(ApiDef_Endpoint), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ApiDef_Endpoint
const __meta_ApiDef_Endpoint = Ref{ProtoMeta}()
function meta(::Type{ApiDef_Endpoint})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ApiDef_Endpoint)
            __meta_ApiDef_Endpoint[] = target = ProtoMeta(ApiDef_Endpoint)
            fnum = Int[1,3,4]
            allflds = Pair{Symbol,Union{Type,String}}[:name => AbstractString, :deprecated => Bool, :deprecation_version => Int32]
            meta(target, ApiDef_Endpoint, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ApiDef_Endpoint[]
    end
end
function Base.getproperty(obj::ApiDef_Endpoint, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :deprecated
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :deprecation_version
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct ApiDef_Arg <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ApiDef_Arg(; kwargs...)
        obj = new(meta(ApiDef_Arg), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ApiDef_Arg
const __meta_ApiDef_Arg = Ref{ProtoMeta}()
function meta(::Type{ApiDef_Arg})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ApiDef_Arg)
            __meta_ApiDef_Arg[] = target = ProtoMeta(ApiDef_Arg)
            allflds = Pair{Symbol,Union{Type,String}}[:name => AbstractString, :rename_to => AbstractString, :description => AbstractString]
            meta(target, ApiDef_Arg, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ApiDef_Arg[]
    end
end
function Base.getproperty(obj::ApiDef_Arg, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :rename_to
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :description
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct ApiDef_Attr <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ApiDef_Attr(; kwargs...)
        obj = new(meta(ApiDef_Attr), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ApiDef_Attr
const __meta_ApiDef_Attr = Ref{ProtoMeta}()
function meta(::Type{ApiDef_Attr})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ApiDef_Attr)
            __meta_ApiDef_Attr[] = target = ProtoMeta(ApiDef_Attr)
            allflds = Pair{Symbol,Union{Type,String}}[:name => AbstractString, :rename_to => AbstractString, :default_value => AttrValue, :description => AbstractString]
            meta(target, ApiDef_Attr, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ApiDef_Attr[]
    end
end
function Base.getproperty(obj::ApiDef_Attr, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :rename_to
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :default_value
        return (obj.__protobuf_jl_internal_values[name])::AttrValue
    elseif name === :description
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct ApiDef <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ApiDef(; kwargs...)
        obj = new(meta(ApiDef), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ApiDef
const __meta_ApiDef = Ref{ProtoMeta}()
function meta(::Type{ApiDef})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ApiDef)
            __meta_ApiDef[] = target = ProtoMeta(ApiDef)
            fnum = Int[1,12,13,2,3,4,5,11,6,7,8,9,10]
            allflds = Pair{Symbol,Union{Type,String}}[:graph_op_name => AbstractString, :deprecation_message => AbstractString, :deprecation_version => Int32, :visibility => Int32, :endpoint => Base.Vector{ApiDef_Endpoint}, :in_arg => Base.Vector{ApiDef_Arg}, :out_arg => Base.Vector{ApiDef_Arg}, :arg_order => Base.Vector{AbstractString}, :attr => Base.Vector{ApiDef_Attr}, :summary => AbstractString, :description => AbstractString, :description_prefix => AbstractString, :description_suffix => AbstractString]
            meta(target, ApiDef, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ApiDef[]
    end
end
function Base.getproperty(obj::ApiDef, name::Symbol)
    if name === :graph_op_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :deprecation_message
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :deprecation_version
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :visibility
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :endpoint
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ApiDef_Endpoint}
    elseif name === :in_arg
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ApiDef_Arg}
    elseif name === :out_arg
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ApiDef_Arg}
    elseif name === :arg_order
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :attr
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ApiDef_Attr}
    elseif name === :summary
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :description
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :description_prefix
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :description_suffix
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct ApiDefs <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ApiDefs(; kwargs...)
        obj = new(meta(ApiDefs), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ApiDefs
const __meta_ApiDefs = Ref{ProtoMeta}()
function meta(::Type{ApiDefs})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ApiDefs)
            __meta_ApiDefs[] = target = ProtoMeta(ApiDefs)
            allflds = Pair{Symbol,Union{Type,String}}[:op => Base.Vector{ApiDef}]
            meta(target, ApiDefs, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ApiDefs[]
    end
end
function Base.getproperty(obj::ApiDefs, name::Symbol)
    if name === :op
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ApiDef}
    else
        getfield(obj, name)
    end
end

export ApiDef_Visibility, ApiDef_Endpoint, ApiDef_Arg, ApiDef_Attr, ApiDef, ApiDefs

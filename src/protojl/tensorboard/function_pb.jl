# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct FunctionDef_AttrEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function FunctionDef_AttrEntry(; kwargs...)
        obj = new(meta(FunctionDef_AttrEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct FunctionDef_AttrEntry (mapentry)
const __meta_FunctionDef_AttrEntry = Ref{ProtoMeta}()
function meta(::Type{FunctionDef_AttrEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_FunctionDef_AttrEntry)
            __meta_FunctionDef_AttrEntry[] = target = ProtoMeta(FunctionDef_AttrEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => AttrValue]
            meta(target, FunctionDef_AttrEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_FunctionDef_AttrEntry[]
    end
end
function Base.getproperty(obj::FunctionDef_AttrEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::AttrValue
    else
        getfield(obj, name)
    end
end

mutable struct FunctionDef_ArgAttrs_AttrEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function FunctionDef_ArgAttrs_AttrEntry(; kwargs...)
        obj = new(meta(FunctionDef_ArgAttrs_AttrEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct FunctionDef_ArgAttrs_AttrEntry (mapentry)
const __meta_FunctionDef_ArgAttrs_AttrEntry = Ref{ProtoMeta}()
function meta(::Type{FunctionDef_ArgAttrs_AttrEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_FunctionDef_ArgAttrs_AttrEntry)
            __meta_FunctionDef_ArgAttrs_AttrEntry[] = target = ProtoMeta(FunctionDef_ArgAttrs_AttrEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => AttrValue]
            meta(target, FunctionDef_ArgAttrs_AttrEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_FunctionDef_ArgAttrs_AttrEntry[]
    end
end
function Base.getproperty(obj::FunctionDef_ArgAttrs_AttrEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::AttrValue
    else
        getfield(obj, name)
    end
end

mutable struct FunctionDef_ArgAttrs <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function FunctionDef_ArgAttrs(; kwargs...)
        obj = new(meta(FunctionDef_ArgAttrs), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct FunctionDef_ArgAttrs
const __meta_FunctionDef_ArgAttrs = Ref{ProtoMeta}()
function meta(::Type{FunctionDef_ArgAttrs})
    ProtoBuf.metalock() do
        if !isassigned(__meta_FunctionDef_ArgAttrs)
            __meta_FunctionDef_ArgAttrs[] = target = ProtoMeta(FunctionDef_ArgAttrs)
            allflds = Pair{Symbol,Union{Type,String}}[:attr => Base.Dict{AbstractString,AttrValue}]
            meta(target, FunctionDef_ArgAttrs, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_FunctionDef_ArgAttrs[]
    end
end
function Base.getproperty(obj::FunctionDef_ArgAttrs, name::Symbol)
    if name === :attr
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{AbstractString,AttrValue}
    else
        getfield(obj, name)
    end
end

mutable struct FunctionDef_ArgAttrEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function FunctionDef_ArgAttrEntry(; kwargs...)
        obj = new(meta(FunctionDef_ArgAttrEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct FunctionDef_ArgAttrEntry (mapentry)
const __meta_FunctionDef_ArgAttrEntry = Ref{ProtoMeta}()
function meta(::Type{FunctionDef_ArgAttrEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_FunctionDef_ArgAttrEntry)
            __meta_FunctionDef_ArgAttrEntry[] = target = ProtoMeta(FunctionDef_ArgAttrEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => UInt32, :value => FunctionDef_ArgAttrs]
            meta(target, FunctionDef_ArgAttrEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_FunctionDef_ArgAttrEntry[]
    end
end
function Base.getproperty(obj::FunctionDef_ArgAttrEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::FunctionDef_ArgAttrs
    else
        getfield(obj, name)
    end
end

mutable struct FunctionDef_ResourceArgUniqueIdEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function FunctionDef_ResourceArgUniqueIdEntry(; kwargs...)
        obj = new(meta(FunctionDef_ResourceArgUniqueIdEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct FunctionDef_ResourceArgUniqueIdEntry (mapentry)
const __meta_FunctionDef_ResourceArgUniqueIdEntry = Ref{ProtoMeta}()
function meta(::Type{FunctionDef_ResourceArgUniqueIdEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_FunctionDef_ResourceArgUniqueIdEntry)
            __meta_FunctionDef_ResourceArgUniqueIdEntry[] = target = ProtoMeta(FunctionDef_ResourceArgUniqueIdEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => UInt32, :value => UInt32]
            meta(target, FunctionDef_ResourceArgUniqueIdEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_FunctionDef_ResourceArgUniqueIdEntry[]
    end
end
function Base.getproperty(obj::FunctionDef_ResourceArgUniqueIdEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    else
        getfield(obj, name)
    end
end

mutable struct FunctionDef_RetEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function FunctionDef_RetEntry(; kwargs...)
        obj = new(meta(FunctionDef_RetEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct FunctionDef_RetEntry (mapentry)
const __meta_FunctionDef_RetEntry = Ref{ProtoMeta}()
function meta(::Type{FunctionDef_RetEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_FunctionDef_RetEntry)
            __meta_FunctionDef_RetEntry[] = target = ProtoMeta(FunctionDef_RetEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => AbstractString]
            meta(target, FunctionDef_RetEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_FunctionDef_RetEntry[]
    end
end
function Base.getproperty(obj::FunctionDef_RetEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct FunctionDef_ControlRetEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function FunctionDef_ControlRetEntry(; kwargs...)
        obj = new(meta(FunctionDef_ControlRetEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct FunctionDef_ControlRetEntry (mapentry)
const __meta_FunctionDef_ControlRetEntry = Ref{ProtoMeta}()
function meta(::Type{FunctionDef_ControlRetEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_FunctionDef_ControlRetEntry)
            __meta_FunctionDef_ControlRetEntry[] = target = ProtoMeta(FunctionDef_ControlRetEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => AbstractString]
            meta(target, FunctionDef_ControlRetEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_FunctionDef_ControlRetEntry[]
    end
end
function Base.getproperty(obj::FunctionDef_ControlRetEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct FunctionDef <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function FunctionDef(; kwargs...)
        obj = new(meta(FunctionDef), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct FunctionDef
const __meta_FunctionDef = Ref{ProtoMeta}()
function meta(::Type{FunctionDef})
    ProtoBuf.metalock() do
        if !isassigned(__meta_FunctionDef)
            __meta_FunctionDef[] = target = ProtoMeta(FunctionDef)
            fnum = Int[1,5,7,8,3,4,6]
            allflds = Pair{Symbol,Union{Type,String}}[:signature => OpDef, :attr => Base.Dict{AbstractString,AttrValue}, :arg_attr => Base.Dict{UInt32,FunctionDef_ArgAttrs}, :resource_arg_unique_id => Base.Dict{UInt32,UInt32}, :node_def => Base.Vector{NodeDef}, :ret => Base.Dict{AbstractString,AbstractString}, :control_ret => Base.Dict{AbstractString,AbstractString}]
            meta(target, FunctionDef, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_FunctionDef[]
    end
end
function Base.getproperty(obj::FunctionDef, name::Symbol)
    if name === :signature
        return (obj.__protobuf_jl_internal_values[name])::OpDef
    elseif name === :attr
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{AbstractString,AttrValue}
    elseif name === :arg_attr
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{UInt32,FunctionDef_ArgAttrs}
    elseif name === :resource_arg_unique_id
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{UInt32,UInt32}
    elseif name === :node_def
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{NodeDef}
    elseif name === :ret
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{AbstractString,AbstractString}
    elseif name === :control_ret
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{AbstractString,AbstractString}
    else
        getfield(obj, name)
    end
end

mutable struct GradientDef <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function GradientDef(; kwargs...)
        obj = new(meta(GradientDef), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct GradientDef
const __meta_GradientDef = Ref{ProtoMeta}()
function meta(::Type{GradientDef})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GradientDef)
            __meta_GradientDef[] = target = ProtoMeta(GradientDef)
            allflds = Pair{Symbol,Union{Type,String}}[:function_name => AbstractString, :gradient_func => AbstractString]
            meta(target, GradientDef, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GradientDef[]
    end
end
function Base.getproperty(obj::GradientDef, name::Symbol)
    if name === :function_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :gradient_func
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct FunctionDefLibrary <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function FunctionDefLibrary(; kwargs...)
        obj = new(meta(FunctionDefLibrary), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct FunctionDefLibrary
const __meta_FunctionDefLibrary = Ref{ProtoMeta}()
function meta(::Type{FunctionDefLibrary})
    ProtoBuf.metalock() do
        if !isassigned(__meta_FunctionDefLibrary)
            __meta_FunctionDefLibrary[] = target = ProtoMeta(FunctionDefLibrary)
            allflds = Pair{Symbol,Union{Type,String}}[:_function => Base.Vector{FunctionDef}, :gradient => Base.Vector{GradientDef}]
            meta(target, FunctionDefLibrary, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_FunctionDefLibrary[]
    end
end
function Base.getproperty(obj::FunctionDefLibrary, name::Symbol)
    if name === :_function
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{FunctionDef}
    elseif name === :gradient
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{GradientDef}
    else
        getfield(obj, name)
    end
end

export FunctionDefLibrary, FunctionDef_AttrEntry, FunctionDef_ArgAttrs_AttrEntry, FunctionDef_ArgAttrs, FunctionDef_ArgAttrEntry, FunctionDef_ResourceArgUniqueIdEntry, FunctionDef_RetEntry, FunctionDef_ControlRetEntry, FunctionDef, GradientDef
# mapentries: "FunctionDef_AttrEntry" => ("AbstractString", "AttrValue"), "FunctionDef_ArgAttrEntry" => ("UInt32", "FunctionDef_ArgAttrs"), "FunctionDef_ResourceArgUniqueIdEntry" => ("UInt32", "UInt32"), "FunctionDef_RetEntry" => ("AbstractString", "AbstractString"), "FunctionDef_ControlRetEntry" => ("AbstractString", "AbstractString"), "FunctionDef_ArgAttrs_AttrEntry" => ("AbstractString", "AttrValue")

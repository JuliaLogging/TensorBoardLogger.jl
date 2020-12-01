# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct _Any <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function _Any(; kwargs...)
        obj = new(meta(_Any), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct _Any
const __meta__Any = Ref{ProtoMeta}()
function meta(::Type{_Any})
    ProtoBuf.metalock() do
        if !isassigned(__meta__Any)
            __meta__Any[] = target = ProtoMeta(_Any)
            allflds = Pair{Symbol,Union{Type,String}}[:type_url => AbstractString, :value => Vector{UInt8}]
            meta(target, _Any, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta__Any[]
    end
end
function Base.getproperty(obj::_Any, name::Symbol)
    if name === :type_url
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::Vector{UInt8}
    else
        getfield(obj, name)
    end
end

export _Any

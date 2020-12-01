# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct TextPluginData <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function TextPluginData(; kwargs...)
        obj = new(meta(TextPluginData), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct TextPluginData
const __meta_TextPluginData = Ref{ProtoMeta}()
function meta(::Type{TextPluginData})
    ProtoBuf.metalock() do
        if !isassigned(__meta_TextPluginData)
            __meta_TextPluginData[] = target = ProtoMeta(TextPluginData)
            allflds = Pair{Symbol,Union{Type,String}}[:version => Int32]
            meta(target, TextPluginData, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_TextPluginData[]
    end
end
function Base.getproperty(obj::TextPluginData, name::Symbol)
    if name === :version
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

export TextPluginData

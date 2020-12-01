# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

const VerifierConfig_Toggle = (;[
    Symbol("DEFAULT") => Int32(0),
    Symbol("ON") => Int32(1),
    Symbol("OFF") => Int32(2),
]...)

mutable struct VerifierConfig <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function VerifierConfig(; kwargs...)
        obj = new(meta(VerifierConfig), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct VerifierConfig
const __meta_VerifierConfig = Ref{ProtoMeta}()
function meta(::Type{VerifierConfig})
    ProtoBuf.metalock() do
        if !isassigned(__meta_VerifierConfig)
            __meta_VerifierConfig[] = target = ProtoMeta(VerifierConfig)
            allflds = Pair{Symbol,Union{Type,String}}[:verification_timeout_in_ms => Int64, :structure_verifier => Int32]
            meta(target, VerifierConfig, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_VerifierConfig[]
    end
end
function Base.getproperty(obj::VerifierConfig, name::Symbol)
    if name === :verification_timeout_in_ms
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :structure_verifier
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

export VerifierConfig_Toggle, VerifierConfig

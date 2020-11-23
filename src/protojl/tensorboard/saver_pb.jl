# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

const SaverDef_CheckpointFormatVersion = (;[
    Symbol("LEGACY") => Int32(0),
    Symbol("V1") => Int32(1),
    Symbol("V2") => Int32(2),
]...)

mutable struct SaverDef <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SaverDef(; kwargs...)
        obj = new(meta(SaverDef), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SaverDef
const __meta_SaverDef = Ref{ProtoMeta}()
function meta(::Type{SaverDef})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SaverDef)
            __meta_SaverDef[] = target = ProtoMeta(SaverDef)
            allflds = Pair{Symbol,Union{Type,String}}[:filename_tensor_name => AbstractString, :save_tensor_name => AbstractString, :restore_op_name => AbstractString, :max_to_keep => Int32, :sharded => Bool, :keep_checkpoint_every_n_hours => Float32, :version => Int32]
            meta(target, SaverDef, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SaverDef[]
    end
end
function Base.getproperty(obj::SaverDef, name::Symbol)
    if name === :filename_tensor_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :save_tensor_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :restore_op_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :max_to_keep
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :sharded
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :keep_checkpoint_every_n_hours
        return (obj.__protobuf_jl_internal_values[name])::Float32
    elseif name === :version
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

export SaverDef_CheckpointFormatVersion, SaverDef

# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

const VariableSynchronization = (;[
    Symbol("VARIABLE_SYNCHRONIZATION_AUTO") => Int32(0),
    Symbol("VARIABLE_SYNCHRONIZATION_NONE") => Int32(1),
    Symbol("VARIABLE_SYNCHRONIZATION_ON_WRITE") => Int32(2),
    Symbol("VARIABLE_SYNCHRONIZATION_ON_READ") => Int32(3),
]...)

const VariableAggregation = (;[
    Symbol("VARIABLE_AGGREGATION_NONE") => Int32(0),
    Symbol("VARIABLE_AGGREGATION_SUM") => Int32(1),
    Symbol("VARIABLE_AGGREGATION_MEAN") => Int32(2),
    Symbol("VARIABLE_AGGREGATION_ONLY_FIRST_REPLICA") => Int32(3),
]...)

mutable struct SaveSliceInfoDef <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SaveSliceInfoDef(; kwargs...)
        obj = new(meta(SaveSliceInfoDef), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SaveSliceInfoDef
const __meta_SaveSliceInfoDef = Ref{ProtoMeta}()
function meta(::Type{SaveSliceInfoDef})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SaveSliceInfoDef)
            __meta_SaveSliceInfoDef[] = target = ProtoMeta(SaveSliceInfoDef)
            pack = Symbol[:full_shape,:var_offset,:var_shape]
            allflds = Pair{Symbol,Union{Type,String}}[:full_name => AbstractString, :full_shape => Base.Vector{Int64}, :var_offset => Base.Vector{Int64}, :var_shape => Base.Vector{Int64}]
            meta(target, SaveSliceInfoDef, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, pack, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SaveSliceInfoDef[]
    end
end
function Base.getproperty(obj::SaveSliceInfoDef, name::Symbol)
    if name === :full_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :full_shape
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int64}
    elseif name === :var_offset
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int64}
    elseif name === :var_shape
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int64}
    else
        getfield(obj, name)
    end
end

mutable struct VariableDef <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function VariableDef(; kwargs...)
        obj = new(meta(VariableDef), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct VariableDef
const __meta_VariableDef = Ref{ProtoMeta}()
function meta(::Type{VariableDef})
    ProtoBuf.metalock() do
        if !isassigned(__meta_VariableDef)
            __meta_VariableDef[] = target = ProtoMeta(VariableDef)
            fnum = Int[1,6,2,3,4,5,7,8,9]
            allflds = Pair{Symbol,Union{Type,String}}[:variable_name => AbstractString, :initial_value_name => AbstractString, :initializer_name => AbstractString, :snapshot_name => AbstractString, :save_slice_info_def => SaveSliceInfoDef, :is_resource => Bool, :trainable => Bool, :synchronization => Int32, :aggregation => Int32]
            meta(target, VariableDef, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_VariableDef[]
    end
end
function Base.getproperty(obj::VariableDef, name::Symbol)
    if name === :variable_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :initial_value_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :initializer_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :snapshot_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :save_slice_info_def
        return (obj.__protobuf_jl_internal_values[name])::SaveSliceInfoDef
    elseif name === :is_resource
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :trainable
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :synchronization
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :aggregation
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

export VariableSynchronization, VariableAggregation, VariableDef, SaveSliceInfoDef

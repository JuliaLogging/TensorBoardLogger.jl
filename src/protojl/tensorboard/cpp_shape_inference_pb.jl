# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct CppShapeInferenceResult_HandleShapeAndType <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function CppShapeInferenceResult_HandleShapeAndType(; kwargs...)
        obj = new(meta(CppShapeInferenceResult_HandleShapeAndType), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct CppShapeInferenceResult_HandleShapeAndType
const __meta_CppShapeInferenceResult_HandleShapeAndType = Ref{ProtoMeta}()
function meta(::Type{CppShapeInferenceResult_HandleShapeAndType})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CppShapeInferenceResult_HandleShapeAndType)
            __meta_CppShapeInferenceResult_HandleShapeAndType[] = target = ProtoMeta(CppShapeInferenceResult_HandleShapeAndType)
            allflds = Pair{Symbol,Union{Type,String}}[:shape => TensorShapeProto, :dtype => Int32, :specialized_type => Int32]
            meta(target, CppShapeInferenceResult_HandleShapeAndType, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CppShapeInferenceResult_HandleShapeAndType[]
    end
end
function Base.getproperty(obj::CppShapeInferenceResult_HandleShapeAndType, name::Symbol)
    if name === :shape
        return (obj.__protobuf_jl_internal_values[name])::TensorShapeProto
    elseif name === :dtype
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :specialized_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct CppShapeInferenceResult_HandleData <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function CppShapeInferenceResult_HandleData(; kwargs...)
        obj = new(meta(CppShapeInferenceResult_HandleData), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct CppShapeInferenceResult_HandleData
const __meta_CppShapeInferenceResult_HandleData = Ref{ProtoMeta}()
function meta(::Type{CppShapeInferenceResult_HandleData})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CppShapeInferenceResult_HandleData)
            __meta_CppShapeInferenceResult_HandleData[] = target = ProtoMeta(CppShapeInferenceResult_HandleData)
            allflds = Pair{Symbol,Union{Type,String}}[:is_set => Bool, :shape_and_type => Base.Vector{CppShapeInferenceResult_HandleShapeAndType}]
            meta(target, CppShapeInferenceResult_HandleData, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CppShapeInferenceResult_HandleData[]
    end
end
function Base.getproperty(obj::CppShapeInferenceResult_HandleData, name::Symbol)
    if name === :is_set
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :shape_and_type
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{CppShapeInferenceResult_HandleShapeAndType}
    else
        getfield(obj, name)
    end
end

mutable struct CppShapeInferenceResult <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function CppShapeInferenceResult(; kwargs...)
        obj = new(meta(CppShapeInferenceResult), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct CppShapeInferenceResult
const __meta_CppShapeInferenceResult = Ref{ProtoMeta}()
function meta(::Type{CppShapeInferenceResult})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CppShapeInferenceResult)
            __meta_CppShapeInferenceResult[] = target = ProtoMeta(CppShapeInferenceResult)
            fnum = Int[1,4]
            allflds = Pair{Symbol,Union{Type,String}}[:shape => TensorShapeProto, :handle_data => CppShapeInferenceResult_HandleData]
            meta(target, CppShapeInferenceResult, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CppShapeInferenceResult[]
    end
end
function Base.getproperty(obj::CppShapeInferenceResult, name::Symbol)
    if name === :shape
        return (obj.__protobuf_jl_internal_values[name])::TensorShapeProto
    elseif name === :handle_data
        return (obj.__protobuf_jl_internal_values[name])::CppShapeInferenceResult_HandleData
    else
        getfield(obj, name)
    end
end

mutable struct CppShapeInferenceInputsNeeded <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function CppShapeInferenceInputsNeeded(; kwargs...)
        obj = new(meta(CppShapeInferenceInputsNeeded), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct CppShapeInferenceInputsNeeded
const __meta_CppShapeInferenceInputsNeeded = Ref{ProtoMeta}()
function meta(::Type{CppShapeInferenceInputsNeeded})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CppShapeInferenceInputsNeeded)
            __meta_CppShapeInferenceInputsNeeded[] = target = ProtoMeta(CppShapeInferenceInputsNeeded)
            pack = Symbol[:input_tensors_needed,:input_tensors_as_shapes_needed]
            allflds = Pair{Symbol,Union{Type,String}}[:input_tensors_needed => Base.Vector{Int32}, :input_tensors_as_shapes_needed => Base.Vector{Int32}]
            meta(target, CppShapeInferenceInputsNeeded, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, pack, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CppShapeInferenceInputsNeeded[]
    end
end
function Base.getproperty(obj::CppShapeInferenceInputsNeeded, name::Symbol)
    if name === :input_tensors_needed
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    elseif name === :input_tensors_as_shapes_needed
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    else
        getfield(obj, name)
    end
end

export CppShapeInferenceResult_HandleShapeAndType, CppShapeInferenceResult_HandleData, CppShapeInferenceResult, CppShapeInferenceInputsNeeded

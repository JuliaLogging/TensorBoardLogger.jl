# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct TensorDescription <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function TensorDescription(; kwargs...)
        obj = new(meta(TensorDescription), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct TensorDescription
const __meta_TensorDescription = Ref{ProtoMeta}()
function meta(::Type{TensorDescription})
    ProtoBuf.metalock() do
        if !isassigned(__meta_TensorDescription)
            __meta_TensorDescription[] = target = ProtoMeta(TensorDescription)
            fnum = Int[1,2,4]
            allflds = Pair{Symbol,Union{Type,String}}[:dtype => Int32, :shape => TensorShapeProto, :allocation_description => AllocationDescription]
            meta(target, TensorDescription, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_TensorDescription[]
    end
end
function Base.getproperty(obj::TensorDescription, name::Symbol)
    if name === :dtype
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :shape
        return (obj.__protobuf_jl_internal_values[name])::TensorShapeProto
    elseif name === :allocation_description
        return (obj.__protobuf_jl_internal_values[name])::AllocationDescription
    else
        getfield(obj, name)
    end
end

export TensorDescription

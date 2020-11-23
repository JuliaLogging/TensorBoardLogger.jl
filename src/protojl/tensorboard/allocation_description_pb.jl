# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct AllocationDescription <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function AllocationDescription(; kwargs...)
        obj = new(meta(AllocationDescription), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct AllocationDescription
const __meta_AllocationDescription = Ref{ProtoMeta}()
function meta(::Type{AllocationDescription})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AllocationDescription)
            __meta_AllocationDescription[] = target = ProtoMeta(AllocationDescription)
            allflds = Pair{Symbol,Union{Type,String}}[:requested_bytes => Int64, :allocated_bytes => Int64, :allocator_name => AbstractString, :allocation_id => Int64, :has_single_reference => Bool, :ptr => UInt64]
            meta(target, AllocationDescription, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_AllocationDescription[]
    end
end
function Base.getproperty(obj::AllocationDescription, name::Symbol)
    if name === :requested_bytes
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :allocated_bytes
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :allocator_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :allocation_id
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :has_single_reference
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :ptr
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    else
        getfield(obj, name)
    end
end

export AllocationDescription

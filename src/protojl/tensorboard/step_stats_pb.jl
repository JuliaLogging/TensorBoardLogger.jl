# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct AllocationRecord <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function AllocationRecord(; kwargs...)
        obj = new(meta(AllocationRecord), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct AllocationRecord
const __meta_AllocationRecord = Ref{ProtoMeta}()
function meta(::Type{AllocationRecord})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AllocationRecord)
            __meta_AllocationRecord[] = target = ProtoMeta(AllocationRecord)
            allflds = Pair{Symbol,Union{Type,String}}[:alloc_micros => Int64, :alloc_bytes => Int64]
            meta(target, AllocationRecord, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_AllocationRecord[]
    end
end
function Base.getproperty(obj::AllocationRecord, name::Symbol)
    if name === :alloc_micros
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :alloc_bytes
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct AllocatorMemoryUsed <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function AllocatorMemoryUsed(; kwargs...)
        obj = new(meta(AllocatorMemoryUsed), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct AllocatorMemoryUsed
const __meta_AllocatorMemoryUsed = Ref{ProtoMeta}()
function meta(::Type{AllocatorMemoryUsed})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AllocatorMemoryUsed)
            __meta_AllocatorMemoryUsed[] = target = ProtoMeta(AllocatorMemoryUsed)
            fnum = Int[1,2,3,4,6,5]
            allflds = Pair{Symbol,Union{Type,String}}[:allocator_name => AbstractString, :total_bytes => Int64, :peak_bytes => Int64, :live_bytes => Int64, :allocation_records => Base.Vector{AllocationRecord}, :allocator_bytes_in_use => Int64]
            meta(target, AllocatorMemoryUsed, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_AllocatorMemoryUsed[]
    end
end
function Base.getproperty(obj::AllocatorMemoryUsed, name::Symbol)
    if name === :allocator_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :total_bytes
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :peak_bytes
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :live_bytes
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :allocation_records
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AllocationRecord}
    elseif name === :allocator_bytes_in_use
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct NodeOutput <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function NodeOutput(; kwargs...)
        obj = new(meta(NodeOutput), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct NodeOutput
const __meta_NodeOutput = Ref{ProtoMeta}()
function meta(::Type{NodeOutput})
    ProtoBuf.metalock() do
        if !isassigned(__meta_NodeOutput)
            __meta_NodeOutput[] = target = ProtoMeta(NodeOutput)
            fnum = Int[1,3]
            allflds = Pair{Symbol,Union{Type,String}}[:slot => Int32, :tensor_description => TensorDescription]
            meta(target, NodeOutput, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_NodeOutput[]
    end
end
function Base.getproperty(obj::NodeOutput, name::Symbol)
    if name === :slot
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :tensor_description
        return (obj.__protobuf_jl_internal_values[name])::TensorDescription
    else
        getfield(obj, name)
    end
end

mutable struct MemoryStats <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function MemoryStats(; kwargs...)
        obj = new(meta(MemoryStats), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct MemoryStats
const __meta_MemoryStats = Ref{ProtoMeta}()
function meta(::Type{MemoryStats})
    ProtoBuf.metalock() do
        if !isassigned(__meta_MemoryStats)
            __meta_MemoryStats[] = target = ProtoMeta(MemoryStats)
            fnum = Int[1,3,5,2,4,6]
            pack = Symbol[:persistent_tensor_alloc_ids,:device_persistent_tensor_alloc_ids]
            allflds = Pair{Symbol,Union{Type,String}}[:temp_memory_size => Int64, :persistent_memory_size => Int64, :persistent_tensor_alloc_ids => Base.Vector{Int64}, :device_temp_memory_size => Int64, :device_persistent_memory_size => Int64, :device_persistent_tensor_alloc_ids => Base.Vector{Int64}]
            meta(target, MemoryStats, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, pack, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_MemoryStats[]
    end
end
function Base.getproperty(obj::MemoryStats, name::Symbol)
    if name === :temp_memory_size
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :persistent_memory_size
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :persistent_tensor_alloc_ids
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int64}
    elseif name === :device_temp_memory_size
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :device_persistent_memory_size
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :device_persistent_tensor_alloc_ids
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int64}
    else
        getfield(obj, name)
    end
end

mutable struct NodeExecStats <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function NodeExecStats(; kwargs...)
        obj = new(meta(NodeExecStats), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct NodeExecStats
const __meta_NodeExecStats = Ref{ProtoMeta}()
function meta(::Type{NodeExecStats})
    ProtoBuf.metalock() do
        if !isassigned(__meta_NodeExecStats)
            __meta_NodeExecStats[] = target = ProtoMeta(NodeExecStats)
            allflds = Pair{Symbol,Union{Type,String}}[:node_name => AbstractString, :all_start_micros => Int64, :op_start_rel_micros => Int64, :op_end_rel_micros => Int64, :all_end_rel_micros => Int64, :memory => Base.Vector{AllocatorMemoryUsed}, :output => Base.Vector{NodeOutput}, :timeline_label => AbstractString, :scheduled_micros => Int64, :thread_id => UInt32, :referenced_tensor => Base.Vector{AllocationDescription}, :memory_stats => MemoryStats, :all_start_nanos => Int64, :op_start_rel_nanos => Int64, :op_end_rel_nanos => Int64, :all_end_rel_nanos => Int64, :scheduled_nanos => Int64]
            meta(target, NodeExecStats, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_NodeExecStats[]
    end
end
function Base.getproperty(obj::NodeExecStats, name::Symbol)
    if name === :node_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :all_start_micros
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :op_start_rel_micros
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :op_end_rel_micros
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :all_end_rel_micros
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :memory
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AllocatorMemoryUsed}
    elseif name === :output
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{NodeOutput}
    elseif name === :timeline_label
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :scheduled_micros
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :thread_id
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :referenced_tensor
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AllocationDescription}
    elseif name === :memory_stats
        return (obj.__protobuf_jl_internal_values[name])::MemoryStats
    elseif name === :all_start_nanos
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :op_start_rel_nanos
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :op_end_rel_nanos
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :all_end_rel_nanos
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :scheduled_nanos
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct DeviceStepStats_ThreadNamesEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function DeviceStepStats_ThreadNamesEntry(; kwargs...)
        obj = new(meta(DeviceStepStats_ThreadNamesEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct DeviceStepStats_ThreadNamesEntry (mapentry)
const __meta_DeviceStepStats_ThreadNamesEntry = Ref{ProtoMeta}()
function meta(::Type{DeviceStepStats_ThreadNamesEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DeviceStepStats_ThreadNamesEntry)
            __meta_DeviceStepStats_ThreadNamesEntry[] = target = ProtoMeta(DeviceStepStats_ThreadNamesEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => UInt32, :value => AbstractString]
            meta(target, DeviceStepStats_ThreadNamesEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DeviceStepStats_ThreadNamesEntry[]
    end
end
function Base.getproperty(obj::DeviceStepStats_ThreadNamesEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct DeviceStepStats <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function DeviceStepStats(; kwargs...)
        obj = new(meta(DeviceStepStats), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct DeviceStepStats
const __meta_DeviceStepStats = Ref{ProtoMeta}()
function meta(::Type{DeviceStepStats})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DeviceStepStats)
            __meta_DeviceStepStats[] = target = ProtoMeta(DeviceStepStats)
            allflds = Pair{Symbol,Union{Type,String}}[:device => AbstractString, :node_stats => Base.Vector{NodeExecStats}, :thread_names => Base.Dict{UInt32,AbstractString}]
            meta(target, DeviceStepStats, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DeviceStepStats[]
    end
end
function Base.getproperty(obj::DeviceStepStats, name::Symbol)
    if name === :device
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :node_stats
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{NodeExecStats}
    elseif name === :thread_names
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{UInt32,AbstractString}
    else
        getfield(obj, name)
    end
end

mutable struct StepStats <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function StepStats(; kwargs...)
        obj = new(meta(StepStats), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct StepStats
const __meta_StepStats = Ref{ProtoMeta}()
function meta(::Type{StepStats})
    ProtoBuf.metalock() do
        if !isassigned(__meta_StepStats)
            __meta_StepStats[] = target = ProtoMeta(StepStats)
            allflds = Pair{Symbol,Union{Type,String}}[:dev_stats => Base.Vector{DeviceStepStats}]
            meta(target, StepStats, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_StepStats[]
    end
end
function Base.getproperty(obj::StepStats, name::Symbol)
    if name === :dev_stats
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{DeviceStepStats}
    else
        getfield(obj, name)
    end
end

export AllocationRecord, AllocatorMemoryUsed, NodeOutput, MemoryStats, NodeExecStats, DeviceStepStats_ThreadNamesEntry, DeviceStepStats, StepStats
# mapentries: "DeviceStepStats_ThreadNamesEntry" => ("UInt32", "AbstractString")

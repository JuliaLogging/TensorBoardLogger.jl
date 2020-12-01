# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct GPUOptions_Experimental_VirtualDevices <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function GPUOptions_Experimental_VirtualDevices(; kwargs...)
        obj = new(meta(GPUOptions_Experimental_VirtualDevices), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct GPUOptions_Experimental_VirtualDevices
const __meta_GPUOptions_Experimental_VirtualDevices = Ref{ProtoMeta}()
function meta(::Type{GPUOptions_Experimental_VirtualDevices})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GPUOptions_Experimental_VirtualDevices)
            __meta_GPUOptions_Experimental_VirtualDevices[] = target = ProtoMeta(GPUOptions_Experimental_VirtualDevices)
            pack = Symbol[:memory_limit_mb,:priority]
            allflds = Pair{Symbol,Union{Type,String}}[:memory_limit_mb => Base.Vector{Float32}, :priority => Base.Vector{Int32}]
            meta(target, GPUOptions_Experimental_VirtualDevices, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, pack, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GPUOptions_Experimental_VirtualDevices[]
    end
end
function Base.getproperty(obj::GPUOptions_Experimental_VirtualDevices, name::Symbol)
    if name === :memory_limit_mb
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Float32}
    elseif name === :priority
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    else
        getfield(obj, name)
    end
end

mutable struct GPUOptions_Experimental <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function GPUOptions_Experimental(; kwargs...)
        obj = new(meta(GPUOptions_Experimental), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct GPUOptions_Experimental
const __meta_GPUOptions_Experimental = Ref{ProtoMeta}()
function meta(::Type{GPUOptions_Experimental})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GPUOptions_Experimental)
            __meta_GPUOptions_Experimental[] = target = ProtoMeta(GPUOptions_Experimental)
            fnum = Int[1,2,3,4,5,7,8,9]
            allflds = Pair{Symbol,Union{Type,String}}[:virtual_devices => Base.Vector{GPUOptions_Experimental_VirtualDevices}, :use_unified_memory => Bool, :num_dev_to_dev_copy_streams => Int32, :collective_ring_order => AbstractString, :timestamped_allocator => Bool, :kernel_tracker_max_interval => Int32, :kernel_tracker_max_bytes => Int32, :kernel_tracker_max_pending => Int32]
            meta(target, GPUOptions_Experimental, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GPUOptions_Experimental[]
    end
end
function Base.getproperty(obj::GPUOptions_Experimental, name::Symbol)
    if name === :virtual_devices
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{GPUOptions_Experimental_VirtualDevices}
    elseif name === :use_unified_memory
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :num_dev_to_dev_copy_streams
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :collective_ring_order
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :timestamped_allocator
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :kernel_tracker_max_interval
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :kernel_tracker_max_bytes
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :kernel_tracker_max_pending
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct GPUOptions <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function GPUOptions(; kwargs...)
        obj = new(meta(GPUOptions), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct GPUOptions
const __meta_GPUOptions = Ref{ProtoMeta}()
function meta(::Type{GPUOptions})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GPUOptions)
            __meta_GPUOptions[] = target = ProtoMeta(GPUOptions)
            fnum = Int[1,4,2,3,5,6,7,8,9]
            allflds = Pair{Symbol,Union{Type,String}}[:per_process_gpu_memory_fraction => Float64, :allow_growth => Bool, :allocator_type => AbstractString, :deferred_deletion_bytes => Int64, :visible_device_list => AbstractString, :polling_active_delay_usecs => Int32, :polling_inactive_delay_msecs => Int32, :force_gpu_compatible => Bool, :experimental => GPUOptions_Experimental]
            meta(target, GPUOptions, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GPUOptions[]
    end
end
function Base.getproperty(obj::GPUOptions, name::Symbol)
    if name === :per_process_gpu_memory_fraction
        return (obj.__protobuf_jl_internal_values[name])::Float64
    elseif name === :allow_growth
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :allocator_type
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :deferred_deletion_bytes
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :visible_device_list
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :polling_active_delay_usecs
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :polling_inactive_delay_msecs
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :force_gpu_compatible
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :experimental
        return (obj.__protobuf_jl_internal_values[name])::GPUOptions_Experimental
    else
        getfield(obj, name)
    end
end

const OptimizerOptions_Level = (;[
    Symbol("L1") => Int32(0),
    Symbol("L0") => Int32(-1),
]...)

const OptimizerOptions_GlobalJitLevel = (;[
    Symbol("DEFAULT") => Int32(0),
    Symbol("OFF") => Int32(-1),
    Symbol("ON_1") => Int32(1),
    Symbol("ON_2") => Int32(2),
]...)

mutable struct OptimizerOptions <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function OptimizerOptions(; kwargs...)
        obj = new(meta(OptimizerOptions), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct OptimizerOptions
const __meta_OptimizerOptions = Ref{ProtoMeta}()
function meta(::Type{OptimizerOptions})
    ProtoBuf.metalock() do
        if !isassigned(__meta_OptimizerOptions)
            __meta_OptimizerOptions[] = target = ProtoMeta(OptimizerOptions)
            fnum = Int[1,2,6,4,3,5]
            allflds = Pair{Symbol,Union{Type,String}}[:do_common_subexpression_elimination => Bool, :do_constant_folding => Bool, :max_folded_constant_in_bytes => Int64, :do_function_inlining => Bool, :opt_level => Int32, :global_jit_level => Int32]
            meta(target, OptimizerOptions, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_OptimizerOptions[]
    end
end
function Base.getproperty(obj::OptimizerOptions, name::Symbol)
    if name === :do_common_subexpression_elimination
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :do_constant_folding
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :max_folded_constant_in_bytes
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :do_function_inlining
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :opt_level
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :global_jit_level
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct GraphOptions <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function GraphOptions(; kwargs...)
        obj = new(meta(GraphOptions), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct GraphOptions
const __meta_GraphOptions = Ref{ProtoMeta}()
function meta(::Type{GraphOptions})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GraphOptions)
            __meta_GraphOptions[] = target = ProtoMeta(GraphOptions)
            fnum = Int[2,3,4,9,5,6,7,8,10]
            allflds = Pair{Symbol,Union{Type,String}}[:enable_recv_scheduling => Bool, :optimizer_options => OptimizerOptions, :build_cost_model => Int64, :build_cost_model_after => Int64, :infer_shapes => Bool, :place_pruned_graph => Bool, :enable_bfloat16_sendrecv => Bool, :timeline_step => Int32, :rewrite_options => RewriterConfig]
            meta(target, GraphOptions, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GraphOptions[]
    end
end
function Base.getproperty(obj::GraphOptions, name::Symbol)
    if name === :enable_recv_scheduling
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :optimizer_options
        return (obj.__protobuf_jl_internal_values[name])::OptimizerOptions
    elseif name === :build_cost_model
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :build_cost_model_after
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :infer_shapes
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :place_pruned_graph
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :enable_bfloat16_sendrecv
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :timeline_step
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :rewrite_options
        return (obj.__protobuf_jl_internal_values[name])::RewriterConfig
    else
        getfield(obj, name)
    end
end

mutable struct ThreadPoolOptionProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ThreadPoolOptionProto(; kwargs...)
        obj = new(meta(ThreadPoolOptionProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ThreadPoolOptionProto
const __meta_ThreadPoolOptionProto = Ref{ProtoMeta}()
function meta(::Type{ThreadPoolOptionProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ThreadPoolOptionProto)
            __meta_ThreadPoolOptionProto[] = target = ProtoMeta(ThreadPoolOptionProto)
            allflds = Pair{Symbol,Union{Type,String}}[:num_threads => Int32, :global_name => AbstractString]
            meta(target, ThreadPoolOptionProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ThreadPoolOptionProto[]
    end
end
function Base.getproperty(obj::ThreadPoolOptionProto, name::Symbol)
    if name === :num_threads
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :global_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct RPCOptions <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function RPCOptions(; kwargs...)
        obj = new(meta(RPCOptions), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct RPCOptions
const __meta_RPCOptions = Ref{ProtoMeta}()
function meta(::Type{RPCOptions})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RPCOptions)
            __meta_RPCOptions[] = target = ProtoMeta(RPCOptions)
            allflds = Pair{Symbol,Union{Type,String}}[:use_rpc_for_inprocess_master => Bool, :compression_algorithm => AbstractString, :compression_level => Int32, :cache_rpc_response => Bool, :disable_session_connection_sharing => Bool]
            meta(target, RPCOptions, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RPCOptions[]
    end
end
function Base.getproperty(obj::RPCOptions, name::Symbol)
    if name === :use_rpc_for_inprocess_master
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :compression_algorithm
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :compression_level
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :cache_rpc_response
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :disable_session_connection_sharing
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct SessionMetadata <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SessionMetadata(; kwargs...)
        obj = new(meta(SessionMetadata), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SessionMetadata
const __meta_SessionMetadata = Ref{ProtoMeta}()
function meta(::Type{SessionMetadata})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SessionMetadata)
            __meta_SessionMetadata[] = target = ProtoMeta(SessionMetadata)
            allflds = Pair{Symbol,Union{Type,String}}[:name => AbstractString, :version => Int64]
            meta(target, SessionMetadata, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SessionMetadata[]
    end
end
function Base.getproperty(obj::SessionMetadata, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :version
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct ConfigProto_DeviceCountEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ConfigProto_DeviceCountEntry(; kwargs...)
        obj = new(meta(ConfigProto_DeviceCountEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ConfigProto_DeviceCountEntry (mapentry)
const __meta_ConfigProto_DeviceCountEntry = Ref{ProtoMeta}()
function meta(::Type{ConfigProto_DeviceCountEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ConfigProto_DeviceCountEntry)
            __meta_ConfigProto_DeviceCountEntry[] = target = ProtoMeta(ConfigProto_DeviceCountEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => Int32]
            meta(target, ConfigProto_DeviceCountEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ConfigProto_DeviceCountEntry[]
    end
end
function Base.getproperty(obj::ConfigProto_DeviceCountEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

const ConfigProto_Experimental_MlirBridgeRollout = (;[
    Symbol("MLIR_BRIDGE_ROLLOUT_UNSPECIFIED") => Int32(0),
    Symbol("MLIR_BRIDGE_ROLLOUT_ENABLED") => Int32(1),
    Symbol("MLIR_BRIDGE_ROLLOUT_DISABLED") => Int32(2),
]...)

mutable struct ConfigProto_Experimental <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ConfigProto_Experimental(; kwargs...)
        obj = new(meta(ConfigProto_Experimental), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ConfigProto_Experimental
const __meta_ConfigProto_Experimental = Ref{ProtoMeta}()
function meta(::Type{ConfigProto_Experimental})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ConfigProto_Experimental)
            __meta_ConfigProto_Experimental[] = target = ProtoMeta(ConfigProto_Experimental)
            fnum = Int[1,3,4,5,6,7,8,9,10,11,12,13,17,16,14,15]
            allflds = Pair{Symbol,Union{Type,String}}[:collective_group_leader => AbstractString, :executor_type => AbstractString, :recv_buf_max_chunk => Int32, :use_numa_affinity => Bool, :collective_deterministic_sequential_execution => Bool, :collective_nccl => Bool, :share_session_state_in_clusterspec_propagation => Bool, :disable_thread_spinning => Bool, :share_cluster_devices_in_session => Bool, :session_metadata => SessionMetadata, :optimize_for_static_graph => Bool, :enable_mlir_bridge => Bool, :mlir_bridge_rollout => Int32, :enable_mlir_graph_optimization => Bool, :disable_output_partition_graphs => Bool, :xla_fusion_autotuner_thresh => Int64]
            meta(target, ConfigProto_Experimental, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ConfigProto_Experimental[]
    end
end
function Base.getproperty(obj::ConfigProto_Experimental, name::Symbol)
    if name === :collective_group_leader
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :executor_type
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :recv_buf_max_chunk
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :use_numa_affinity
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :collective_deterministic_sequential_execution
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :collective_nccl
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :share_session_state_in_clusterspec_propagation
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :disable_thread_spinning
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :share_cluster_devices_in_session
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :session_metadata
        return (obj.__protobuf_jl_internal_values[name])::SessionMetadata
    elseif name === :optimize_for_static_graph
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :enable_mlir_bridge
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :mlir_bridge_rollout
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :enable_mlir_graph_optimization
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :disable_output_partition_graphs
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :xla_fusion_autotuner_thresh
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct ConfigProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ConfigProto(; kwargs...)
        obj = new(meta(ConfigProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ConfigProto
const __meta_ConfigProto = Ref{ProtoMeta}()
function meta(::Type{ConfigProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ConfigProto)
            __meta_ConfigProto[] = target = ProtoMeta(ConfigProto)
            fnum = Int[1,2,5,9,12,3,4,6,7,8,10,11,13,14,15,17,16]
            allflds = Pair{Symbol,Union{Type,String}}[:device_count => Base.Dict{AbstractString,Int32}, :intra_op_parallelism_threads => Int32, :inter_op_parallelism_threads => Int32, :use_per_session_threads => Bool, :session_inter_op_thread_pool => Base.Vector{ThreadPoolOptionProto}, :placement_period => Int32, :device_filters => Base.Vector{AbstractString}, :gpu_options => GPUOptions, :allow_soft_placement => Bool, :log_device_placement => Bool, :graph_options => GraphOptions, :operation_timeout_in_ms => Int64, :rpc_options => RPCOptions, :cluster_def => ClusterDef, :isolate_session_state => Bool, :share_cluster_devices_in_session => Bool, :experimental => ConfigProto_Experimental]
            meta(target, ConfigProto, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ConfigProto[]
    end
end
function Base.getproperty(obj::ConfigProto, name::Symbol)
    if name === :device_count
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{AbstractString,Int32}
    elseif name === :intra_op_parallelism_threads
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :inter_op_parallelism_threads
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :use_per_session_threads
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :session_inter_op_thread_pool
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ThreadPoolOptionProto}
    elseif name === :placement_period
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :device_filters
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :gpu_options
        return (obj.__protobuf_jl_internal_values[name])::GPUOptions
    elseif name === :allow_soft_placement
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :log_device_placement
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :graph_options
        return (obj.__protobuf_jl_internal_values[name])::GraphOptions
    elseif name === :operation_timeout_in_ms
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :rpc_options
        return (obj.__protobuf_jl_internal_values[name])::RPCOptions
    elseif name === :cluster_def
        return (obj.__protobuf_jl_internal_values[name])::ClusterDef
    elseif name === :isolate_session_state
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :share_cluster_devices_in_session
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :experimental
        return (obj.__protobuf_jl_internal_values[name])::ConfigProto_Experimental
    else
        getfield(obj, name)
    end
end

const RunOptions_TraceLevel = (;[
    Symbol("NO_TRACE") => Int32(0),
    Symbol("SOFTWARE_TRACE") => Int32(1),
    Symbol("HARDWARE_TRACE") => Int32(2),
    Symbol("FULL_TRACE") => Int32(3),
]...)

mutable struct RunOptions_Experimental_RunHandlerPoolOptions <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function RunOptions_Experimental_RunHandlerPoolOptions(; kwargs...)
        obj = new(meta(RunOptions_Experimental_RunHandlerPoolOptions), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct RunOptions_Experimental_RunHandlerPoolOptions
const __meta_RunOptions_Experimental_RunHandlerPoolOptions = Ref{ProtoMeta}()
function meta(::Type{RunOptions_Experimental_RunHandlerPoolOptions})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RunOptions_Experimental_RunHandlerPoolOptions)
            __meta_RunOptions_Experimental_RunHandlerPoolOptions[] = target = ProtoMeta(RunOptions_Experimental_RunHandlerPoolOptions)
            allflds = Pair{Symbol,Union{Type,String}}[:priority => Int64]
            meta(target, RunOptions_Experimental_RunHandlerPoolOptions, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RunOptions_Experimental_RunHandlerPoolOptions[]
    end
end
function Base.getproperty(obj::RunOptions_Experimental_RunHandlerPoolOptions, name::Symbol)
    if name === :priority
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct RunOptions_Experimental <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function RunOptions_Experimental(; kwargs...)
        obj = new(meta(RunOptions_Experimental), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct RunOptions_Experimental
const __meta_RunOptions_Experimental = Ref{ProtoMeta}()
function meta(::Type{RunOptions_Experimental})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RunOptions_Experimental)
            __meta_RunOptions_Experimental[] = target = ProtoMeta(RunOptions_Experimental)
            allflds = Pair{Symbol,Union{Type,String}}[:collective_graph_key => Int64, :use_run_handler_pool => Bool, :run_handler_pool_options => RunOptions_Experimental_RunHandlerPoolOptions]
            meta(target, RunOptions_Experimental, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RunOptions_Experimental[]
    end
end
function Base.getproperty(obj::RunOptions_Experimental, name::Symbol)
    if name === :collective_graph_key
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :use_run_handler_pool
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :run_handler_pool_options
        return (obj.__protobuf_jl_internal_values[name])::RunOptions_Experimental_RunHandlerPoolOptions
    else
        getfield(obj, name)
    end
end

mutable struct RunOptions <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function RunOptions(; kwargs...)
        obj = new(meta(RunOptions), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct RunOptions
const __meta_RunOptions = Ref{ProtoMeta}()
function meta(::Type{RunOptions})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RunOptions)
            __meta_RunOptions[] = target = ProtoMeta(RunOptions)
            fnum = Int[1,2,3,5,6,7,8]
            allflds = Pair{Symbol,Union{Type,String}}[:trace_level => Int32, :timeout_in_ms => Int64, :inter_op_thread_pool => Int32, :output_partition_graphs => Bool, :debug_options => DebugOptions, :report_tensor_allocations_upon_oom => Bool, :experimental => RunOptions_Experimental]
            meta(target, RunOptions, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RunOptions[]
    end
end
function Base.getproperty(obj::RunOptions, name::Symbol)
    if name === :trace_level
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :timeout_in_ms
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :inter_op_thread_pool
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :output_partition_graphs
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :debug_options
        return (obj.__protobuf_jl_internal_values[name])::DebugOptions
    elseif name === :report_tensor_allocations_upon_oom
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :experimental
        return (obj.__protobuf_jl_internal_values[name])::RunOptions_Experimental
    else
        getfield(obj, name)
    end
end

mutable struct RunMetadata_FunctionGraphs <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function RunMetadata_FunctionGraphs(; kwargs...)
        obj = new(meta(RunMetadata_FunctionGraphs), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct RunMetadata_FunctionGraphs
const __meta_RunMetadata_FunctionGraphs = Ref{ProtoMeta}()
function meta(::Type{RunMetadata_FunctionGraphs})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RunMetadata_FunctionGraphs)
            __meta_RunMetadata_FunctionGraphs[] = target = ProtoMeta(RunMetadata_FunctionGraphs)
            allflds = Pair{Symbol,Union{Type,String}}[:partition_graphs => Base.Vector{GraphDef}, :pre_optimization_graph => GraphDef, :post_optimization_graph => GraphDef]
            meta(target, RunMetadata_FunctionGraphs, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RunMetadata_FunctionGraphs[]
    end
end
function Base.getproperty(obj::RunMetadata_FunctionGraphs, name::Symbol)
    if name === :partition_graphs
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{GraphDef}
    elseif name === :pre_optimization_graph
        return (obj.__protobuf_jl_internal_values[name])::GraphDef
    elseif name === :post_optimization_graph
        return (obj.__protobuf_jl_internal_values[name])::GraphDef
    else
        getfield(obj, name)
    end
end

mutable struct RunMetadata <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function RunMetadata(; kwargs...)
        obj = new(meta(RunMetadata), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct RunMetadata
const __meta_RunMetadata = Ref{ProtoMeta}()
function meta(::Type{RunMetadata})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RunMetadata)
            __meta_RunMetadata[] = target = ProtoMeta(RunMetadata)
            allflds = Pair{Symbol,Union{Type,String}}[:step_stats => StepStats, :cost_graph => CostGraphDef, :partition_graphs => Base.Vector{GraphDef}, :function_graphs => Base.Vector{RunMetadata_FunctionGraphs}]
            meta(target, RunMetadata, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RunMetadata[]
    end
end
function Base.getproperty(obj::RunMetadata, name::Symbol)
    if name === :step_stats
        return (obj.__protobuf_jl_internal_values[name])::StepStats
    elseif name === :cost_graph
        return (obj.__protobuf_jl_internal_values[name])::CostGraphDef
    elseif name === :partition_graphs
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{GraphDef}
    elseif name === :function_graphs
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{RunMetadata_FunctionGraphs}
    else
        getfield(obj, name)
    end
end

mutable struct TensorConnection <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function TensorConnection(; kwargs...)
        obj = new(meta(TensorConnection), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct TensorConnection
const __meta_TensorConnection = Ref{ProtoMeta}()
function meta(::Type{TensorConnection})
    ProtoBuf.metalock() do
        if !isassigned(__meta_TensorConnection)
            __meta_TensorConnection[] = target = ProtoMeta(TensorConnection)
            allflds = Pair{Symbol,Union{Type,String}}[:from_tensor => AbstractString, :to_tensor => AbstractString]
            meta(target, TensorConnection, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_TensorConnection[]
    end
end
function Base.getproperty(obj::TensorConnection, name::Symbol)
    if name === :from_tensor
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :to_tensor
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct CallableOptions_FeedDevicesEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function CallableOptions_FeedDevicesEntry(; kwargs...)
        obj = new(meta(CallableOptions_FeedDevicesEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct CallableOptions_FeedDevicesEntry (mapentry)
const __meta_CallableOptions_FeedDevicesEntry = Ref{ProtoMeta}()
function meta(::Type{CallableOptions_FeedDevicesEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CallableOptions_FeedDevicesEntry)
            __meta_CallableOptions_FeedDevicesEntry[] = target = ProtoMeta(CallableOptions_FeedDevicesEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => AbstractString]
            meta(target, CallableOptions_FeedDevicesEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CallableOptions_FeedDevicesEntry[]
    end
end
function Base.getproperty(obj::CallableOptions_FeedDevicesEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct CallableOptions_FetchDevicesEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function CallableOptions_FetchDevicesEntry(; kwargs...)
        obj = new(meta(CallableOptions_FetchDevicesEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct CallableOptions_FetchDevicesEntry (mapentry)
const __meta_CallableOptions_FetchDevicesEntry = Ref{ProtoMeta}()
function meta(::Type{CallableOptions_FetchDevicesEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CallableOptions_FetchDevicesEntry)
            __meta_CallableOptions_FetchDevicesEntry[] = target = ProtoMeta(CallableOptions_FetchDevicesEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => AbstractString]
            meta(target, CallableOptions_FetchDevicesEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CallableOptions_FetchDevicesEntry[]
    end
end
function Base.getproperty(obj::CallableOptions_FetchDevicesEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct CallableOptions <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function CallableOptions(; kwargs...)
        obj = new(meta(CallableOptions), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct CallableOptions
const __meta_CallableOptions = Ref{ProtoMeta}()
function meta(::Type{CallableOptions})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CallableOptions)
            __meta_CallableOptions[] = target = ProtoMeta(CallableOptions)
            allflds = Pair{Symbol,Union{Type,String}}[:feed => Base.Vector{AbstractString}, :fetch => Base.Vector{AbstractString}, :target => Base.Vector{AbstractString}, :run_options => RunOptions, :tensor_connection => Base.Vector{TensorConnection}, :feed_devices => Base.Dict{AbstractString,AbstractString}, :fetch_devices => Base.Dict{AbstractString,AbstractString}, :fetch_skip_sync => Bool]
            meta(target, CallableOptions, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CallableOptions[]
    end
end
function Base.getproperty(obj::CallableOptions, name::Symbol)
    if name === :feed
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :fetch
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :target
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :run_options
        return (obj.__protobuf_jl_internal_values[name])::RunOptions
    elseif name === :tensor_connection
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{TensorConnection}
    elseif name === :feed_devices
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{AbstractString,AbstractString}
    elseif name === :fetch_devices
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{AbstractString,AbstractString}
    elseif name === :fetch_skip_sync
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

export GPUOptions_Experimental_VirtualDevices, GPUOptions_Experimental, GPUOptions, OptimizerOptions_Level, OptimizerOptions_GlobalJitLevel, OptimizerOptions, GraphOptions, ThreadPoolOptionProto, RPCOptions, SessionMetadata, ConfigProto_DeviceCountEntry, ConfigProto_Experimental_MlirBridgeRollout, ConfigProto_Experimental, ConfigProto, RunOptions_TraceLevel, RunOptions_Experimental_RunHandlerPoolOptions, RunOptions_Experimental, RunOptions, RunMetadata_FunctionGraphs, RunMetadata, TensorConnection, CallableOptions_FeedDevicesEntry, CallableOptions_FetchDevicesEntry, CallableOptions
# mapentries: "CallableOptions_FeedDevicesEntry" => ("AbstractString", "AbstractString"), "CallableOptions_FetchDevicesEntry" => ("AbstractString", "AbstractString"), "ConfigProto_DeviceCountEntry" => ("AbstractString", "Int32")

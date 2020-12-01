# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct AutoParallelOptions <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function AutoParallelOptions(; kwargs...)
        obj = new(meta(AutoParallelOptions), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct AutoParallelOptions
const __meta_AutoParallelOptions = Ref{ProtoMeta}()
function meta(::Type{AutoParallelOptions})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AutoParallelOptions)
            __meta_AutoParallelOptions[] = target = ProtoMeta(AutoParallelOptions)
            allflds = Pair{Symbol,Union{Type,String}}[:enable => Bool, :num_replicas => Int32]
            meta(target, AutoParallelOptions, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_AutoParallelOptions[]
    end
end
function Base.getproperty(obj::AutoParallelOptions, name::Symbol)
    if name === :enable
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :num_replicas
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct ScopedAllocatorOptions <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ScopedAllocatorOptions(; kwargs...)
        obj = new(meta(ScopedAllocatorOptions), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ScopedAllocatorOptions
const __meta_ScopedAllocatorOptions = Ref{ProtoMeta}()
function meta(::Type{ScopedAllocatorOptions})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ScopedAllocatorOptions)
            __meta_ScopedAllocatorOptions[] = target = ProtoMeta(ScopedAllocatorOptions)
            allflds = Pair{Symbol,Union{Type,String}}[:enable_op => Base.Vector{AbstractString}]
            meta(target, ScopedAllocatorOptions, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ScopedAllocatorOptions[]
    end
end
function Base.getproperty(obj::ScopedAllocatorOptions, name::Symbol)
    if name === :enable_op
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    else
        getfield(obj, name)
    end
end

const RewriterConfig_Toggle = (;[
    Symbol("DEFAULT") => Int32(0),
    Symbol("ON") => Int32(1),
    Symbol("OFF") => Int32(2),
    Symbol("AGGRESSIVE") => Int32(3),
]...)

const RewriterConfig_CpuLayout = (;[
    Symbol("NO_CONVERSION_ON_CPU") => Int32(0),
    Symbol("NCHW_TO_NHWC") => Int32(1),
    Symbol("NHWC_TO_NCHW") => Int32(2),
]...)

const RewriterConfig_NumIterationsType = (;[
    Symbol("DEFAULT_NUM_ITERS") => Int32(0),
    Symbol("ONE") => Int32(1),
    Symbol("TWO") => Int32(2),
]...)

const RewriterConfig_MemOptType = (;[
    Symbol("DEFAULT_MEM_OPT") => Int32(0),
    Symbol("NO_MEM_OPT") => Int32(1),
    Symbol("MANUAL") => Int32(2),
    Symbol("SWAPPING_HEURISTICS") => Int32(4),
    Symbol("RECOMPUTATION_HEURISTICS") => Int32(5),
    Symbol("SCHEDULING_HEURISTICS") => Int32(6),
    Symbol("HEURISTICS") => Int32(3),
]...)

mutable struct RewriterConfig_CustomGraphOptimizer_ParameterMapEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function RewriterConfig_CustomGraphOptimizer_ParameterMapEntry(; kwargs...)
        obj = new(meta(RewriterConfig_CustomGraphOptimizer_ParameterMapEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct RewriterConfig_CustomGraphOptimizer_ParameterMapEntry (mapentry)
const __meta_RewriterConfig_CustomGraphOptimizer_ParameterMapEntry = Ref{ProtoMeta}()
function meta(::Type{RewriterConfig_CustomGraphOptimizer_ParameterMapEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RewriterConfig_CustomGraphOptimizer_ParameterMapEntry)
            __meta_RewriterConfig_CustomGraphOptimizer_ParameterMapEntry[] = target = ProtoMeta(RewriterConfig_CustomGraphOptimizer_ParameterMapEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => AttrValue]
            meta(target, RewriterConfig_CustomGraphOptimizer_ParameterMapEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RewriterConfig_CustomGraphOptimizer_ParameterMapEntry[]
    end
end
function Base.getproperty(obj::RewriterConfig_CustomGraphOptimizer_ParameterMapEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::AttrValue
    else
        getfield(obj, name)
    end
end

mutable struct RewriterConfig_CustomGraphOptimizer <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function RewriterConfig_CustomGraphOptimizer(; kwargs...)
        obj = new(meta(RewriterConfig_CustomGraphOptimizer), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct RewriterConfig_CustomGraphOptimizer
const __meta_RewriterConfig_CustomGraphOptimizer = Ref{ProtoMeta}()
function meta(::Type{RewriterConfig_CustomGraphOptimizer})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RewriterConfig_CustomGraphOptimizer)
            __meta_RewriterConfig_CustomGraphOptimizer[] = target = ProtoMeta(RewriterConfig_CustomGraphOptimizer)
            allflds = Pair{Symbol,Union{Type,String}}[:name => AbstractString, :parameter_map => Base.Dict{AbstractString,AttrValue}]
            meta(target, RewriterConfig_CustomGraphOptimizer, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RewriterConfig_CustomGraphOptimizer[]
    end
end
function Base.getproperty(obj::RewriterConfig_CustomGraphOptimizer, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :parameter_map
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{AbstractString,AttrValue}
    else
        getfield(obj, name)
    end
end

mutable struct RewriterConfig <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function RewriterConfig(; kwargs...)
        obj = new(meta(RewriterConfig), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct RewriterConfig
const __meta_RewriterConfig = Ref{ProtoMeta}()
function meta(::Type{RewriterConfig})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RewriterConfig)
            __meta_RewriterConfig[] = target = ProtoMeta(RewriterConfig)
            fnum = Int[50,1,3,13,14,24,7,8,9,10,11,2,15,18,22,23,25,19,12,17,26,4,6,20,5,21,16,100,200,300,301]
            allflds = Pair{Symbol,Union{Type,String}}[:cpu_layout_conversion => Int32, :layout_optimizer => Int32, :constant_folding => Int32, :shape_optimization => Int32, :remapping => Int32, :common_subgraph_elimination => Int32, :arithmetic_optimization => Int32, :dependency_optimization => Int32, :loop_optimization => Int32, :function_optimization => Int32, :debug_stripper => Int32, :disable_model_pruning => Bool, :scoped_allocator_optimization => Int32, :pin_to_host_optimization => Int32, :implementation_selector => Int32, :auto_mixed_precision => Int32, :auto_mixed_precision_mkl => Int32, :disable_meta_optimizer => Bool, :meta_optimizer_iterations => Int32, :min_graph_nodes => Int32, :experimental_disable_compressed_tensor_optimization => Bool, :memory_optimization => Int32, :memory_optimizer_target_node_name_scope => AbstractString, :meta_optimizer_timeout_ms => Int64, :auto_parallel => AutoParallelOptions, :fail_on_optimizer_errors => Bool, :scoped_allocator_opts => ScopedAllocatorOptions, :optimizers => Base.Vector{AbstractString}, :custom_optimizers => Base.Vector{RewriterConfig_CustomGraphOptimizer}, :inter_optimizer_verifier_config => VerifierConfig, :post_optimization_verifier_config => VerifierConfig]
            meta(target, RewriterConfig, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RewriterConfig[]
    end
end
function Base.getproperty(obj::RewriterConfig, name::Symbol)
    if name === :cpu_layout_conversion
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :layout_optimizer
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :constant_folding
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :shape_optimization
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :remapping
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :common_subgraph_elimination
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :arithmetic_optimization
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :dependency_optimization
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :loop_optimization
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :function_optimization
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :debug_stripper
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :disable_model_pruning
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :scoped_allocator_optimization
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :pin_to_host_optimization
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :implementation_selector
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :auto_mixed_precision
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :auto_mixed_precision_mkl
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :disable_meta_optimizer
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :meta_optimizer_iterations
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :min_graph_nodes
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :experimental_disable_compressed_tensor_optimization
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :memory_optimization
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :memory_optimizer_target_node_name_scope
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :meta_optimizer_timeout_ms
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :auto_parallel
        return (obj.__protobuf_jl_internal_values[name])::AutoParallelOptions
    elseif name === :fail_on_optimizer_errors
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :scoped_allocator_opts
        return (obj.__protobuf_jl_internal_values[name])::ScopedAllocatorOptions
    elseif name === :optimizers
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :custom_optimizers
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{RewriterConfig_CustomGraphOptimizer}
    elseif name === :inter_optimizer_verifier_config
        return (obj.__protobuf_jl_internal_values[name])::VerifierConfig
    elseif name === :post_optimization_verifier_config
        return (obj.__protobuf_jl_internal_values[name])::VerifierConfig
    else
        getfield(obj, name)
    end
end

export AutoParallelOptions, ScopedAllocatorOptions, RewriterConfig_Toggle, RewriterConfig_CpuLayout, RewriterConfig_NumIterationsType, RewriterConfig_MemOptType, RewriterConfig_CustomGraphOptimizer_ParameterMapEntry, RewriterConfig_CustomGraphOptimizer, RewriterConfig
# mapentries: "RewriterConfig_CustomGraphOptimizer_ParameterMapEntry" => ("AbstractString", "AttrValue")

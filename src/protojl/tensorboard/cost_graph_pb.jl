# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct CostGraphDef_Node_InputInfo <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function CostGraphDef_Node_InputInfo(; kwargs...)
        obj = new(meta(CostGraphDef_Node_InputInfo), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct CostGraphDef_Node_InputInfo
const __meta_CostGraphDef_Node_InputInfo = Ref{ProtoMeta}()
function meta(::Type{CostGraphDef_Node_InputInfo})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CostGraphDef_Node_InputInfo)
            __meta_CostGraphDef_Node_InputInfo[] = target = ProtoMeta(CostGraphDef_Node_InputInfo)
            allflds = Pair{Symbol,Union{Type,String}}[:preceding_node => Int32, :preceding_port => Int32]
            meta(target, CostGraphDef_Node_InputInfo, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CostGraphDef_Node_InputInfo[]
    end
end
function Base.getproperty(obj::CostGraphDef_Node_InputInfo, name::Symbol)
    if name === :preceding_node
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :preceding_port
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct CostGraphDef_Node_OutputInfo <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function CostGraphDef_Node_OutputInfo(; kwargs...)
        obj = new(meta(CostGraphDef_Node_OutputInfo), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct CostGraphDef_Node_OutputInfo
const __meta_CostGraphDef_Node_OutputInfo = Ref{ProtoMeta}()
function meta(::Type{CostGraphDef_Node_OutputInfo})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CostGraphDef_Node_OutputInfo)
            __meta_CostGraphDef_Node_OutputInfo[] = target = ProtoMeta(CostGraphDef_Node_OutputInfo)
            allflds = Pair{Symbol,Union{Type,String}}[:size => Int64, :alias_input_port => Int64, :shape => TensorShapeProto, :dtype => Int32]
            meta(target, CostGraphDef_Node_OutputInfo, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CostGraphDef_Node_OutputInfo[]
    end
end
function Base.getproperty(obj::CostGraphDef_Node_OutputInfo, name::Symbol)
    if name === :size
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :alias_input_port
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :shape
        return (obj.__protobuf_jl_internal_values[name])::TensorShapeProto
    elseif name === :dtype
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct CostGraphDef_Node <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function CostGraphDef_Node(; kwargs...)
        obj = new(meta(CostGraphDef_Node), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct CostGraphDef_Node
const __meta_CostGraphDef_Node = Ref{ProtoMeta}()
function meta(::Type{CostGraphDef_Node})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CostGraphDef_Node)
            __meta_CostGraphDef_Node[] = target = ProtoMeta(CostGraphDef_Node)
            fnum = Int[1,2,3,4,5,6,12,10,11,16,9,14,15,7,8,17]
            pack = Symbol[:control_input]
            allflds = Pair{Symbol,Union{Type,String}}[:name => AbstractString, :device => AbstractString, :id => Int32, :input_info => Base.Vector{CostGraphDef_Node_InputInfo}, :output_info => Base.Vector{CostGraphDef_Node_OutputInfo}, :temporary_memory_size => Int64, :persistent_memory_size => Int64, :host_temp_memory_size => Int64, :device_temp_memory_size => Int64, :device_persistent_memory_size => Int64, :compute_cost => Int64, :compute_time => Int64, :memory_time => Int64, :is_final => Bool, :control_input => Base.Vector{Int32}, :inaccurate => Bool]
            meta(target, CostGraphDef_Node, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, pack, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CostGraphDef_Node[]
    end
end
function Base.getproperty(obj::CostGraphDef_Node, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :device
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :id
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :input_info
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{CostGraphDef_Node_InputInfo}
    elseif name === :output_info
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{CostGraphDef_Node_OutputInfo}
    elseif name === :temporary_memory_size
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :persistent_memory_size
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :host_temp_memory_size
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :device_temp_memory_size
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :device_persistent_memory_size
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :compute_cost
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :compute_time
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :memory_time
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :is_final
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :control_input
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    elseif name === :inaccurate
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct CostGraphDef_AggregatedCost <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function CostGraphDef_AggregatedCost(; kwargs...)
        obj = new(meta(CostGraphDef_AggregatedCost), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct CostGraphDef_AggregatedCost
const __meta_CostGraphDef_AggregatedCost = Ref{ProtoMeta}()
function meta(::Type{CostGraphDef_AggregatedCost})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CostGraphDef_AggregatedCost)
            __meta_CostGraphDef_AggregatedCost[] = target = ProtoMeta(CostGraphDef_AggregatedCost)
            allflds = Pair{Symbol,Union{Type,String}}[:cost => Float32, :dimension => AbstractString]
            meta(target, CostGraphDef_AggregatedCost, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CostGraphDef_AggregatedCost[]
    end
end
function Base.getproperty(obj::CostGraphDef_AggregatedCost, name::Symbol)
    if name === :cost
        return (obj.__protobuf_jl_internal_values[name])::Float32
    elseif name === :dimension
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct CostGraphDef <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function CostGraphDef(; kwargs...)
        obj = new(meta(CostGraphDef), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct CostGraphDef
const __meta_CostGraphDef = Ref{ProtoMeta}()
function meta(::Type{CostGraphDef})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CostGraphDef)
            __meta_CostGraphDef[] = target = ProtoMeta(CostGraphDef)
            allflds = Pair{Symbol,Union{Type,String}}[:node => Base.Vector{CostGraphDef_Node}, :cost => Base.Vector{CostGraphDef_AggregatedCost}]
            meta(target, CostGraphDef, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CostGraphDef[]
    end
end
function Base.getproperty(obj::CostGraphDef, name::Symbol)
    if name === :node
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{CostGraphDef_Node}
    elseif name === :cost
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{CostGraphDef_AggregatedCost}
    else
        getfield(obj, name)
    end
end

export CostGraphDef_Node_InputInfo, CostGraphDef_Node_OutputInfo, CostGraphDef_Node, CostGraphDef_AggregatedCost, CostGraphDef

# Autogenerated using ProtoBuf.jl v1.0.11 on 2023-06-19T18:18:24.424
# original file: /home/lior/TensorBoardLogger.jl/gen/proto/tensorboard/compat/proto/cost_graph.proto (proto3 syntax)

import ProtoBuf as PB
using ProtoBuf: OneOf
using ProtoBuf.EnumX: @enumx

export var"CostGraphDef.Node.InputInfo", var"CostGraphDef.AggregatedCost"
export var"CostGraphDef.Node.OutputInfo", var"CostGraphDef.Node", CostGraphDef

struct var"CostGraphDef.Node.InputInfo"
    preceding_node::Int32
    preceding_port::Int32
end
PB.default_values(::Type{var"CostGraphDef.Node.InputInfo"}) = (;preceding_node = zero(Int32), preceding_port = zero(Int32))
PB.field_numbers(::Type{var"CostGraphDef.Node.InputInfo"}) = (;preceding_node = 1, preceding_port = 2)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:var"CostGraphDef.Node.InputInfo"})
    preceding_node = zero(Int32)
    preceding_port = zero(Int32)
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            preceding_node = PB.decode(d, Int32)
        elseif field_number == 2
            preceding_port = PB.decode(d, Int32)
        else
            PB.skip(d, wire_type)
        end
    end
    return var"CostGraphDef.Node.InputInfo"(preceding_node, preceding_port)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::var"CostGraphDef.Node.InputInfo")
    initpos = position(e.io)
    x.preceding_node != zero(Int32) && PB.encode(e, 1, x.preceding_node)
    x.preceding_port != zero(Int32) && PB.encode(e, 2, x.preceding_port)
    return position(e.io) - initpos
end
function PB._encoded_size(x::var"CostGraphDef.Node.InputInfo")
    encoded_size = 0
    x.preceding_node != zero(Int32) && (encoded_size += PB._encoded_size(x.preceding_node, 1))
    x.preceding_port != zero(Int32) && (encoded_size += PB._encoded_size(x.preceding_port, 2))
    return encoded_size
end

struct var"CostGraphDef.AggregatedCost"
    cost::Float32
    dimension::String
end
PB.default_values(::Type{var"CostGraphDef.AggregatedCost"}) = (;cost = zero(Float32), dimension = "")
PB.field_numbers(::Type{var"CostGraphDef.AggregatedCost"}) = (;cost = 1, dimension = 2)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:var"CostGraphDef.AggregatedCost"})
    cost = zero(Float32)
    dimension = ""
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            cost = PB.decode(d, Float32)
        elseif field_number == 2
            dimension = PB.decode(d, String)
        else
            PB.skip(d, wire_type)
        end
    end
    return var"CostGraphDef.AggregatedCost"(cost, dimension)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::var"CostGraphDef.AggregatedCost")
    initpos = position(e.io)
    x.cost != zero(Float32) && PB.encode(e, 1, x.cost)
    !isempty(x.dimension) && PB.encode(e, 2, x.dimension)
    return position(e.io) - initpos
end
function PB._encoded_size(x::var"CostGraphDef.AggregatedCost")
    encoded_size = 0
    x.cost != zero(Float32) && (encoded_size += PB._encoded_size(x.cost, 1))
    !isempty(x.dimension) && (encoded_size += PB._encoded_size(x.dimension, 2))
    return encoded_size
end

struct var"CostGraphDef.Node.OutputInfo"
    size::Int64
    alias_input_port::Int64
    shape::Union{Nothing,TensorShapeProto}
    dtype::var"#DataType".T
end
PB.default_values(::Type{var"CostGraphDef.Node.OutputInfo"}) = (;size = zero(Int64), alias_input_port = zero(Int64), shape = nothing, dtype = var"#DataType".DT_INVALID)
PB.field_numbers(::Type{var"CostGraphDef.Node.OutputInfo"}) = (;size = 1, alias_input_port = 2, shape = 3, dtype = 4)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:var"CostGraphDef.Node.OutputInfo"})
    size = zero(Int64)
    alias_input_port = zero(Int64)
    shape = Ref{Union{Nothing,TensorShapeProto}}(nothing)
    dtype = var"#DataType".DT_INVALID
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            size = PB.decode(d, Int64)
        elseif field_number == 2
            alias_input_port = PB.decode(d, Int64)
        elseif field_number == 3
            PB.decode!(d, shape)
        elseif field_number == 4
            dtype = PB.decode(d, var"#DataType".T)
        else
            PB.skip(d, wire_type)
        end
    end
    return var"CostGraphDef.Node.OutputInfo"(size, alias_input_port, shape[], dtype)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::var"CostGraphDef.Node.OutputInfo")
    initpos = position(e.io)
    x.size != zero(Int64) && PB.encode(e, 1, x.size)
    x.alias_input_port != zero(Int64) && PB.encode(e, 2, x.alias_input_port)
    !isnothing(x.shape) && PB.encode(e, 3, x.shape)
    x.dtype != var"#DataType".DT_INVALID && PB.encode(e, 4, x.dtype)
    return position(e.io) - initpos
end
function PB._encoded_size(x::var"CostGraphDef.Node.OutputInfo")
    encoded_size = 0
    x.size != zero(Int64) && (encoded_size += PB._encoded_size(x.size, 1))
    x.alias_input_port != zero(Int64) && (encoded_size += PB._encoded_size(x.alias_input_port, 2))
    !isnothing(x.shape) && (encoded_size += PB._encoded_size(x.shape, 3))
    x.dtype != var"#DataType".DT_INVALID && (encoded_size += PB._encoded_size(x.dtype, 4))
    return encoded_size
end

struct var"CostGraphDef.Node"
    name::String
    device::String
    id::Int32
    input_info::Vector{var"CostGraphDef.Node.InputInfo"}
    output_info::Vector{var"CostGraphDef.Node.OutputInfo"}
    temporary_memory_size::Int64
    persistent_memory_size::Int64
    host_temp_memory_size::Int64
    device_temp_memory_size::Int64
    device_persistent_memory_size::Int64
    compute_cost::Int64
    compute_time::Int64
    memory_time::Int64
    is_final::Bool
    control_input::Vector{Int32}
    inaccurate::Bool
end
PB.default_values(::Type{var"CostGraphDef.Node"}) = (;name = "", device = "", id = zero(Int32), input_info = Vector{var"CostGraphDef.Node.InputInfo"}(), output_info = Vector{var"CostGraphDef.Node.OutputInfo"}(), temporary_memory_size = zero(Int64), persistent_memory_size = zero(Int64), host_temp_memory_size = zero(Int64), device_temp_memory_size = zero(Int64), device_persistent_memory_size = zero(Int64), compute_cost = zero(Int64), compute_time = zero(Int64), memory_time = zero(Int64), is_final = false, control_input = Vector{Int32}(), inaccurate = false)
PB.field_numbers(::Type{var"CostGraphDef.Node"}) = (;name = 1, device = 2, id = 3, input_info = 4, output_info = 5, temporary_memory_size = 6, persistent_memory_size = 12, host_temp_memory_size = 10, device_temp_memory_size = 11, device_persistent_memory_size = 16, compute_cost = 9, compute_time = 14, memory_time = 15, is_final = 7, control_input = 8, inaccurate = 17)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:var"CostGraphDef.Node"})
    name = ""
    device = ""
    id = zero(Int32)
    input_info = PB.BufferedVector{var"CostGraphDef.Node.InputInfo"}()
    output_info = PB.BufferedVector{var"CostGraphDef.Node.OutputInfo"}()
    temporary_memory_size = zero(Int64)
    persistent_memory_size = zero(Int64)
    host_temp_memory_size = zero(Int64)
    device_temp_memory_size = zero(Int64)
    device_persistent_memory_size = zero(Int64)
    compute_cost = zero(Int64)
    compute_time = zero(Int64)
    memory_time = zero(Int64)
    is_final = false
    control_input = PB.BufferedVector{Int32}()
    inaccurate = false
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            name = PB.decode(d, String)
        elseif field_number == 2
            device = PB.decode(d, String)
        elseif field_number == 3
            id = PB.decode(d, Int32)
        elseif field_number == 4
            PB.decode!(d, input_info)
        elseif field_number == 5
            PB.decode!(d, output_info)
        elseif field_number == 6
            temporary_memory_size = PB.decode(d, Int64)
        elseif field_number == 12
            persistent_memory_size = PB.decode(d, Int64)
        elseif field_number == 10
            host_temp_memory_size = PB.decode(d, Int64)
        elseif field_number == 11
            device_temp_memory_size = PB.decode(d, Int64)
        elseif field_number == 16
            device_persistent_memory_size = PB.decode(d, Int64)
        elseif field_number == 9
            compute_cost = PB.decode(d, Int64)
        elseif field_number == 14
            compute_time = PB.decode(d, Int64)
        elseif field_number == 15
            memory_time = PB.decode(d, Int64)
        elseif field_number == 7
            is_final = PB.decode(d, Bool)
        elseif field_number == 8
            PB.decode!(d, wire_type, control_input)
        elseif field_number == 17
            inaccurate = PB.decode(d, Bool)
        else
            PB.skip(d, wire_type)
        end
    end
    return var"CostGraphDef.Node"(name, device, id, input_info[], output_info[], temporary_memory_size, persistent_memory_size, host_temp_memory_size, device_temp_memory_size, device_persistent_memory_size, compute_cost, compute_time, memory_time, is_final, control_input[], inaccurate)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::var"CostGraphDef.Node")
    initpos = position(e.io)
    !isempty(x.name) && PB.encode(e, 1, x.name)
    !isempty(x.device) && PB.encode(e, 2, x.device)
    x.id != zero(Int32) && PB.encode(e, 3, x.id)
    !isempty(x.input_info) && PB.encode(e, 4, x.input_info)
    !isempty(x.output_info) && PB.encode(e, 5, x.output_info)
    x.temporary_memory_size != zero(Int64) && PB.encode(e, 6, x.temporary_memory_size)
    x.persistent_memory_size != zero(Int64) && PB.encode(e, 12, x.persistent_memory_size)
    x.host_temp_memory_size != zero(Int64) && PB.encode(e, 10, x.host_temp_memory_size)
    x.device_temp_memory_size != zero(Int64) && PB.encode(e, 11, x.device_temp_memory_size)
    x.device_persistent_memory_size != zero(Int64) && PB.encode(e, 16, x.device_persistent_memory_size)
    x.compute_cost != zero(Int64) && PB.encode(e, 9, x.compute_cost)
    x.compute_time != zero(Int64) && PB.encode(e, 14, x.compute_time)
    x.memory_time != zero(Int64) && PB.encode(e, 15, x.memory_time)
    x.is_final != false && PB.encode(e, 7, x.is_final)
    !isempty(x.control_input) && PB.encode(e, 8, x.control_input)
    x.inaccurate != false && PB.encode(e, 17, x.inaccurate)
    return position(e.io) - initpos
end
function PB._encoded_size(x::var"CostGraphDef.Node")
    encoded_size = 0
    !isempty(x.name) && (encoded_size += PB._encoded_size(x.name, 1))
    !isempty(x.device) && (encoded_size += PB._encoded_size(x.device, 2))
    x.id != zero(Int32) && (encoded_size += PB._encoded_size(x.id, 3))
    !isempty(x.input_info) && (encoded_size += PB._encoded_size(x.input_info, 4))
    !isempty(x.output_info) && (encoded_size += PB._encoded_size(x.output_info, 5))
    x.temporary_memory_size != zero(Int64) && (encoded_size += PB._encoded_size(x.temporary_memory_size, 6))
    x.persistent_memory_size != zero(Int64) && (encoded_size += PB._encoded_size(x.persistent_memory_size, 12))
    x.host_temp_memory_size != zero(Int64) && (encoded_size += PB._encoded_size(x.host_temp_memory_size, 10))
    x.device_temp_memory_size != zero(Int64) && (encoded_size += PB._encoded_size(x.device_temp_memory_size, 11))
    x.device_persistent_memory_size != zero(Int64) && (encoded_size += PB._encoded_size(x.device_persistent_memory_size, 16))
    x.compute_cost != zero(Int64) && (encoded_size += PB._encoded_size(x.compute_cost, 9))
    x.compute_time != zero(Int64) && (encoded_size += PB._encoded_size(x.compute_time, 14))
    x.memory_time != zero(Int64) && (encoded_size += PB._encoded_size(x.memory_time, 15))
    x.is_final != false && (encoded_size += PB._encoded_size(x.is_final, 7))
    !isempty(x.control_input) && (encoded_size += PB._encoded_size(x.control_input, 8))
    x.inaccurate != false && (encoded_size += PB._encoded_size(x.inaccurate, 17))
    return encoded_size
end

struct CostGraphDef
    node::Vector{var"CostGraphDef.Node"}
    cost::Vector{var"CostGraphDef.AggregatedCost"}
end
PB.default_values(::Type{CostGraphDef}) = (;node = Vector{var"CostGraphDef.Node"}(), cost = Vector{var"CostGraphDef.AggregatedCost"}())
PB.field_numbers(::Type{CostGraphDef}) = (;node = 1, cost = 2)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:CostGraphDef})
    node = PB.BufferedVector{var"CostGraphDef.Node"}()
    cost = PB.BufferedVector{var"CostGraphDef.AggregatedCost"}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, node)
        elseif field_number == 2
            PB.decode!(d, cost)
        else
            PB.skip(d, wire_type)
        end
    end
    return CostGraphDef(node[], cost[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::CostGraphDef)
    initpos = position(e.io)
    !isempty(x.node) && PB.encode(e, 1, x.node)
    !isempty(x.cost) && PB.encode(e, 2, x.cost)
    return position(e.io) - initpos
end
function PB._encoded_size(x::CostGraphDef)
    encoded_size = 0
    !isempty(x.node) && (encoded_size += PB._encoded_size(x.node, 1))
    !isempty(x.cost) && (encoded_size += PB._encoded_size(x.cost, 2))
    return encoded_size
end
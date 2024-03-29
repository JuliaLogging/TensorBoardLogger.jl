# Autogenerated using ProtoBuf.jl v1.0.11 on 2023-06-19T18:18:24.775
# original file: /home/lior/TensorBoardLogger.jl/gen/proto/tensorboard/compat/proto/saved_object_graph.proto (proto3 syntax)

import ProtoBuf as PB
using ProtoBuf: OneOf
using ProtoBuf.EnumX: @enumx

export SavedAsset, CapturedTensor, SavedUserObject, SavedConcreteFunction, SaveableObject
export SavedResource, var"FunctionSpec.JitCompile", SavedConstant, FunctionSpec
export SavedBareConcreteFunction, SavedFunction, SavedObjectGraph, SavedVariable
export SavedObject

# Abstract types to help resolve mutually recursive definitions
abstract type var"##AbstractSavedObjectGraph" end
abstract type var"##AbstractSavedVariable" end
abstract type var"##AbstractSavedObject" end


struct SavedAsset
    asset_file_def_index::Int32
end
PB.default_values(::Type{SavedAsset}) = (;asset_file_def_index = zero(Int32))
PB.field_numbers(::Type{SavedAsset}) = (;asset_file_def_index = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:SavedAsset})
    asset_file_def_index = zero(Int32)
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            asset_file_def_index = PB.decode(d, Int32)
        else
            PB.skip(d, wire_type)
        end
    end
    return SavedAsset(asset_file_def_index)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::SavedAsset)
    initpos = position(e.io)
    x.asset_file_def_index != zero(Int32) && PB.encode(e, 1, x.asset_file_def_index)
    return position(e.io) - initpos
end
function PB._encoded_size(x::SavedAsset)
    encoded_size = 0
    x.asset_file_def_index != zero(Int32) && (encoded_size += PB._encoded_size(x.asset_file_def_index, 1))
    return encoded_size
end

struct CapturedTensor
    name::String
    concrete_function::String
end
PB.default_values(::Type{CapturedTensor}) = (;name = "", concrete_function = "")
PB.field_numbers(::Type{CapturedTensor}) = (;name = 1, concrete_function = 2)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:CapturedTensor})
    name = ""
    concrete_function = ""
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            name = PB.decode(d, String)
        elseif field_number == 2
            concrete_function = PB.decode(d, String)
        else
            PB.skip(d, wire_type)
        end
    end
    return CapturedTensor(name, concrete_function)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::CapturedTensor)
    initpos = position(e.io)
    !isempty(x.name) && PB.encode(e, 1, x.name)
    !isempty(x.concrete_function) && PB.encode(e, 2, x.concrete_function)
    return position(e.io) - initpos
end
function PB._encoded_size(x::CapturedTensor)
    encoded_size = 0
    !isempty(x.name) && (encoded_size += PB._encoded_size(x.name, 1))
    !isempty(x.concrete_function) && (encoded_size += PB._encoded_size(x.concrete_function, 2))
    return encoded_size
end

struct SavedUserObject
    identifier::String
    version::Union{Nothing,VersionDef}
    metadata::String
end
PB.default_values(::Type{SavedUserObject}) = (;identifier = "", version = nothing, metadata = "")
PB.field_numbers(::Type{SavedUserObject}) = (;identifier = 1, version = 2, metadata = 3)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:SavedUserObject})
    identifier = ""
    version = Ref{Union{Nothing,VersionDef}}(nothing)
    metadata = ""
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            identifier = PB.decode(d, String)
        elseif field_number == 2
            PB.decode!(d, version)
        elseif field_number == 3
            metadata = PB.decode(d, String)
        else
            PB.skip(d, wire_type)
        end
    end
    return SavedUserObject(identifier, version[], metadata)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::SavedUserObject)
    initpos = position(e.io)
    !isempty(x.identifier) && PB.encode(e, 1, x.identifier)
    !isnothing(x.version) && PB.encode(e, 2, x.version)
    !isempty(x.metadata) && PB.encode(e, 3, x.metadata)
    return position(e.io) - initpos
end
function PB._encoded_size(x::SavedUserObject)
    encoded_size = 0
    !isempty(x.identifier) && (encoded_size += PB._encoded_size(x.identifier, 1))
    !isnothing(x.version) && (encoded_size += PB._encoded_size(x.version, 2))
    !isempty(x.metadata) && (encoded_size += PB._encoded_size(x.metadata, 3))
    return encoded_size
end

struct SavedConcreteFunction
    bound_inputs::Vector{Int32}
    canonicalized_input_signature::Union{Nothing,StructuredValue}
    output_signature::Union{Nothing,StructuredValue}
end
PB.default_values(::Type{SavedConcreteFunction}) = (;bound_inputs = Vector{Int32}(), canonicalized_input_signature = nothing, output_signature = nothing)
PB.field_numbers(::Type{SavedConcreteFunction}) = (;bound_inputs = 2, canonicalized_input_signature = 3, output_signature = 4)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:SavedConcreteFunction})
    bound_inputs = PB.BufferedVector{Int32}()
    canonicalized_input_signature = Ref{Union{Nothing,StructuredValue}}(nothing)
    output_signature = Ref{Union{Nothing,StructuredValue}}(nothing)
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 2
            PB.decode!(d, wire_type, bound_inputs)
        elseif field_number == 3
            PB.decode!(d, canonicalized_input_signature)
        elseif field_number == 4
            PB.decode!(d, output_signature)
        else
            PB.skip(d, wire_type)
        end
    end
    return SavedConcreteFunction(bound_inputs[], canonicalized_input_signature[], output_signature[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::SavedConcreteFunction)
    initpos = position(e.io)
    !isempty(x.bound_inputs) && PB.encode(e, 2, x.bound_inputs)
    !isnothing(x.canonicalized_input_signature) && PB.encode(e, 3, x.canonicalized_input_signature)
    !isnothing(x.output_signature) && PB.encode(e, 4, x.output_signature)
    return position(e.io) - initpos
end
function PB._encoded_size(x::SavedConcreteFunction)
    encoded_size = 0
    !isempty(x.bound_inputs) && (encoded_size += PB._encoded_size(x.bound_inputs, 2))
    !isnothing(x.canonicalized_input_signature) && (encoded_size += PB._encoded_size(x.canonicalized_input_signature, 3))
    !isnothing(x.output_signature) && (encoded_size += PB._encoded_size(x.output_signature, 4))
    return encoded_size
end

struct SaveableObject
    save_function::Int32
    restore_function::Int32
end
PB.default_values(::Type{SaveableObject}) = (;save_function = zero(Int32), restore_function = zero(Int32))
PB.field_numbers(::Type{SaveableObject}) = (;save_function = 2, restore_function = 3)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:SaveableObject})
    save_function = zero(Int32)
    restore_function = zero(Int32)
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 2
            save_function = PB.decode(d, Int32)
        elseif field_number == 3
            restore_function = PB.decode(d, Int32)
        else
            PB.skip(d, wire_type)
        end
    end
    return SaveableObject(save_function, restore_function)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::SaveableObject)
    initpos = position(e.io)
    x.save_function != zero(Int32) && PB.encode(e, 2, x.save_function)
    x.restore_function != zero(Int32) && PB.encode(e, 3, x.restore_function)
    return position(e.io) - initpos
end
function PB._encoded_size(x::SaveableObject)
    encoded_size = 0
    x.save_function != zero(Int32) && (encoded_size += PB._encoded_size(x.save_function, 2))
    x.restore_function != zero(Int32) && (encoded_size += PB._encoded_size(x.restore_function, 3))
    return encoded_size
end

struct SavedResource
    device::String
end
PB.default_values(::Type{SavedResource}) = (;device = "")
PB.field_numbers(::Type{SavedResource}) = (;device = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:SavedResource})
    device = ""
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            device = PB.decode(d, String)
        else
            PB.skip(d, wire_type)
        end
    end
    return SavedResource(device)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::SavedResource)
    initpos = position(e.io)
    !isempty(x.device) && PB.encode(e, 1, x.device)
    return position(e.io) - initpos
end
function PB._encoded_size(x::SavedResource)
    encoded_size = 0
    !isempty(x.device) && (encoded_size += PB._encoded_size(x.device, 1))
    return encoded_size
end

@enumx var"FunctionSpec.JitCompile" DEFAULT=0 ON=1 OFF=2

struct SavedConstant
    operation::String
end
PB.default_values(::Type{SavedConstant}) = (;operation = "")
PB.field_numbers(::Type{SavedConstant}) = (;operation = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:SavedConstant})
    operation = ""
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            operation = PB.decode(d, String)
        else
            PB.skip(d, wire_type)
        end
    end
    return SavedConstant(operation)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::SavedConstant)
    initpos = position(e.io)
    !isempty(x.operation) && PB.encode(e, 1, x.operation)
    return position(e.io) - initpos
end
function PB._encoded_size(x::SavedConstant)
    encoded_size = 0
    !isempty(x.operation) && (encoded_size += PB._encoded_size(x.operation, 1))
    return encoded_size
end

struct FunctionSpec
    fullargspec::Union{Nothing,StructuredValue}
    is_method::Bool
    input_signature::Union{Nothing,StructuredValue}
    jit_compile::var"FunctionSpec.JitCompile".T
end
PB.reserved_fields(::Type{FunctionSpec}) = (names = String[], numbers = Union{Int,UnitRange{Int}}[3, 4])
PB.default_values(::Type{FunctionSpec}) = (;fullargspec = nothing, is_method = false, input_signature = nothing, jit_compile = var"FunctionSpec.JitCompile".DEFAULT)
PB.field_numbers(::Type{FunctionSpec}) = (;fullargspec = 1, is_method = 2, input_signature = 5, jit_compile = 6)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:FunctionSpec})
    fullargspec = Ref{Union{Nothing,StructuredValue}}(nothing)
    is_method = false
    input_signature = Ref{Union{Nothing,StructuredValue}}(nothing)
    jit_compile = var"FunctionSpec.JitCompile".DEFAULT
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, fullargspec)
        elseif field_number == 2
            is_method = PB.decode(d, Bool)
        elseif field_number == 5
            PB.decode!(d, input_signature)
        elseif field_number == 6
            jit_compile = PB.decode(d, var"FunctionSpec.JitCompile".T)
        else
            PB.skip(d, wire_type)
        end
    end
    return FunctionSpec(fullargspec[], is_method, input_signature[], jit_compile)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::FunctionSpec)
    initpos = position(e.io)
    !isnothing(x.fullargspec) && PB.encode(e, 1, x.fullargspec)
    x.is_method != false && PB.encode(e, 2, x.is_method)
    !isnothing(x.input_signature) && PB.encode(e, 5, x.input_signature)
    x.jit_compile != var"FunctionSpec.JitCompile".DEFAULT && PB.encode(e, 6, x.jit_compile)
    return position(e.io) - initpos
end
function PB._encoded_size(x::FunctionSpec)
    encoded_size = 0
    !isnothing(x.fullargspec) && (encoded_size += PB._encoded_size(x.fullargspec, 1))
    x.is_method != false && (encoded_size += PB._encoded_size(x.is_method, 2))
    !isnothing(x.input_signature) && (encoded_size += PB._encoded_size(x.input_signature, 5))
    x.jit_compile != var"FunctionSpec.JitCompile".DEFAULT && (encoded_size += PB._encoded_size(x.jit_compile, 6))
    return encoded_size
end

struct SavedBareConcreteFunction
    concrete_function_name::String
    argument_keywords::Vector{String}
    allowed_positional_arguments::Int64
    function_spec::Union{Nothing,FunctionSpec}
end
PB.default_values(::Type{SavedBareConcreteFunction}) = (;concrete_function_name = "", argument_keywords = Vector{String}(), allowed_positional_arguments = zero(Int64), function_spec = nothing)
PB.field_numbers(::Type{SavedBareConcreteFunction}) = (;concrete_function_name = 1, argument_keywords = 2, allowed_positional_arguments = 3, function_spec = 4)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:SavedBareConcreteFunction})
    concrete_function_name = ""
    argument_keywords = PB.BufferedVector{String}()
    allowed_positional_arguments = zero(Int64)
    function_spec = Ref{Union{Nothing,FunctionSpec}}(nothing)
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            concrete_function_name = PB.decode(d, String)
        elseif field_number == 2
            PB.decode!(d, argument_keywords)
        elseif field_number == 3
            allowed_positional_arguments = PB.decode(d, Int64)
        elseif field_number == 4
            PB.decode!(d, function_spec)
        else
            PB.skip(d, wire_type)
        end
    end
    return SavedBareConcreteFunction(concrete_function_name, argument_keywords[], allowed_positional_arguments, function_spec[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::SavedBareConcreteFunction)
    initpos = position(e.io)
    !isempty(x.concrete_function_name) && PB.encode(e, 1, x.concrete_function_name)
    !isempty(x.argument_keywords) && PB.encode(e, 2, x.argument_keywords)
    x.allowed_positional_arguments != zero(Int64) && PB.encode(e, 3, x.allowed_positional_arguments)
    !isnothing(x.function_spec) && PB.encode(e, 4, x.function_spec)
    return position(e.io) - initpos
end
function PB._encoded_size(x::SavedBareConcreteFunction)
    encoded_size = 0
    !isempty(x.concrete_function_name) && (encoded_size += PB._encoded_size(x.concrete_function_name, 1))
    !isempty(x.argument_keywords) && (encoded_size += PB._encoded_size(x.argument_keywords, 2))
    x.allowed_positional_arguments != zero(Int64) && (encoded_size += PB._encoded_size(x.allowed_positional_arguments, 3))
    !isnothing(x.function_spec) && (encoded_size += PB._encoded_size(x.function_spec, 4))
    return encoded_size
end

struct SavedFunction
    concrete_functions::Vector{String}
    function_spec::Union{Nothing,FunctionSpec}
end
PB.default_values(::Type{SavedFunction}) = (;concrete_functions = Vector{String}(), function_spec = nothing)
PB.field_numbers(::Type{SavedFunction}) = (;concrete_functions = 1, function_spec = 2)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:SavedFunction})
    concrete_functions = PB.BufferedVector{String}()
    function_spec = Ref{Union{Nothing,FunctionSpec}}(nothing)
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, concrete_functions)
        elseif field_number == 2
            PB.decode!(d, function_spec)
        else
            PB.skip(d, wire_type)
        end
    end
    return SavedFunction(concrete_functions[], function_spec[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::SavedFunction)
    initpos = position(e.io)
    !isempty(x.concrete_functions) && PB.encode(e, 1, x.concrete_functions)
    !isnothing(x.function_spec) && PB.encode(e, 2, x.function_spec)
    return position(e.io) - initpos
end
function PB._encoded_size(x::SavedFunction)
    encoded_size = 0
    !isempty(x.concrete_functions) && (encoded_size += PB._encoded_size(x.concrete_functions, 1))
    !isnothing(x.function_spec) && (encoded_size += PB._encoded_size(x.function_spec, 2))
    return encoded_size
end

struct SavedObjectGraph{T1<:Union{Nothing,var"##AbstractSavedObject"}} <: var"##AbstractSavedObjectGraph"
    nodes::Vector{T1}
    concrete_functions::Dict{String,SavedConcreteFunction}
end
PB.default_values(::Type{SavedObjectGraph}) = (;nodes = Vector{SavedObject}(), concrete_functions = Dict{String,SavedConcreteFunction}())
PB.field_numbers(::Type{SavedObjectGraph}) = (;nodes = 1, concrete_functions = 2)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:SavedObjectGraph})
    nodes = PB.BufferedVector{SavedObject}()
    concrete_functions = Dict{String,SavedConcreteFunction}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, nodes)
        elseif field_number == 2
            PB.decode!(d, concrete_functions)
        else
            PB.skip(d, wire_type)
        end
    end
    return SavedObjectGraph(nodes[], concrete_functions)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::SavedObjectGraph)
    initpos = position(e.io)
    !isempty(x.nodes) && PB.encode(e, 1, x.nodes)
    !isempty(x.concrete_functions) && PB.encode(e, 2, x.concrete_functions)
    return position(e.io) - initpos
end
function PB._encoded_size(x::SavedObjectGraph)
    encoded_size = 0
    !isempty(x.nodes) && (encoded_size += PB._encoded_size(x.nodes, 1))
    !isempty(x.concrete_functions) && (encoded_size += PB._encoded_size(x.concrete_functions, 2))
    return encoded_size
end

struct SavedVariable <: var"##AbstractSavedVariable"
    dtype::var"#DataType".T
    shape::Union{Nothing,TensorShapeProto}
    trainable::Bool
    synchronization::VariableSynchronization.T
    aggregation::VariableAggregation.T
    name::String
    device::String
    experimental_distributed_variable_components::Vector{<:SavedVariable}
end
PB.default_values(::Type{SavedVariable}) = (;dtype = var"#DataType".DT_INVALID, shape = nothing, trainable = false, synchronization = VariableSynchronization.VARIABLE_SYNCHRONIZATION_AUTO, aggregation = VariableAggregation.VARIABLE_AGGREGATION_NONE, name = "", device = "", experimental_distributed_variable_components = Vector{SavedVariable}())
PB.field_numbers(::Type{SavedVariable}) = (;dtype = 1, shape = 2, trainable = 3, synchronization = 4, aggregation = 5, name = 6, device = 7, experimental_distributed_variable_components = 8)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:SavedVariable})
    dtype = var"#DataType".DT_INVALID
    shape = Ref{Union{Nothing,TensorShapeProto}}(nothing)
    trainable = false
    synchronization = VariableSynchronization.VARIABLE_SYNCHRONIZATION_AUTO
    aggregation = VariableAggregation.VARIABLE_AGGREGATION_NONE
    name = ""
    device = ""
    experimental_distributed_variable_components = PB.BufferedVector{SavedVariable}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            dtype = PB.decode(d, var"#DataType".T)
        elseif field_number == 2
            PB.decode!(d, shape)
        elseif field_number == 3
            trainable = PB.decode(d, Bool)
        elseif field_number == 4
            synchronization = PB.decode(d, VariableSynchronization.T)
        elseif field_number == 5
            aggregation = PB.decode(d, VariableAggregation.T)
        elseif field_number == 6
            name = PB.decode(d, String)
        elseif field_number == 7
            device = PB.decode(d, String)
        elseif field_number == 8
            PB.decode!(d, experimental_distributed_variable_components)
        else
            PB.skip(d, wire_type)
        end
    end
    return SavedVariable(dtype, shape[], trainable, synchronization, aggregation, name, device, experimental_distributed_variable_components[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::SavedVariable)
    initpos = position(e.io)
    x.dtype != var"#DataType".DT_INVALID && PB.encode(e, 1, x.dtype)
    !isnothing(x.shape) && PB.encode(e, 2, x.shape)
    x.trainable != false && PB.encode(e, 3, x.trainable)
    x.synchronization != VariableSynchronization.VARIABLE_SYNCHRONIZATION_AUTO && PB.encode(e, 4, x.synchronization)
    x.aggregation != VariableAggregation.VARIABLE_AGGREGATION_NONE && PB.encode(e, 5, x.aggregation)
    !isempty(x.name) && PB.encode(e, 6, x.name)
    !isempty(x.device) && PB.encode(e, 7, x.device)
    !isempty(x.experimental_distributed_variable_components) && PB.encode(e, 8, x.experimental_distributed_variable_components)
    return position(e.io) - initpos
end
function PB._encoded_size(x::SavedVariable)
    encoded_size = 0
    x.dtype != var"#DataType".DT_INVALID && (encoded_size += PB._encoded_size(x.dtype, 1))
    !isnothing(x.shape) && (encoded_size += PB._encoded_size(x.shape, 2))
    x.trainable != false && (encoded_size += PB._encoded_size(x.trainable, 3))
    x.synchronization != VariableSynchronization.VARIABLE_SYNCHRONIZATION_AUTO && (encoded_size += PB._encoded_size(x.synchronization, 4))
    x.aggregation != VariableAggregation.VARIABLE_AGGREGATION_NONE && (encoded_size += PB._encoded_size(x.aggregation, 5))
    !isempty(x.name) && (encoded_size += PB._encoded_size(x.name, 6))
    !isempty(x.device) && (encoded_size += PB._encoded_size(x.device, 7))
    !isempty(x.experimental_distributed_variable_components) && (encoded_size += PB._encoded_size(x.experimental_distributed_variable_components, 8))
    return encoded_size
end

struct SavedObject <: var"##AbstractSavedObject"
    children::Vector{var"TrackableObjectGraph.TrackableObject.ObjectReference"}
    dependencies::Vector{var"TrackableObjectGraph.TrackableObject.ObjectReference"}
    slot_variables::Vector{var"TrackableObjectGraph.TrackableObject.SlotVariableReference"}
    kind::Union{Nothing,OneOf{<:Union{SavedUserObject,SavedAsset,SavedFunction,var"##AbstractSavedVariable",SavedBareConcreteFunction,SavedConstant,SavedResource,CapturedTensor}}}
    saveable_objects::Dict{String,SaveableObject}
    registered_name::String
    serialized_user_proto::Union{Nothing,google.protobuf.var"#Any"}
    registered_saver::String
end
PB.reserved_fields(::Type{SavedObject}) = (names = ["attributes"], numbers = Union{Int,UnitRange{Int}}[2])
PB.oneof_field_types(::Type{SavedObject}) = (;
    kind = (;user_object=SavedUserObject, asset=SavedAsset, var"#function"=SavedFunction, variable=SavedVariable, bare_concrete_function=SavedBareConcreteFunction, constant=SavedConstant, resource=SavedResource, captured_tensor=CapturedTensor),
)
PB.default_values(::Type{SavedObject}) = (;children = Vector{var"TrackableObjectGraph.TrackableObject.ObjectReference"}(), dependencies = Vector{var"TrackableObjectGraph.TrackableObject.ObjectReference"}(), slot_variables = Vector{var"TrackableObjectGraph.TrackableObject.SlotVariableReference"}(), user_object = nothing, asset = nothing, var"#function" = nothing, variable = nothing, bare_concrete_function = nothing, constant = nothing, resource = nothing, captured_tensor = nothing, saveable_objects = Dict{String,SaveableObject}(), registered_name = "", serialized_user_proto = nothing, registered_saver = "")
PB.field_numbers(::Type{SavedObject}) = (;children = 1, dependencies = 15, slot_variables = 3, user_object = 4, asset = 5, var"#function" = 6, variable = 7, bare_concrete_function = 8, constant = 9, resource = 10, captured_tensor = 12, saveable_objects = 11, registered_name = 13, serialized_user_proto = 14, registered_saver = 16)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:SavedObject})
    children = PB.BufferedVector{var"TrackableObjectGraph.TrackableObject.ObjectReference"}()
    dependencies = PB.BufferedVector{var"TrackableObjectGraph.TrackableObject.ObjectReference"}()
    slot_variables = PB.BufferedVector{var"TrackableObjectGraph.TrackableObject.SlotVariableReference"}()
    kind = nothing
    saveable_objects = Dict{String,SaveableObject}()
    registered_name = ""
    serialized_user_proto = Ref{Union{Nothing,google.protobuf.var"#Any"}}(nothing)
    registered_saver = ""
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, children)
        elseif field_number == 15
            PB.decode!(d, dependencies)
        elseif field_number == 3
            PB.decode!(d, slot_variables)
        elseif field_number == 4
            kind = OneOf(:user_object, PB.decode(d, Ref{SavedUserObject}))
        elseif field_number == 5
            kind = OneOf(:asset, PB.decode(d, Ref{SavedAsset}))
        elseif field_number == 6
            kind = OneOf(:var"#function", PB.decode(d, Ref{SavedFunction}))
        elseif field_number == 7
            kind = OneOf(:variable, PB.decode(d, Ref{SavedVariable}))
        elseif field_number == 8
            kind = OneOf(:bare_concrete_function, PB.decode(d, Ref{SavedBareConcreteFunction}))
        elseif field_number == 9
            kind = OneOf(:constant, PB.decode(d, Ref{SavedConstant}))
        elseif field_number == 10
            kind = OneOf(:resource, PB.decode(d, Ref{SavedResource}))
        elseif field_number == 12
            kind = OneOf(:captured_tensor, PB.decode(d, Ref{CapturedTensor}))
        elseif field_number == 11
            PB.decode!(d, saveable_objects)
        elseif field_number == 13
            registered_name = PB.decode(d, String)
        elseif field_number == 14
            PB.decode!(d, serialized_user_proto)
        elseif field_number == 16
            registered_saver = PB.decode(d, String)
        else
            PB.skip(d, wire_type)
        end
    end
    return SavedObject(children[], dependencies[], slot_variables[], kind, saveable_objects, registered_name, serialized_user_proto[], registered_saver)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::SavedObject)
    initpos = position(e.io)
    !isempty(x.children) && PB.encode(e, 1, x.children)
    !isempty(x.dependencies) && PB.encode(e, 15, x.dependencies)
    !isempty(x.slot_variables) && PB.encode(e, 3, x.slot_variables)
    if isnothing(x.kind);
    elseif x.kind.name === :user_object
        PB.encode(e, 4, x.kind[]::SavedUserObject)
    elseif x.kind.name === :asset
        PB.encode(e, 5, x.kind[]::SavedAsset)
    elseif x.kind.name === :var"#function"
        PB.encode(e, 6, x.kind[]::SavedFunction)
    elseif x.kind.name === :variable
        PB.encode(e, 7, x.kind[]::SavedVariable)
    elseif x.kind.name === :bare_concrete_function
        PB.encode(e, 8, x.kind[]::SavedBareConcreteFunction)
    elseif x.kind.name === :constant
        PB.encode(e, 9, x.kind[]::SavedConstant)
    elseif x.kind.name === :resource
        PB.encode(e, 10, x.kind[]::SavedResource)
    elseif x.kind.name === :captured_tensor
        PB.encode(e, 12, x.kind[]::CapturedTensor)
    end
    !isempty(x.saveable_objects) && PB.encode(e, 11, x.saveable_objects)
    !isempty(x.registered_name) && PB.encode(e, 13, x.registered_name)
    !isnothing(x.serialized_user_proto) && PB.encode(e, 14, x.serialized_user_proto)
    !isempty(x.registered_saver) && PB.encode(e, 16, x.registered_saver)
    return position(e.io) - initpos
end
function PB._encoded_size(x::SavedObject)
    encoded_size = 0
    !isempty(x.children) && (encoded_size += PB._encoded_size(x.children, 1))
    !isempty(x.dependencies) && (encoded_size += PB._encoded_size(x.dependencies, 15))
    !isempty(x.slot_variables) && (encoded_size += PB._encoded_size(x.slot_variables, 3))
    if isnothing(x.kind);
    elseif x.kind.name === :user_object
        encoded_size += PB._encoded_size(x.kind[]::SavedUserObject, 4)
    elseif x.kind.name === :asset
        encoded_size += PB._encoded_size(x.kind[]::SavedAsset, 5)
    elseif x.kind.name === :var"#function"
        encoded_size += PB._encoded_size(x.kind[]::SavedFunction, 6)
    elseif x.kind.name === :variable
        encoded_size += PB._encoded_size(x.kind[]::SavedVariable, 7)
    elseif x.kind.name === :bare_concrete_function
        encoded_size += PB._encoded_size(x.kind[]::SavedBareConcreteFunction, 8)
    elseif x.kind.name === :constant
        encoded_size += PB._encoded_size(x.kind[]::SavedConstant, 9)
    elseif x.kind.name === :resource
        encoded_size += PB._encoded_size(x.kind[]::SavedResource, 10)
    elseif x.kind.name === :captured_tensor
        encoded_size += PB._encoded_size(x.kind[]::CapturedTensor, 12)
    end
    !isempty(x.saveable_objects) && (encoded_size += PB._encoded_size(x.saveable_objects, 11))
    !isempty(x.registered_name) && (encoded_size += PB._encoded_size(x.registered_name, 13))
    !isnothing(x.serialized_user_proto) && (encoded_size += PB._encoded_size(x.serialized_user_proto, 14))
    !isempty(x.registered_saver) && (encoded_size += PB._encoded_size(x.registered_saver, 16))
    return encoded_size
end

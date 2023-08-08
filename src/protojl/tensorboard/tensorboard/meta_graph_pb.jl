# Autogenerated using ProtoBuf.jl v1.0.11 on 2023-08-08T14:37:02.036
# original path: proto/tensorboard/tensorboard/meta_graph.proto (proto3 syntax)

import ProtoBuf as PB
using ProtoBuf: OneOf
using ProtoBuf.EnumX: @enumx

export var"CollectionDef.BytesList", var"CollectionDef.Int64List"
export var"TensorInfo.CooSparse", var"CollectionDef.NodeList", var"CollectionDef.AnyList"
export var"CollectionDef.FloatList", var"MetaGraphDef.MetaInfoDef", CollectionDef
export MetaGraphDef, SignatureDef, TensorInfo, AssetFileDef
export var"TensorInfo.CompositeTensor"

# Abstract types to help resolve mutually recursive definitions
abstract type var"##AbstractMetaGraphDef" end
abstract type var"##AbstractSignatureDef" end
abstract type var"##AbstractTensorInfo" end
abstract type var"##AbstractAssetFileDef" end
abstract type var"##AbstractTensorInfo.CompositeTensor" end


struct var"CollectionDef.BytesList"
    value::Vector{Vector{UInt8}}
end
PB.default_values(::Type{var"CollectionDef.BytesList"}) = (;value = Vector{Vector{UInt8}}())
PB.field_numbers(::Type{var"CollectionDef.BytesList"}) = (;value = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:var"CollectionDef.BytesList"})
    value = PB.BufferedVector{Vector{UInt8}}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, value)
        else
            PB.skip(d, wire_type)
        end
    end
    return var"CollectionDef.BytesList"(value[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::var"CollectionDef.BytesList")
    initpos = position(e.io)
    !isempty(x.value) && PB.encode(e, 1, x.value)
    return position(e.io) - initpos
end
function PB._encoded_size(x::var"CollectionDef.BytesList")
    encoded_size = 0
    !isempty(x.value) && (encoded_size += PB._encoded_size(x.value, 1))
    return encoded_size
end

struct var"CollectionDef.Int64List"
    value::Vector{Int64}
end
PB.default_values(::Type{var"CollectionDef.Int64List"}) = (;value = Vector{Int64}())
PB.field_numbers(::Type{var"CollectionDef.Int64List"}) = (;value = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:var"CollectionDef.Int64List"})
    value = PB.BufferedVector{Int64}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, wire_type, value)
        else
            PB.skip(d, wire_type)
        end
    end
    return var"CollectionDef.Int64List"(value[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::var"CollectionDef.Int64List")
    initpos = position(e.io)
    !isempty(x.value) && PB.encode(e, 1, x.value)
    return position(e.io) - initpos
end
function PB._encoded_size(x::var"CollectionDef.Int64List")
    encoded_size = 0
    !isempty(x.value) && (encoded_size += PB._encoded_size(x.value, 1))
    return encoded_size
end

struct var"TensorInfo.CooSparse"
    values_tensor_name::String
    indices_tensor_name::String
    dense_shape_tensor_name::String
end
PB.default_values(::Type{var"TensorInfo.CooSparse"}) = (;values_tensor_name = "", indices_tensor_name = "", dense_shape_tensor_name = "")
PB.field_numbers(::Type{var"TensorInfo.CooSparse"}) = (;values_tensor_name = 1, indices_tensor_name = 2, dense_shape_tensor_name = 3)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:var"TensorInfo.CooSparse"})
    values_tensor_name = ""
    indices_tensor_name = ""
    dense_shape_tensor_name = ""
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            values_tensor_name = PB.decode(d, String)
        elseif field_number == 2
            indices_tensor_name = PB.decode(d, String)
        elseif field_number == 3
            dense_shape_tensor_name = PB.decode(d, String)
        else
            PB.skip(d, wire_type)
        end
    end
    return var"TensorInfo.CooSparse"(values_tensor_name, indices_tensor_name, dense_shape_tensor_name)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::var"TensorInfo.CooSparse")
    initpos = position(e.io)
    !isempty(x.values_tensor_name) && PB.encode(e, 1, x.values_tensor_name)
    !isempty(x.indices_tensor_name) && PB.encode(e, 2, x.indices_tensor_name)
    !isempty(x.dense_shape_tensor_name) && PB.encode(e, 3, x.dense_shape_tensor_name)
    return position(e.io) - initpos
end
function PB._encoded_size(x::var"TensorInfo.CooSparse")
    encoded_size = 0
    !isempty(x.values_tensor_name) && (encoded_size += PB._encoded_size(x.values_tensor_name, 1))
    !isempty(x.indices_tensor_name) && (encoded_size += PB._encoded_size(x.indices_tensor_name, 2))
    !isempty(x.dense_shape_tensor_name) && (encoded_size += PB._encoded_size(x.dense_shape_tensor_name, 3))
    return encoded_size
end

struct var"CollectionDef.NodeList"
    value::Vector{String}
end
PB.default_values(::Type{var"CollectionDef.NodeList"}) = (;value = Vector{String}())
PB.field_numbers(::Type{var"CollectionDef.NodeList"}) = (;value = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:var"CollectionDef.NodeList"})
    value = PB.BufferedVector{String}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, value)
        else
            PB.skip(d, wire_type)
        end
    end
    return var"CollectionDef.NodeList"(value[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::var"CollectionDef.NodeList")
    initpos = position(e.io)
    !isempty(x.value) && PB.encode(e, 1, x.value)
    return position(e.io) - initpos
end
function PB._encoded_size(x::var"CollectionDef.NodeList")
    encoded_size = 0
    !isempty(x.value) && (encoded_size += PB._encoded_size(x.value, 1))
    return encoded_size
end

struct var"CollectionDef.AnyList"
    value::Vector{google.protobuf.var"#Any"}
end
PB.default_values(::Type{var"CollectionDef.AnyList"}) = (;value = Vector{google.protobuf.var"#Any"}())
PB.field_numbers(::Type{var"CollectionDef.AnyList"}) = (;value = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:var"CollectionDef.AnyList"})
    value = PB.BufferedVector{google.protobuf.var"#Any"}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, value)
        else
            PB.skip(d, wire_type)
        end
    end
    return var"CollectionDef.AnyList"(value[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::var"CollectionDef.AnyList")
    initpos = position(e.io)
    !isempty(x.value) && PB.encode(e, 1, x.value)
    return position(e.io) - initpos
end
function PB._encoded_size(x::var"CollectionDef.AnyList")
    encoded_size = 0
    !isempty(x.value) && (encoded_size += PB._encoded_size(x.value, 1))
    return encoded_size
end

struct var"CollectionDef.FloatList"
    value::Vector{Float32}
end
PB.default_values(::Type{var"CollectionDef.FloatList"}) = (;value = Vector{Float32}())
PB.field_numbers(::Type{var"CollectionDef.FloatList"}) = (;value = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:var"CollectionDef.FloatList"})
    value = PB.BufferedVector{Float32}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, wire_type, value)
        else
            PB.skip(d, wire_type)
        end
    end
    return var"CollectionDef.FloatList"(value[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::var"CollectionDef.FloatList")
    initpos = position(e.io)
    !isempty(x.value) && PB.encode(e, 1, x.value)
    return position(e.io) - initpos
end
function PB._encoded_size(x::var"CollectionDef.FloatList")
    encoded_size = 0
    !isempty(x.value) && (encoded_size += PB._encoded_size(x.value, 1))
    return encoded_size
end

struct var"MetaGraphDef.MetaInfoDef"
    meta_graph_version::String
    stripped_op_list::Union{Nothing,OpList}
    any_info::Union{Nothing,google.protobuf.var"#Any"}
    tags::Vector{String}
    tensorflow_version::String
    tensorflow_git_version::String
    stripped_default_attrs::Bool
    function_aliases::Dict{String,String}
end
PB.default_values(::Type{var"MetaGraphDef.MetaInfoDef"}) = (;meta_graph_version = "", stripped_op_list = nothing, any_info = nothing, tags = Vector{String}(), tensorflow_version = "", tensorflow_git_version = "", stripped_default_attrs = false, function_aliases = Dict{String,String}())
PB.field_numbers(::Type{var"MetaGraphDef.MetaInfoDef"}) = (;meta_graph_version = 1, stripped_op_list = 2, any_info = 3, tags = 4, tensorflow_version = 5, tensorflow_git_version = 6, stripped_default_attrs = 7, function_aliases = 8)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:var"MetaGraphDef.MetaInfoDef"})
    meta_graph_version = ""
    stripped_op_list = Ref{Union{Nothing,OpList}}(nothing)
    any_info = Ref{Union{Nothing,google.protobuf.var"#Any"}}(nothing)
    tags = PB.BufferedVector{String}()
    tensorflow_version = ""
    tensorflow_git_version = ""
    stripped_default_attrs = false
    function_aliases = Dict{String,String}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            meta_graph_version = PB.decode(d, String)
        elseif field_number == 2
            PB.decode!(d, stripped_op_list)
        elseif field_number == 3
            PB.decode!(d, any_info)
        elseif field_number == 4
            PB.decode!(d, tags)
        elseif field_number == 5
            tensorflow_version = PB.decode(d, String)
        elseif field_number == 6
            tensorflow_git_version = PB.decode(d, String)
        elseif field_number == 7
            stripped_default_attrs = PB.decode(d, Bool)
        elseif field_number == 8
            PB.decode!(d, function_aliases)
        else
            PB.skip(d, wire_type)
        end
    end
    return var"MetaGraphDef.MetaInfoDef"(meta_graph_version, stripped_op_list[], any_info[], tags[], tensorflow_version, tensorflow_git_version, stripped_default_attrs, function_aliases)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::var"MetaGraphDef.MetaInfoDef")
    initpos = position(e.io)
    !isempty(x.meta_graph_version) && PB.encode(e, 1, x.meta_graph_version)
    !isnothing(x.stripped_op_list) && PB.encode(e, 2, x.stripped_op_list)
    !isnothing(x.any_info) && PB.encode(e, 3, x.any_info)
    !isempty(x.tags) && PB.encode(e, 4, x.tags)
    !isempty(x.tensorflow_version) && PB.encode(e, 5, x.tensorflow_version)
    !isempty(x.tensorflow_git_version) && PB.encode(e, 6, x.tensorflow_git_version)
    x.stripped_default_attrs != false && PB.encode(e, 7, x.stripped_default_attrs)
    !isempty(x.function_aliases) && PB.encode(e, 8, x.function_aliases)
    return position(e.io) - initpos
end
function PB._encoded_size(x::var"MetaGraphDef.MetaInfoDef")
    encoded_size = 0
    !isempty(x.meta_graph_version) && (encoded_size += PB._encoded_size(x.meta_graph_version, 1))
    !isnothing(x.stripped_op_list) && (encoded_size += PB._encoded_size(x.stripped_op_list, 2))
    !isnothing(x.any_info) && (encoded_size += PB._encoded_size(x.any_info, 3))
    !isempty(x.tags) && (encoded_size += PB._encoded_size(x.tags, 4))
    !isempty(x.tensorflow_version) && (encoded_size += PB._encoded_size(x.tensorflow_version, 5))
    !isempty(x.tensorflow_git_version) && (encoded_size += PB._encoded_size(x.tensorflow_git_version, 6))
    x.stripped_default_attrs != false && (encoded_size += PB._encoded_size(x.stripped_default_attrs, 7))
    !isempty(x.function_aliases) && (encoded_size += PB._encoded_size(x.function_aliases, 8))
    return encoded_size
end

struct CollectionDef
    kind::Union{Nothing,OneOf{<:Union{var"CollectionDef.NodeList",var"CollectionDef.BytesList",var"CollectionDef.Int64List",var"CollectionDef.FloatList",var"CollectionDef.AnyList"}}}
end
PB.oneof_field_types(::Type{CollectionDef}) = (;
    kind = (;node_list=var"CollectionDef.NodeList", bytes_list=var"CollectionDef.BytesList", int64_list=var"CollectionDef.Int64List", float_list=var"CollectionDef.FloatList", any_list=var"CollectionDef.AnyList"),
)
PB.default_values(::Type{CollectionDef}) = (;node_list = nothing, bytes_list = nothing, int64_list = nothing, float_list = nothing, any_list = nothing)
PB.field_numbers(::Type{CollectionDef}) = (;node_list = 1, bytes_list = 2, int64_list = 3, float_list = 4, any_list = 5)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:CollectionDef})
    kind = nothing
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            kind = OneOf(:node_list, PB.decode(d, Ref{var"CollectionDef.NodeList"}))
        elseif field_number == 2
            kind = OneOf(:bytes_list, PB.decode(d, Ref{var"CollectionDef.BytesList"}))
        elseif field_number == 3
            kind = OneOf(:int64_list, PB.decode(d, Ref{var"CollectionDef.Int64List"}))
        elseif field_number == 4
            kind = OneOf(:float_list, PB.decode(d, Ref{var"CollectionDef.FloatList"}))
        elseif field_number == 5
            kind = OneOf(:any_list, PB.decode(d, Ref{var"CollectionDef.AnyList"}))
        else
            PB.skip(d, wire_type)
        end
    end
    return CollectionDef(kind)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::CollectionDef)
    initpos = position(e.io)
    if isnothing(x.kind);
    elseif x.kind.name === :node_list
        PB.encode(e, 1, x.kind[]::var"CollectionDef.NodeList")
    elseif x.kind.name === :bytes_list
        PB.encode(e, 2, x.kind[]::var"CollectionDef.BytesList")
    elseif x.kind.name === :int64_list
        PB.encode(e, 3, x.kind[]::var"CollectionDef.Int64List")
    elseif x.kind.name === :float_list
        PB.encode(e, 4, x.kind[]::var"CollectionDef.FloatList")
    elseif x.kind.name === :any_list
        PB.encode(e, 5, x.kind[]::var"CollectionDef.AnyList")
    end
    return position(e.io) - initpos
end
function PB._encoded_size(x::CollectionDef)
    encoded_size = 0
    if isnothing(x.kind);
    elseif x.kind.name === :node_list
        encoded_size += PB._encoded_size(x.kind[]::var"CollectionDef.NodeList", 1)
    elseif x.kind.name === :bytes_list
        encoded_size += PB._encoded_size(x.kind[]::var"CollectionDef.BytesList", 2)
    elseif x.kind.name === :int64_list
        encoded_size += PB._encoded_size(x.kind[]::var"CollectionDef.Int64List", 3)
    elseif x.kind.name === :float_list
        encoded_size += PB._encoded_size(x.kind[]::var"CollectionDef.FloatList", 4)
    elseif x.kind.name === :any_list
        encoded_size += PB._encoded_size(x.kind[]::var"CollectionDef.AnyList", 5)
    end
    return encoded_size
end

struct MetaGraphDef{T2<:Union{Nothing,var"##AbstractAssetFileDef"},T1<:Union{Nothing,var"##AbstractSignatureDef"}} <: var"##AbstractMetaGraphDef"
    meta_info_def::Union{Nothing,var"MetaGraphDef.MetaInfoDef"}
    graph_def::Union{Nothing,GraphDef}
    saver_def::Union{Nothing,SaverDef}
    collection_def::Dict{String,CollectionDef}
    signature_def::Dict{String,T1}
    asset_file_def::Vector{T2}
    object_graph_def::Union{Nothing,SavedObjectGraph}
end
PB.default_values(::Type{MetaGraphDef}) = (;meta_info_def = nothing, graph_def = nothing, saver_def = nothing, collection_def = Dict{String,CollectionDef}(), signature_def = Dict{String,SignatureDef}(), asset_file_def = Vector{AssetFileDef}(), object_graph_def = nothing)
PB.field_numbers(::Type{MetaGraphDef}) = (;meta_info_def = 1, graph_def = 2, saver_def = 3, collection_def = 4, signature_def = 5, asset_file_def = 6, object_graph_def = 7)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:MetaGraphDef})
    meta_info_def = Ref{Union{Nothing,var"MetaGraphDef.MetaInfoDef"}}(nothing)
    graph_def = Ref{Union{Nothing,GraphDef}}(nothing)
    saver_def = Ref{Union{Nothing,SaverDef}}(nothing)
    collection_def = Dict{String,CollectionDef}()
    signature_def = Dict{String,SignatureDef}()
    asset_file_def = PB.BufferedVector{AssetFileDef}()
    object_graph_def = Ref{Union{Nothing,SavedObjectGraph}}(nothing)
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, meta_info_def)
        elseif field_number == 2
            PB.decode!(d, graph_def)
        elseif field_number == 3
            PB.decode!(d, saver_def)
        elseif field_number == 4
            PB.decode!(d, collection_def)
        elseif field_number == 5
            PB.decode!(d, signature_def)
        elseif field_number == 6
            PB.decode!(d, asset_file_def)
        elseif field_number == 7
            PB.decode!(d, object_graph_def)
        else
            PB.skip(d, wire_type)
        end
    end
    return MetaGraphDef(meta_info_def[], graph_def[], saver_def[], collection_def, signature_def, asset_file_def[], object_graph_def[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::MetaGraphDef)
    initpos = position(e.io)
    !isnothing(x.meta_info_def) && PB.encode(e, 1, x.meta_info_def)
    !isnothing(x.graph_def) && PB.encode(e, 2, x.graph_def)
    !isnothing(x.saver_def) && PB.encode(e, 3, x.saver_def)
    !isempty(x.collection_def) && PB.encode(e, 4, x.collection_def)
    !isempty(x.signature_def) && PB.encode(e, 5, x.signature_def)
    !isempty(x.asset_file_def) && PB.encode(e, 6, x.asset_file_def)
    !isnothing(x.object_graph_def) && PB.encode(e, 7, x.object_graph_def)
    return position(e.io) - initpos
end
function PB._encoded_size(x::MetaGraphDef)
    encoded_size = 0
    !isnothing(x.meta_info_def) && (encoded_size += PB._encoded_size(x.meta_info_def, 1))
    !isnothing(x.graph_def) && (encoded_size += PB._encoded_size(x.graph_def, 2))
    !isnothing(x.saver_def) && (encoded_size += PB._encoded_size(x.saver_def, 3))
    !isempty(x.collection_def) && (encoded_size += PB._encoded_size(x.collection_def, 4))
    !isempty(x.signature_def) && (encoded_size += PB._encoded_size(x.signature_def, 5))
    !isempty(x.asset_file_def) && (encoded_size += PB._encoded_size(x.asset_file_def, 6))
    !isnothing(x.object_graph_def) && (encoded_size += PB._encoded_size(x.object_graph_def, 7))
    return encoded_size
end

struct SignatureDef{T2<:Union{Nothing,var"##AbstractTensorInfo"},T1<:Union{Nothing,var"##AbstractTensorInfo"}} <: var"##AbstractSignatureDef"
    inputs::Dict{String,T1}
    outputs::Dict{String,T2}
    method_name::String
end
PB.default_values(::Type{SignatureDef}) = (;inputs = Dict{String,TensorInfo}(), outputs = Dict{String,TensorInfo}(), method_name = "")
PB.field_numbers(::Type{SignatureDef}) = (;inputs = 1, outputs = 2, method_name = 3)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:SignatureDef})
    inputs = Dict{String,TensorInfo}()
    outputs = Dict{String,TensorInfo}()
    method_name = ""
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, inputs)
        elseif field_number == 2
            PB.decode!(d, outputs)
        elseif field_number == 3
            method_name = PB.decode(d, String)
        else
            PB.skip(d, wire_type)
        end
    end
    return SignatureDef(inputs, outputs, method_name)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::SignatureDef)
    initpos = position(e.io)
    !isempty(x.inputs) && PB.encode(e, 1, x.inputs)
    !isempty(x.outputs) && PB.encode(e, 2, x.outputs)
    !isempty(x.method_name) && PB.encode(e, 3, x.method_name)
    return position(e.io) - initpos
end
function PB._encoded_size(x::SignatureDef)
    encoded_size = 0
    !isempty(x.inputs) && (encoded_size += PB._encoded_size(x.inputs, 1))
    !isempty(x.outputs) && (encoded_size += PB._encoded_size(x.outputs, 2))
    !isempty(x.method_name) && (encoded_size += PB._encoded_size(x.method_name, 3))
    return encoded_size
end

struct TensorInfo <: var"##AbstractTensorInfo"
    encoding::Union{Nothing,OneOf{<:Union{String,var"TensorInfo.CooSparse",var"##AbstractTensorInfo.CompositeTensor"}}}
    dtype::var"#DataType".T
    tensor_shape::Union{Nothing,TensorShapeProto}
end
PB.oneof_field_types(::Type{TensorInfo}) = (;
    encoding = (;name=String, coo_sparse=var"TensorInfo.CooSparse", composite_tensor=var"TensorInfo.CompositeTensor"),
)
PB.default_values(::Type{TensorInfo}) = (;name = "", coo_sparse = nothing, composite_tensor = nothing, dtype = var"#DataType".DT_INVALID, tensor_shape = nothing)
PB.field_numbers(::Type{TensorInfo}) = (;name = 1, coo_sparse = 4, composite_tensor = 5, dtype = 2, tensor_shape = 3)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:TensorInfo})
    encoding = nothing
    dtype = var"#DataType".DT_INVALID
    tensor_shape = Ref{Union{Nothing,TensorShapeProto}}(nothing)
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            encoding = OneOf(:name, PB.decode(d, String))
        elseif field_number == 4
            encoding = OneOf(:coo_sparse, PB.decode(d, Ref{var"TensorInfo.CooSparse"}))
        elseif field_number == 5
            encoding = OneOf(:composite_tensor, PB.decode(d, Ref{var"TensorInfo.CompositeTensor"}))
        elseif field_number == 2
            dtype = PB.decode(d, var"#DataType".T)
        elseif field_number == 3
            PB.decode!(d, tensor_shape)
        else
            PB.skip(d, wire_type)
        end
    end
    return TensorInfo(encoding, dtype, tensor_shape[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::TensorInfo)
    initpos = position(e.io)
    if isnothing(x.encoding);
    elseif x.encoding.name === :name
        PB.encode(e, 1, x.encoding[]::String)
    elseif x.encoding.name === :coo_sparse
        PB.encode(e, 4, x.encoding[]::var"TensorInfo.CooSparse")
    elseif x.encoding.name === :composite_tensor
        PB.encode(e, 5, x.encoding[]::var"TensorInfo.CompositeTensor")
    end
    x.dtype != var"#DataType".DT_INVALID && PB.encode(e, 2, x.dtype)
    !isnothing(x.tensor_shape) && PB.encode(e, 3, x.tensor_shape)
    return position(e.io) - initpos
end
function PB._encoded_size(x::TensorInfo)
    encoded_size = 0
    if isnothing(x.encoding);
    elseif x.encoding.name === :name
        encoded_size += PB._encoded_size(x.encoding[]::String, 1)
    elseif x.encoding.name === :coo_sparse
        encoded_size += PB._encoded_size(x.encoding[]::var"TensorInfo.CooSparse", 4)
    elseif x.encoding.name === :composite_tensor
        encoded_size += PB._encoded_size(x.encoding[]::var"TensorInfo.CompositeTensor", 5)
    end
    x.dtype != var"#DataType".DT_INVALID && (encoded_size += PB._encoded_size(x.dtype, 2))
    !isnothing(x.tensor_shape) && (encoded_size += PB._encoded_size(x.tensor_shape, 3))
    return encoded_size
end

struct AssetFileDef <: var"##AbstractAssetFileDef"
    tensor_info::Union{Nothing,TensorInfo}
    filename::String
end
PB.default_values(::Type{AssetFileDef}) = (;tensor_info = nothing, filename = "")
PB.field_numbers(::Type{AssetFileDef}) = (;tensor_info = 1, filename = 2)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:AssetFileDef})
    tensor_info = Ref{Union{Nothing,TensorInfo}}(nothing)
    filename = ""
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, tensor_info)
        elseif field_number == 2
            filename = PB.decode(d, String)
        else
            PB.skip(d, wire_type)
        end
    end
    return AssetFileDef(tensor_info[], filename)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::AssetFileDef)
    initpos = position(e.io)
    !isnothing(x.tensor_info) && PB.encode(e, 1, x.tensor_info)
    !isempty(x.filename) && PB.encode(e, 2, x.filename)
    return position(e.io) - initpos
end
function PB._encoded_size(x::AssetFileDef)
    encoded_size = 0
    !isnothing(x.tensor_info) && (encoded_size += PB._encoded_size(x.tensor_info, 1))
    !isempty(x.filename) && (encoded_size += PB._encoded_size(x.filename, 2))
    return encoded_size
end

struct var"TensorInfo.CompositeTensor" <: var"##AbstractTensorInfo.CompositeTensor"
    type_spec::Union{Nothing,TypeSpecProto}
    components::Vector{<:TensorInfo}
end
PB.default_values(::Type{var"TensorInfo.CompositeTensor"}) = (;type_spec = nothing, components = Vector{TensorInfo}())
PB.field_numbers(::Type{var"TensorInfo.CompositeTensor"}) = (;type_spec = 1, components = 2)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:var"TensorInfo.CompositeTensor"})
    type_spec = Ref{Union{Nothing,TypeSpecProto}}(nothing)
    components = PB.BufferedVector{TensorInfo}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, type_spec)
        elseif field_number == 2
            PB.decode!(d, components)
        else
            PB.skip(d, wire_type)
        end
    end
    return var"TensorInfo.CompositeTensor"(type_spec[], components[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::var"TensorInfo.CompositeTensor")
    initpos = position(e.io)
    !isnothing(x.type_spec) && PB.encode(e, 1, x.type_spec)
    !isempty(x.components) && PB.encode(e, 2, x.components)
    return position(e.io) - initpos
end
function PB._encoded_size(x::var"TensorInfo.CompositeTensor")
    encoded_size = 0
    !isnothing(x.type_spec) && (encoded_size += PB._encoded_size(x.type_spec, 1))
    !isempty(x.components) && (encoded_size += PB._encoded_size(x.components, 2))
    return encoded_size
end
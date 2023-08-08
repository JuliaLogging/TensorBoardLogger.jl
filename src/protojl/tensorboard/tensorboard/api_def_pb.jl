# Autogenerated using ProtoBuf.jl v1.0.11 on 2023-08-08T14:34:18.324
# original path: protojl/tensorboard/tensorboard/api_def.proto (proto3 syntax)

import ProtoBuf as PB
using ProtoBuf: OneOf
using ProtoBuf.EnumX: @enumx

export var"ApiDef.Attr", var"ApiDef.Endpoint", var"ApiDef.Arg", var"ApiDef.Visibility"
export ApiDef, ApiDefs

struct var"ApiDef.Attr"
    name::String
    rename_to::String
    default_value::Union{Nothing,AttrValue}
    description::String
end
PB.default_values(::Type{var"ApiDef.Attr"}) = (;name = "", rename_to = "", default_value = nothing, description = "")
PB.field_numbers(::Type{var"ApiDef.Attr"}) = (;name = 1, rename_to = 2, default_value = 3, description = 4)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:var"ApiDef.Attr"})
    name = ""
    rename_to = ""
    default_value = Ref{Union{Nothing,AttrValue}}(nothing)
    description = ""
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            name = PB.decode(d, String)
        elseif field_number == 2
            rename_to = PB.decode(d, String)
        elseif field_number == 3
            PB.decode!(d, default_value)
        elseif field_number == 4
            description = PB.decode(d, String)
        else
            PB.skip(d, wire_type)
        end
    end
    return var"ApiDef.Attr"(name, rename_to, default_value[], description)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::var"ApiDef.Attr")
    initpos = position(e.io)
    !isempty(x.name) && PB.encode(e, 1, x.name)
    !isempty(x.rename_to) && PB.encode(e, 2, x.rename_to)
    !isnothing(x.default_value) && PB.encode(e, 3, x.default_value)
    !isempty(x.description) && PB.encode(e, 4, x.description)
    return position(e.io) - initpos
end
function PB._encoded_size(x::var"ApiDef.Attr")
    encoded_size = 0
    !isempty(x.name) && (encoded_size += PB._encoded_size(x.name, 1))
    !isempty(x.rename_to) && (encoded_size += PB._encoded_size(x.rename_to, 2))
    !isnothing(x.default_value) && (encoded_size += PB._encoded_size(x.default_value, 3))
    !isempty(x.description) && (encoded_size += PB._encoded_size(x.description, 4))
    return encoded_size
end

struct var"ApiDef.Endpoint"
    name::String
    deprecated::Bool
    deprecation_version::Int32
end
PB.default_values(::Type{var"ApiDef.Endpoint"}) = (;name = "", deprecated = false, deprecation_version = zero(Int32))
PB.field_numbers(::Type{var"ApiDef.Endpoint"}) = (;name = 1, deprecated = 3, deprecation_version = 4)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:var"ApiDef.Endpoint"})
    name = ""
    deprecated = false
    deprecation_version = zero(Int32)
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            name = PB.decode(d, String)
        elseif field_number == 3
            deprecated = PB.decode(d, Bool)
        elseif field_number == 4
            deprecation_version = PB.decode(d, Int32)
        else
            PB.skip(d, wire_type)
        end
    end
    return var"ApiDef.Endpoint"(name, deprecated, deprecation_version)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::var"ApiDef.Endpoint")
    initpos = position(e.io)
    !isempty(x.name) && PB.encode(e, 1, x.name)
    x.deprecated != false && PB.encode(e, 3, x.deprecated)
    x.deprecation_version != zero(Int32) && PB.encode(e, 4, x.deprecation_version)
    return position(e.io) - initpos
end
function PB._encoded_size(x::var"ApiDef.Endpoint")
    encoded_size = 0
    !isempty(x.name) && (encoded_size += PB._encoded_size(x.name, 1))
    x.deprecated != false && (encoded_size += PB._encoded_size(x.deprecated, 3))
    x.deprecation_version != zero(Int32) && (encoded_size += PB._encoded_size(x.deprecation_version, 4))
    return encoded_size
end

struct var"ApiDef.Arg"
    name::String
    rename_to::String
    description::String
end
PB.default_values(::Type{var"ApiDef.Arg"}) = (;name = "", rename_to = "", description = "")
PB.field_numbers(::Type{var"ApiDef.Arg"}) = (;name = 1, rename_to = 2, description = 3)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:var"ApiDef.Arg"})
    name = ""
    rename_to = ""
    description = ""
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            name = PB.decode(d, String)
        elseif field_number == 2
            rename_to = PB.decode(d, String)
        elseif field_number == 3
            description = PB.decode(d, String)
        else
            PB.skip(d, wire_type)
        end
    end
    return var"ApiDef.Arg"(name, rename_to, description)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::var"ApiDef.Arg")
    initpos = position(e.io)
    !isempty(x.name) && PB.encode(e, 1, x.name)
    !isempty(x.rename_to) && PB.encode(e, 2, x.rename_to)
    !isempty(x.description) && PB.encode(e, 3, x.description)
    return position(e.io) - initpos
end
function PB._encoded_size(x::var"ApiDef.Arg")
    encoded_size = 0
    !isempty(x.name) && (encoded_size += PB._encoded_size(x.name, 1))
    !isempty(x.rename_to) && (encoded_size += PB._encoded_size(x.rename_to, 2))
    !isempty(x.description) && (encoded_size += PB._encoded_size(x.description, 3))
    return encoded_size
end

@enumx var"ApiDef.Visibility" DEFAULT_VISIBILITY=0 VISIBLE=1 SKIP=2 HIDDEN=3

struct ApiDef
    graph_op_name::String
    deprecation_message::String
    deprecation_version::Int32
    visibility::var"ApiDef.Visibility".T
    endpoint::Vector{var"ApiDef.Endpoint"}
    in_arg::Vector{var"ApiDef.Arg"}
    out_arg::Vector{var"ApiDef.Arg"}
    arg_order::Vector{String}
    attr::Vector{var"ApiDef.Attr"}
    summary::String
    description::String
    description_prefix::String
    description_suffix::String
end
PB.default_values(::Type{ApiDef}) = (;graph_op_name = "", deprecation_message = "", deprecation_version = zero(Int32), visibility = var"ApiDef.Visibility".DEFAULT_VISIBILITY, endpoint = Vector{var"ApiDef.Endpoint"}(), in_arg = Vector{var"ApiDef.Arg"}(), out_arg = Vector{var"ApiDef.Arg"}(), arg_order = Vector{String}(), attr = Vector{var"ApiDef.Attr"}(), summary = "", description = "", description_prefix = "", description_suffix = "")
PB.field_numbers(::Type{ApiDef}) = (;graph_op_name = 1, deprecation_message = 12, deprecation_version = 13, visibility = 2, endpoint = 3, in_arg = 4, out_arg = 5, arg_order = 11, attr = 6, summary = 7, description = 8, description_prefix = 9, description_suffix = 10)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:ApiDef})
    graph_op_name = ""
    deprecation_message = ""
    deprecation_version = zero(Int32)
    visibility = var"ApiDef.Visibility".DEFAULT_VISIBILITY
    endpoint = PB.BufferedVector{var"ApiDef.Endpoint"}()
    in_arg = PB.BufferedVector{var"ApiDef.Arg"}()
    out_arg = PB.BufferedVector{var"ApiDef.Arg"}()
    arg_order = PB.BufferedVector{String}()
    attr = PB.BufferedVector{var"ApiDef.Attr"}()
    summary = ""
    description = ""
    description_prefix = ""
    description_suffix = ""
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            graph_op_name = PB.decode(d, String)
        elseif field_number == 12
            deprecation_message = PB.decode(d, String)
        elseif field_number == 13
            deprecation_version = PB.decode(d, Int32)
        elseif field_number == 2
            visibility = PB.decode(d, var"ApiDef.Visibility".T)
        elseif field_number == 3
            PB.decode!(d, endpoint)
        elseif field_number == 4
            PB.decode!(d, in_arg)
        elseif field_number == 5
            PB.decode!(d, out_arg)
        elseif field_number == 11
            PB.decode!(d, arg_order)
        elseif field_number == 6
            PB.decode!(d, attr)
        elseif field_number == 7
            summary = PB.decode(d, String)
        elseif field_number == 8
            description = PB.decode(d, String)
        elseif field_number == 9
            description_prefix = PB.decode(d, String)
        elseif field_number == 10
            description_suffix = PB.decode(d, String)
        else
            PB.skip(d, wire_type)
        end
    end
    return ApiDef(graph_op_name, deprecation_message, deprecation_version, visibility, endpoint[], in_arg[], out_arg[], arg_order[], attr[], summary, description, description_prefix, description_suffix)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::ApiDef)
    initpos = position(e.io)
    !isempty(x.graph_op_name) && PB.encode(e, 1, x.graph_op_name)
    !isempty(x.deprecation_message) && PB.encode(e, 12, x.deprecation_message)
    x.deprecation_version != zero(Int32) && PB.encode(e, 13, x.deprecation_version)
    x.visibility != var"ApiDef.Visibility".DEFAULT_VISIBILITY && PB.encode(e, 2, x.visibility)
    !isempty(x.endpoint) && PB.encode(e, 3, x.endpoint)
    !isempty(x.in_arg) && PB.encode(e, 4, x.in_arg)
    !isempty(x.out_arg) && PB.encode(e, 5, x.out_arg)
    !isempty(x.arg_order) && PB.encode(e, 11, x.arg_order)
    !isempty(x.attr) && PB.encode(e, 6, x.attr)
    !isempty(x.summary) && PB.encode(e, 7, x.summary)
    !isempty(x.description) && PB.encode(e, 8, x.description)
    !isempty(x.description_prefix) && PB.encode(e, 9, x.description_prefix)
    !isempty(x.description_suffix) && PB.encode(e, 10, x.description_suffix)
    return position(e.io) - initpos
end
function PB._encoded_size(x::ApiDef)
    encoded_size = 0
    !isempty(x.graph_op_name) && (encoded_size += PB._encoded_size(x.graph_op_name, 1))
    !isempty(x.deprecation_message) && (encoded_size += PB._encoded_size(x.deprecation_message, 12))
    x.deprecation_version != zero(Int32) && (encoded_size += PB._encoded_size(x.deprecation_version, 13))
    x.visibility != var"ApiDef.Visibility".DEFAULT_VISIBILITY && (encoded_size += PB._encoded_size(x.visibility, 2))
    !isempty(x.endpoint) && (encoded_size += PB._encoded_size(x.endpoint, 3))
    !isempty(x.in_arg) && (encoded_size += PB._encoded_size(x.in_arg, 4))
    !isempty(x.out_arg) && (encoded_size += PB._encoded_size(x.out_arg, 5))
    !isempty(x.arg_order) && (encoded_size += PB._encoded_size(x.arg_order, 11))
    !isempty(x.attr) && (encoded_size += PB._encoded_size(x.attr, 6))
    !isempty(x.summary) && (encoded_size += PB._encoded_size(x.summary, 7))
    !isempty(x.description) && (encoded_size += PB._encoded_size(x.description, 8))
    !isempty(x.description_prefix) && (encoded_size += PB._encoded_size(x.description_prefix, 9))
    !isempty(x.description_suffix) && (encoded_size += PB._encoded_size(x.description_suffix, 10))
    return encoded_size
end

struct ApiDefs
    op::Vector{ApiDef}
end
PB.default_values(::Type{ApiDefs}) = (;op = Vector{ApiDef}())
PB.field_numbers(::Type{ApiDefs}) = (;op = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:ApiDefs})
    op = PB.BufferedVector{ApiDef}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, op)
        else
            PB.skip(d, wire_type)
        end
    end
    return ApiDefs(op[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::ApiDefs)
    initpos = position(e.io)
    !isempty(x.op) && PB.encode(e, 1, x.op)
    return position(e.io) - initpos
end
function PB._encoded_size(x::ApiDefs)
    encoded_size = 0
    !isempty(x.op) && (encoded_size += PB._encoded_size(x.op, 1))
    return encoded_size
end
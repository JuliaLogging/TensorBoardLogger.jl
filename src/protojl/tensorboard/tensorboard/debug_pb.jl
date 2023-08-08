# Autogenerated using ProtoBuf.jl v1.0.11 on 2023-08-08T14:37:02.031
# original path: proto/tensorboard/tensorboard/debug.proto (proto3 syntax)

import ProtoBuf as PB
using ProtoBuf: OneOf
using ProtoBuf.EnumX: @enumx

export DebuggedSourceFile, DebugTensorWatch, DebuggedSourceFiles, DebugOptions

struct DebuggedSourceFile
    host::String
    file_path::String
    last_modified::Int64
    bytes::Int64
    lines::Vector{String}
end
PB.default_values(::Type{DebuggedSourceFile}) = (;host = "", file_path = "", last_modified = zero(Int64), bytes = zero(Int64), lines = Vector{String}())
PB.field_numbers(::Type{DebuggedSourceFile}) = (;host = 1, file_path = 2, last_modified = 3, bytes = 4, lines = 5)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:DebuggedSourceFile})
    host = ""
    file_path = ""
    last_modified = zero(Int64)
    bytes = zero(Int64)
    lines = PB.BufferedVector{String}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            host = PB.decode(d, String)
        elseif field_number == 2
            file_path = PB.decode(d, String)
        elseif field_number == 3
            last_modified = PB.decode(d, Int64)
        elseif field_number == 4
            bytes = PB.decode(d, Int64)
        elseif field_number == 5
            PB.decode!(d, lines)
        else
            PB.skip(d, wire_type)
        end
    end
    return DebuggedSourceFile(host, file_path, last_modified, bytes, lines[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::DebuggedSourceFile)
    initpos = position(e.io)
    !isempty(x.host) && PB.encode(e, 1, x.host)
    !isempty(x.file_path) && PB.encode(e, 2, x.file_path)
    x.last_modified != zero(Int64) && PB.encode(e, 3, x.last_modified)
    x.bytes != zero(Int64) && PB.encode(e, 4, x.bytes)
    !isempty(x.lines) && PB.encode(e, 5, x.lines)
    return position(e.io) - initpos
end
function PB._encoded_size(x::DebuggedSourceFile)
    encoded_size = 0
    !isempty(x.host) && (encoded_size += PB._encoded_size(x.host, 1))
    !isempty(x.file_path) && (encoded_size += PB._encoded_size(x.file_path, 2))
    x.last_modified != zero(Int64) && (encoded_size += PB._encoded_size(x.last_modified, 3))
    x.bytes != zero(Int64) && (encoded_size += PB._encoded_size(x.bytes, 4))
    !isempty(x.lines) && (encoded_size += PB._encoded_size(x.lines, 5))
    return encoded_size
end

struct DebugTensorWatch
    node_name::String
    output_slot::Int32
    debug_ops::Vector{String}
    debug_urls::Vector{String}
    tolerate_debug_op_creation_failures::Bool
end
PB.default_values(::Type{DebugTensorWatch}) = (;node_name = "", output_slot = zero(Int32), debug_ops = Vector{String}(), debug_urls = Vector{String}(), tolerate_debug_op_creation_failures = false)
PB.field_numbers(::Type{DebugTensorWatch}) = (;node_name = 1, output_slot = 2, debug_ops = 3, debug_urls = 4, tolerate_debug_op_creation_failures = 5)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:DebugTensorWatch})
    node_name = ""
    output_slot = zero(Int32)
    debug_ops = PB.BufferedVector{String}()
    debug_urls = PB.BufferedVector{String}()
    tolerate_debug_op_creation_failures = false
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            node_name = PB.decode(d, String)
        elseif field_number == 2
            output_slot = PB.decode(d, Int32)
        elseif field_number == 3
            PB.decode!(d, debug_ops)
        elseif field_number == 4
            PB.decode!(d, debug_urls)
        elseif field_number == 5
            tolerate_debug_op_creation_failures = PB.decode(d, Bool)
        else
            PB.skip(d, wire_type)
        end
    end
    return DebugTensorWatch(node_name, output_slot, debug_ops[], debug_urls[], tolerate_debug_op_creation_failures)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::DebugTensorWatch)
    initpos = position(e.io)
    !isempty(x.node_name) && PB.encode(e, 1, x.node_name)
    x.output_slot != zero(Int32) && PB.encode(e, 2, x.output_slot)
    !isempty(x.debug_ops) && PB.encode(e, 3, x.debug_ops)
    !isempty(x.debug_urls) && PB.encode(e, 4, x.debug_urls)
    x.tolerate_debug_op_creation_failures != false && PB.encode(e, 5, x.tolerate_debug_op_creation_failures)
    return position(e.io) - initpos
end
function PB._encoded_size(x::DebugTensorWatch)
    encoded_size = 0
    !isempty(x.node_name) && (encoded_size += PB._encoded_size(x.node_name, 1))
    x.output_slot != zero(Int32) && (encoded_size += PB._encoded_size(x.output_slot, 2))
    !isempty(x.debug_ops) && (encoded_size += PB._encoded_size(x.debug_ops, 3))
    !isempty(x.debug_urls) && (encoded_size += PB._encoded_size(x.debug_urls, 4))
    x.tolerate_debug_op_creation_failures != false && (encoded_size += PB._encoded_size(x.tolerate_debug_op_creation_failures, 5))
    return encoded_size
end

struct DebuggedSourceFiles
    source_files::Vector{DebuggedSourceFile}
end
PB.default_values(::Type{DebuggedSourceFiles}) = (;source_files = Vector{DebuggedSourceFile}())
PB.field_numbers(::Type{DebuggedSourceFiles}) = (;source_files = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:DebuggedSourceFiles})
    source_files = PB.BufferedVector{DebuggedSourceFile}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, source_files)
        else
            PB.skip(d, wire_type)
        end
    end
    return DebuggedSourceFiles(source_files[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::DebuggedSourceFiles)
    initpos = position(e.io)
    !isempty(x.source_files) && PB.encode(e, 1, x.source_files)
    return position(e.io) - initpos
end
function PB._encoded_size(x::DebuggedSourceFiles)
    encoded_size = 0
    !isempty(x.source_files) && (encoded_size += PB._encoded_size(x.source_files, 1))
    return encoded_size
end

struct DebugOptions
    debug_tensor_watch_opts::Vector{DebugTensorWatch}
    global_step::Int64
    reset_disk_byte_usage::Bool
end
PB.default_values(::Type{DebugOptions}) = (;debug_tensor_watch_opts = Vector{DebugTensorWatch}(), global_step = zero(Int64), reset_disk_byte_usage = false)
PB.field_numbers(::Type{DebugOptions}) = (;debug_tensor_watch_opts = 4, global_step = 10, reset_disk_byte_usage = 11)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:DebugOptions})
    debug_tensor_watch_opts = PB.BufferedVector{DebugTensorWatch}()
    global_step = zero(Int64)
    reset_disk_byte_usage = false
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 4
            PB.decode!(d, debug_tensor_watch_opts)
        elseif field_number == 10
            global_step = PB.decode(d, Int64)
        elseif field_number == 11
            reset_disk_byte_usage = PB.decode(d, Bool)
        else
            PB.skip(d, wire_type)
        end
    end
    return DebugOptions(debug_tensor_watch_opts[], global_step, reset_disk_byte_usage)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::DebugOptions)
    initpos = position(e.io)
    !isempty(x.debug_tensor_watch_opts) && PB.encode(e, 4, x.debug_tensor_watch_opts)
    x.global_step != zero(Int64) && PB.encode(e, 10, x.global_step)
    x.reset_disk_byte_usage != false && PB.encode(e, 11, x.reset_disk_byte_usage)
    return position(e.io) - initpos
end
function PB._encoded_size(x::DebugOptions)
    encoded_size = 0
    !isempty(x.debug_tensor_watch_opts) && (encoded_size += PB._encoded_size(x.debug_tensor_watch_opts, 4))
    x.global_step != zero(Int64) && (encoded_size += PB._encoded_size(x.global_step, 10))
    x.reset_disk_byte_usage != false && (encoded_size += PB._encoded_size(x.reset_disk_byte_usage, 11))
    return encoded_size
end
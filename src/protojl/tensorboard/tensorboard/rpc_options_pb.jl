# Autogenerated using ProtoBuf.jl v1.0.11 on 2023-08-08T14:34:18.321
# original path: protojl/tensorboard/tensorboard/rpc_options.proto (proto3 syntax)

import ProtoBuf as PB
using ProtoBuf: OneOf
using ProtoBuf.EnumX: @enumx

export RPCOptions

struct RPCOptions
    use_rpc_for_inprocess_master::Bool
    compression_algorithm::String
    compression_level::Int32
    cache_rpc_response::Bool
    disable_session_connection_sharing::Bool
    num_channels_per_target::Int32
end
PB.default_values(::Type{RPCOptions}) = (;use_rpc_for_inprocess_master = false, compression_algorithm = "", compression_level = zero(Int32), cache_rpc_response = false, disable_session_connection_sharing = false, num_channels_per_target = zero(Int32))
PB.field_numbers(::Type{RPCOptions}) = (;use_rpc_for_inprocess_master = 1, compression_algorithm = 2, compression_level = 3, cache_rpc_response = 4, disable_session_connection_sharing = 5, num_channels_per_target = 6)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:RPCOptions})
    use_rpc_for_inprocess_master = false
    compression_algorithm = ""
    compression_level = zero(Int32)
    cache_rpc_response = false
    disable_session_connection_sharing = false
    num_channels_per_target = zero(Int32)
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            use_rpc_for_inprocess_master = PB.decode(d, Bool)
        elseif field_number == 2
            compression_algorithm = PB.decode(d, String)
        elseif field_number == 3
            compression_level = PB.decode(d, Int32)
        elseif field_number == 4
            cache_rpc_response = PB.decode(d, Bool)
        elseif field_number == 5
            disable_session_connection_sharing = PB.decode(d, Bool)
        elseif field_number == 6
            num_channels_per_target = PB.decode(d, Int32)
        else
            PB.skip(d, wire_type)
        end
    end
    return RPCOptions(use_rpc_for_inprocess_master, compression_algorithm, compression_level, cache_rpc_response, disable_session_connection_sharing, num_channels_per_target)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::RPCOptions)
    initpos = position(e.io)
    x.use_rpc_for_inprocess_master != false && PB.encode(e, 1, x.use_rpc_for_inprocess_master)
    !isempty(x.compression_algorithm) && PB.encode(e, 2, x.compression_algorithm)
    x.compression_level != zero(Int32) && PB.encode(e, 3, x.compression_level)
    x.cache_rpc_response != false && PB.encode(e, 4, x.cache_rpc_response)
    x.disable_session_connection_sharing != false && PB.encode(e, 5, x.disable_session_connection_sharing)
    x.num_channels_per_target != zero(Int32) && PB.encode(e, 6, x.num_channels_per_target)
    return position(e.io) - initpos
end
function PB._encoded_size(x::RPCOptions)
    encoded_size = 0
    x.use_rpc_for_inprocess_master != false && (encoded_size += PB._encoded_size(x.use_rpc_for_inprocess_master, 1))
    !isempty(x.compression_algorithm) && (encoded_size += PB._encoded_size(x.compression_algorithm, 2))
    x.compression_level != zero(Int32) && (encoded_size += PB._encoded_size(x.compression_level, 3))
    x.cache_rpc_response != false && (encoded_size += PB._encoded_size(x.cache_rpc_response, 4))
    x.disable_session_connection_sharing != false && (encoded_size += PB._encoded_size(x.disable_session_connection_sharing, 5))
    x.num_channels_per_target != zero(Int32) && (encoded_size += PB._encoded_size(x.num_channels_per_target, 6))
    return encoded_size
end
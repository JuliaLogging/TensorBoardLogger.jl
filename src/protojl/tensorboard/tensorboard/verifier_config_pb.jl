# Autogenerated using ProtoBuf.jl v1.0.11 on 2023-06-19T18:18:24.286
# original file: /home/lior/TensorBoardLogger.jl/gen/proto/tensorboard/compat/proto/verifier_config.proto (proto3 syntax)

import ProtoBuf as PB
using ProtoBuf: OneOf
using ProtoBuf.EnumX: @enumx

export var"VerifierConfig.Toggle", VerifierConfig

@enumx var"VerifierConfig.Toggle" DEFAULT=0 ON=1 OFF=2

struct VerifierConfig
    verification_timeout_in_ms::Int64
    structure_verifier::var"VerifierConfig.Toggle".T
end
PB.default_values(::Type{VerifierConfig}) = (;verification_timeout_in_ms = zero(Int64), structure_verifier = var"VerifierConfig.Toggle".DEFAULT)
PB.field_numbers(::Type{VerifierConfig}) = (;verification_timeout_in_ms = 1, structure_verifier = 2)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:VerifierConfig})
    verification_timeout_in_ms = zero(Int64)
    structure_verifier = var"VerifierConfig.Toggle".DEFAULT
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            verification_timeout_in_ms = PB.decode(d, Int64)
        elseif field_number == 2
            structure_verifier = PB.decode(d, var"VerifierConfig.Toggle".T)
        else
            PB.skip(d, wire_type)
        end
    end
    return VerifierConfig(verification_timeout_in_ms, structure_verifier)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::VerifierConfig)
    initpos = position(e.io)
    x.verification_timeout_in_ms != zero(Int64) && PB.encode(e, 1, x.verification_timeout_in_ms)
    x.structure_verifier != var"VerifierConfig.Toggle".DEFAULT && PB.encode(e, 2, x.structure_verifier)
    return position(e.io) - initpos
end
function PB._encoded_size(x::VerifierConfig)
    encoded_size = 0
    x.verification_timeout_in_ms != zero(Int64) && (encoded_size += PB._encoded_size(x.verification_timeout_in_ms, 1))
    x.structure_verifier != var"VerifierConfig.Toggle".DEFAULT && (encoded_size += PB._encoded_size(x.structure_verifier, 2))
    return encoded_size
end

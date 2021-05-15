"""
    masked_crc32c(data)
"""
function masked_crc32c(data)
    x = UInt32(CRC32c.crc32c(data))
    return UInt32(((x >> 15) | UInt32(x << 17)) + 0xa282ead8)
end

function serialize_proto(data::ProtoType)
    pb = PipeBuffer()
    logless_writeproto(pb, data)
    pb.data
end

function serialize_proto(data::Any)
    pb = PipeBuffer()
    write(pb, data)
    pb.data
end

"""
    wrapper for writeproto that supresses logging to prevent infinite
    recursion.
"""
function logless_writeproto(pb::IO, obj)
    with_logger(NullLogger()) do
        writeproto(pb, obj)
    end
end

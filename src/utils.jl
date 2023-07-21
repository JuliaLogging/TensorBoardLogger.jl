"""
    masked_crc32c(data)
"""
function masked_crc32c(data)
    x = UInt32(CRC32c.crc32c(data))
    return UInt32(((x >> 15) | UInt32(x << 17)) + 0xa282ead8)
end

function serialize_proto(data)
    pb = PipeBuffer()
    encode(ProtoEncoder(pb), data)
    return view(pb.data, 1:pb.size) # Do not return additional zeros
end

"""
    wrapper for writeproto that supresses logging to prevent infinite
    recursion.
"""
function _writeproto(pb::IO, obj)
    with_logger(NullLogger()) do
        writeproto(pb, obj)
    end
end

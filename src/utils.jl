"""
    masked_crc32c(data)
"""
function masked_crc32c(data)
    x = UInt32(CRC32c.crc32c(data))
    return UInt32(((x >> 15) | UInt32(x << 17)) + 0xa282ead8)
end

function serialize_proto(data::Any)
    pb = PipeBuffer()
    writeproto(pb, data)
    pb.data
end

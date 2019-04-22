"""
    masked_crc32c(data)
"""
function masked_crc32c(data)
    x = UInt32(CRC32c.crc32c(data))
    return UInt32(((x >> 15) | UInt32(x << 17)) + 0xa282ead8)
end

function serialize_proto(data::Union{ProtoType, ProtoEnum})
    pb = PipeBuffer()
    writeproto(pb, data)
    pb.data
end

"""
    markdown_repr(x)

Returns the most suitable method for displaying `x` in a markdown document.
"""
function markdown_repr(x)
    for mime_type in ("text/markdown", "text/html", "text/plain")
        try
            return repr(mime_type, x)
        catch err
            err isa MethodError || rethrow(err)
        end
    end
    return repr(x)
end

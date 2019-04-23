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
            if showable(mime_type, x)
                return repr(mime_type, x)
            end
        catch
            @debug "It said it was showable, but it lied" mime_type x exception=err

            # we blindly catch everything, because who knows what evil
            # people are doing in their misimplemented `repr` functions
        end
    end
    return repr(x)
end

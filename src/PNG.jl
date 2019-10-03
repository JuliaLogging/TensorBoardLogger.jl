# Official spec : http://www.libpng.org/pub/png/spec/1.2/png-1.2.pdf

"""
    PngImage

A wrapper around the binary encoding of a PNG image, holding it's attributes
"""
struct PngImage
    attr::Dict
    data::Vector{UInt8}
end

function PngImage(buffer::Base.IOBuffer)
    !check_valid_png(buffer.data) && return false
    attr  = read_info(buffer.data)
    return PngImage(attr, buffer.data)
end

"""
    check_valid_png(data)

Checks if the header of the provided buffer is a valid png header.
Also checks if the first chunk is valid according to the PNG standard

Refs:
[1] http://www.libpng.org/pub/png/spec/1.2/png-1.2.pdf
[2] https://en.wikipedia.org/wiki/Portable_Network_Graphics#File_header
"""
function check_valid_png(data)
    #Header https://en.wikipedia.org/wiki/Portable_Network_Graphics#File_header
    header_value = UInt8[0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a]

    # Avoid accessing memory that is not there
    length(data) < 12 && return false
    # Check the header
    data[1:8] != header_value && return false

    # First chunk: check length
    cnk_start = 8;
    cnk_len = reinterpret(Int32, data[cnk_start.+(1:4)]) |> first |> ntoh
    String(data[cnk_start.+(5:8)]) != "IHDR" && return false
    cnk_len <13 && return false

    return true
end

"""
    read_info(data)

Reads the content of the first chunk of a PNG, containing information such as
height, width and color type.
"""
function read_info(data)
    cnk_start = 8;
    cnk_data = cnk_start + 8;

    # Read chunk data
    width, height = ntoh.(reinterpret(Int32, data[cnk_data.+(1:8)]))
    bit_depth     = ntoh.(reinterpret(Int8,  data[cnk_data+9]))
    col_type      = ntoh.(reinterpret(Int8,  data[cnk_data+10]))
    compression   = ntoh.(reinterpret(Int8,  data[cnk_data+11]))
    filter        = ntoh.(reinterpret(Int8,  data[cnk_data+12]))
    interlace     = ntoh.(reinterpret(Int8,  data[cnk_data+12]))

    attr = Dict(
        :width=>width,
        :height=>height,
        :bitdepth=>bit_depth,
        :colorspace=>col_type,
        :compression=>compression,
        :filter=>filter,
        :interlace=>interlace
    )
    return attr
end

function Base.convert(::Type{PngImage}, img::AbstractArray{<:Colorant})
    pb = PipeBuffer()
    save(Stream(format"PNG", pb), img)
    return PngImage(pb)
end

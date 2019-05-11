"""
    log_image(logger, name, img, step)
Logs an image using given format information and raw data
"""
@enum ImageFormat HW WH HWC WHC CHW CWH HWN WHN NHW NWH HWCN WHCN CHWN CWHN NHWC NWHC NCHW NCWH
function log_image(logger::TBLogger, name::AbstractString, imgArray::AbstractArray, format::ImageFormat; step=nothing)
    #if data contains float numbers, scale them to 0-1 and convert to `Float64`
    #if data contains integer numbers, scale them to 0-255 and convert to `Float64`
    if isa(first(imgArray), AbstractFloat)
        imgArray = Float64.(imgArray./(min(imgArray..., 1)))
    else
        imgArray = Float64.(imgArray./255)
    #dictionary containing functions to perform for the given format
    formatdict = Dict(
    HW => function(imgArray)
        @assert ndims(imgArray) == 2
        H, W = size(imgArray)
        reshape(imgArray, (H, W, 1))
    end
    WH => function(imgArray)
        @assert ndims(imgArray) == 2
        imgArray = transpose(imgArray)
        H, W = size(imgArray)
        reshape(imgArray, (H, W, 1))
    end
    HWC => function(imgArray)
        @assert ndims(imgArray) == 3
        imgArray
    end
    WHC => function(imgArray)
        @assert ndims(imgArray) == 3
        permutedims(imgArray, (2, 1, 3))
    end
    CHW => function(imgArray)
        @assert ndims(imgArray) == 3
        permutedims(imgArray, (2, 3, 1))
    end
    CWH => function(imgArray)
        @assert ndims(imgArray) == 3
        permutedims(imgArray, (3, 2, 1))
    end
    HWN => function(imgArray)
        @assert ndims(imgArray) == 3
        N = size(imgArray, 3)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[:, :, n], HW)
        name = name*"/$N"
        imgArray[:, :, N]
    end
    WHN => function(imgArray)
        @assert ndims(imgArray) == 3
        N = size(imgArray, 3)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[:, :, n]), WH)
        name = name*"/$N"
        transpose(imgArray[:, :, N])
    end
    NHW => function(imgArray)
        @assert ndims(imgArray) == 3
        N = size(imgArray, 3)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[n, :, :], HW)
        name = name*"/$N"
        imgArray[N, :, :]
    end
    NWH => function(imgArray)
        @assert ndims(imgArray) == 3
        N = size(imgArray, 3)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[n, :, :], WH)
        name = name*"/$N"
        transpose(imgArray[N, :, :])
    end
    HWCN => function(imgArray)
        @assert ndims(imgArray) == 3
        N = size(imgArray, 3)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[:, :, :, n], HWC)
        name = name*"/$N"
        imgArray[:, :, :, N]
    end
    WHCN => function(imgArray)
        @assert ndims(imgArray) == 3
        N = size(imgArray, 3)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[:, :, :, n], WHC)
        name = name*"/$N"
        permutedims(imgArray[:, :, :, N], (2, 1, 3))
    end
    CHWN => function(imgArray)
        @assert ndims(imgArray) == 3
        N = size(imgArray, 3)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[:, :, :, n], CHW)
        name = name*"/$N"
        permutedims(imgArray[:, :, :, N], (2, 3, 1))
    end
    CWHN => function(imgArray)
        @assert ndims(imgArray) == 3
        N = size(imgArray, 3)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[:, :, :, n], CWH)
        name = name*"/$N"
        permutedims(imgArray[:, :, :, N], (3, 2, 1))
    end
    CHWN => function(imgArray)
        @assert ndims(imgArray) == 3
        N = size(imgArray, 3)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[:, :, :, n], CHW)
        name = name*"/$N"
        permutedims(imgArray[:, :, :, N], (2, 3, 1))
    end
    NHWC => function(imgArray)
        @assert ndims(imgArray) == 3
        N = size(imgArray, 3)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[n, :, :, :], HWC)
        name = name*"/$N"
        imgArray[N, :, :, :]
    end
    NWHC => function(imgArray)
        @assert ndims(imgArray) == 3
        N = size(imgArray, 3)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[n, :, :, :], WHC)
        name = name*"/$N"
        permutedims(imgArray[N, :, :, :], (2, 1, 3))
    end
    NCHW => function(imgArray)
        @assert ndims(imgArray) == 3
        N = size(imgArray, 3)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[n, :, :, :], CHW)
        name = name*"/$N"
        permutedims(imgArray[N, :, :, :], (2, 3, 1))
    end
    NCWH => function(imgArray)
        @assert ndims(imgArray) == 3
        N = size(imgArray, 3)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[n, :, :, :], CWH)
        name = name*"/$N"
        permutedims(imgArray[N, :, :, :], (3, 2, 1))
    end
    )
    imgArray = formatdict[format](imgArray)
    summ = SummaryCollection()
    push!(summ.value, image_summary(name, imgArray))
    write_event(logger.file, make_event(logger, summ, step=step))
end

function image_summary(name::AbstractString, imgArray::AbstractArray{Float64, 3})
    #image is strictly an Array of type Float64 format HWC
    channelcolordict = Dict(1 => Gray, 2 => GrayA, 3 => RGB, 4 => RGBA)
    height, width, channels = size(imgArray)
    @assert channels ∈ channelcolordict
    img = colorview(channelcolordict[channels], imgArray)
    io = IOBuffer()
    save(Stream(format"PNG", io), img)
    eis = io.data
    imgsumm = Summary_Image(height = height, width = width, colorspace = 1, encoded_image_string = eis)
    Summary_Value(tag = name, image = imgsumm)
end
"""
TODO:
- TestCases
"""

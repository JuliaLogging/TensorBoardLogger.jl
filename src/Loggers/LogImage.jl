
@enum ImageFormat L LN NL CL LC NCL NLC CLN LCN HW WH HWC WHC CHW CWH HWN WHN NHW NWH HWCN WHCN CHWN CWHN NHWC NWHC NCHW NCWH
"""
    log_images(logger::TBLogger, name::AbstractString, imgArrays::AbstractArray, format::ImageFormat; step = nothing)

Log multiple images using `Array` of images and format
- imgArrays: `Array` of images, e.g. Array{Array{Float64, 3}, 1}. `Array` of images can be multidimensional.
- format: format which applies to each image in the `Array` of images. It can be one of
  {L, LN, NL,
   CL, LC, NCL, NLC, CLN, LCN,
   HW, WH, HWC, WHC, CHW, CWH,
   HWN, WHN, NHW, NWH,
   HWCN, WHCN, CHWN, CWHN, NHWC, NWHC, NCHW, NCWH}
"""
function log_images(logger::TBLogger, name::AbstractString, imgArrays::AbstractArray; step = nothing)
    n = 1
    @assert isa(first(imgArrays), AbstractArray{<:Colorant}) "Please specify format"
    for imgArray in imgArrays
        log_image(logger, name*"/$n", imgArray, step = step)
        n += 1
    end
end

function log_images(logger::TBLogger, name::AbstractString, imgArrays::AbstractArray, format::ImageFormat; step = nothing)
    n = 1
    for imgArray in imgArrays
        log_image(logger, name*"/$n", imgArray, format, step = step)
        n += 1
    end
end
"""
    log_image(logger::TBLogger, name::AbstractString, imgArray::AbstractArray, format::ImageFormat, step = nothing)

Log an image using image data and format
- imgArray: image data. A 1-D, 2-D or 3-D `Array` of pixel values. pixel values can be Real [0, 1] or Integer[0, 255]
- format: format of the image. It can be one of
  {L, LN, NL,
   CL, LC, NCL, NLC, CLN, LCN,
   HW, WH, HWC, WHC, CHW, CWH,
   HWN, WHN, NHW, NWH,
   HWCN, WHCN, CHWN, CWHN, NHWC, NWHC, NCHW, NCWH}
  - L: Length
  - C: Channel/Color
  - H: Height
  - W: Width
  - N: Observation
"""
function log_image(logger::TBLogger, name::AbstractString, img::AbstractArray{<:Colorant}; step = nothing)
    dimensions = ndims(img)
    #if it has 3 dimensions, eg MRI image, log each channel vth same name
    #so that one can slide through channels
    if dimensions == 3
        #3rd d is channel dim as observed in testimages
        channels = size(img, 3)
        for c in 1:channels-1
            log_image(logger, name, img[:, :, c], step = step)
        end
        img = img[:, :, channels]
    end
    summ = SummaryCollection()
    push!(summ.value, image_summary(name, img))
    write_event(logger.file, make_event(logger, summ, step=step))
end

function log_image(logger::TBLogger, name::AbstractString, imgArray::AbstractArray, format::ImageFormat; step=nothing)
    summ = SummaryCollection()
    #passing logger and step to image_summary because,
    #format containing N will have to use them to call `log_image`
    push!(summ.value, image_summary(name, imgArray, format, logger = logger, step = step))
    write_event(logger.file, make_event(logger, summ, step=step))
end

function image_summary(name::AbstractString, img::AbstractArray{<:Colorant})
    #image is of type AbstractArray{<:Colorant}
    dimensions = ndims(img)
    if isa(first(img), Gray)
        colorspace = 1
    elseif isa(first(img), GrayA)
        colorspace = 2
    elseif isa(first(img), RGB)
        colorspace = 3
    elseif isa(first(img), RGBA)
        colorspace = 4
    elseif isa(first(img), BGRA)
        colorspace = 6
    else
        throw("Unknown Colorspace")
    end
    if dimensions == 1
        #Grayscale/color array
        height = 1
        width = size(img, 1)
    elseif dimensions == 2
        #Grayscale/color matrix
        height, width = size(img)
    else
        throw("Unknown Dimensions")
    end
    #save image in a buffer
    io = IOBuffer()
    save(Stream(format"PNG", io), img)
    #read from buffer to obtain encoded string of the image
    eis = io.data
    imgsumm = Summary_Image(height = height, width = width, colorspace = colorspace, encoded_image_string = eis)
    Summary_Value(tag = name, image = imgsumm)
end

function image_summary(name::AbstractString, imgArray::AbstractArray, format::ImageFormat; logger = nothing, step = nothing, data = nothing)
    #logger and step are only relevant when using explicit function `log_image` and format contains N
    #unpack RGB, RGBA value to channels using channelview
    imgArray = channelview(imgArray)
    #if data contains integer numbers, scale them to 0-255
    if isa(first(imgArray), Integer)
        imgArray = (imgArray./255)
    end
    #convert all values to `Float64` for uniformity
    imgArray = Float64.(imgArray)
    #scale all values to 0-1
    imgArray = (imgArray./(max(maximum(imgArray), 1)))
    #dictionary containing functions to perform for the given format
    #goal is to convert any format to CHW
    formatdict = Dict(
    L => function(imgArray)
        @assert ndims(imgArray) == 1
        W = size(imgArray, 1)
        reshape(imgArray, (1, 1, W))
    end,
    LN => function(imgArray)
        @assert ndims(imgArray) == 2
        W, N = size(imgArray, 2)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[:, n], L, step = step)
        end
        name = name*"/$N"
        reshape(imgArray[:, N:N], (1, 1, W))
    end,
    NL => function(imgArray)
        @assert ndims(imgArray) == 2
        N, W = size(imgArray)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[n, :], L, step = step)
        end
        name = name*"/$N"
        reshape(imgArray[N:N, :], (1, 1, W))
    end,
    CL => function(imgArray)
        @assert ndims(imgArray) == 2
        C, W = size(imgArray)
        reshape(imgArray, (C, 1, W))
    end,
    LC => function(imgArray)
        @assert ndims(imgArray) == 2
        imgArray = transpose(imgArray)
        C, W = size(imgArray)
        reshape(imgArray, (C, 1, W))
    end,
    NCL => function(imgArray)
        @assert ndims(imgArray) == 3
        N, C, W = size(imgArray)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[n, :, :], CL, step = step)
        end
        name = name*"/$N"
        reshape(imgArray[N:N, :, :], (C, 1, W))
    end,
    NLC => function(imgArray)
        @assert ndims(imgArray) == 3
        N, W, C = size(imgArray)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[n, :, :], LC, step = step)
        end
        name = name*"/$N"
        reshape(imgArray[N:N, :, :], (C, 1, W))
    end,
    LCN => function(imgArray)
        @assert ndims(imgArray) == 3
        W, C, N = size(imgArray)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[:, :, n], LC, step = step)
        end
        name = name*"/$N"
        reshape(imgArray[:, :, N:N], (C, 1, W))
    end,
    CLN => function(imgArray)
        @assert ndims(imgArray) == 3
        C, W, N = size(imgArray)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[:, :, n], CL, step = step)
        end
        name = name*"/$N"
        reshape(imgArray[:, :, N:N], (C, 1, W))
    end,
    HW => function(imgArray)
        @assert ndims(imgArray) == 2
        H, W = size(imgArray)
        reshape(imgArray, (1, H, W))
    end,
    WH => function(imgArray)
        @assert ndims(imgArray) == 2
        imgArray = transpose(imgArray)
        H, W = size(imgArray)
        reshape(imgArray, (1, H, W))
    end,
    HWC => function(imgArray)
        @assert ndims(imgArray) == 3
        permutedims(imgArray, (3, 1, 2))
    end,
    WHC => function(imgArray)
        @assert ndims(imgArray) == 3
        permutedims(imgArray, (3, 2, 1))
    end,
    CHW => function(imgArray)
        @assert ndims(imgArray) == 3
        imgArray
    end,
    CWH => function(imgArray)
        @assert ndims(imgArray) == 3
        permutedims(imgArray, (1, 3, 2))
    end,
    HWN => function(imgArray)
        @assert ndims(imgArray) == 3
        N = size(imgArray, 3)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[:, :, n], HW, step = step)
        end
        name = name*"/$N"
        permutedims(imgArray[:, :, N:N], (3, 1, 2))
    end,
    WHN => function(imgArray)
        @assert ndims(imgArray) == 3
        N = size(imgArray, 3)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[:, :, n], WH, step = step)
        end
        name = name*"/$N"
        permutedims(imgArray[:, :, N:N], (3, 2, 1))
    end,
    NHW => function(imgArray)
        @assert ndims(imgArray) == 3
        N = size(imgArray, 1)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[n, :, :], HW, step = step)
        end
        name = name*"/$N"
        imgArray[N:N, :, :]
    end,
    NWH => function(imgArray)
        @assert ndims(imgArray) == 3
        N = size(imgArray, 1)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[n, :, :], WH, step = step)
        end
        name = name*"/$N"
        permutedims(imgArray[N:N, :, :], (1, 3, 2))
    end,
    HWCN => function(imgArray)
        @assert ndims(imgArray) == 4
        N = size(imgArray, 4)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[:, :, :, n], HWC, step = step)
        end
        name = name*"/$N"
        permutedims(imgArray[:, :, :, N], (3, 1, 2))
    end,
    WHCN => function(imgArray)
        @assert ndims(imgArray) == 4
        N = size(imgArray, 4)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[:, :, :, n], WHC, step = step)
        end
        name = name*"/$N"
        permutedims(imgArray[:, :, :, N], (3, 2, 1))
    end,
    CHWN => function(imgArray)
        @assert ndims(imgArray) == 4
        N = size(imgArray, 4)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[:, :, :, n], CHW, step = step)
        end
        name = name*"/$N"
        imgArray[:, :, :, N]
    end,
    CWHN => function(imgArray)
        @assert ndims(imgArray) == 4
        N = size(imgArray, 4)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[:, :, :, n], CWH, step = step)
        end
        name = name*"/$N"
        permutedims(imgArray[:, :, :, N], (1, 3, 2))
    end,
    NHWC => function(imgArray)
        @assert ndims(imgArray) == 4
        N = size(imgArray, 1)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[n, :, :, :], HWC, step = step)
        end
        name = name*"/$N"
        permutedims(imgArray[N, :, :, :], (3, 1, 2))
    end,
    NWHC => function(imgArray)
        @assert ndims(imgArray) == 4
        N = size(imgArray, 1)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[n, :, :, :], WHC, step = step)
        end
        name = name*"/$N"
        permutedims(imgArray[N, :, :, :], (3, 2, 1))
    end,
    NCHW => function(imgArray)
        @assert ndims(imgArray) == 4
        N = size(imgArray, 1)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[n, :, :, :], CHW, step = step)
        end
        name = name*"/$N"
        imgArray[N, :, :, :]
    end,
    NCWH => function(imgArray)
        @assert ndims(imgArray) == 4
        N = size(imgArray, 1)
        for n in 1:N-1
            log_image(logger, name*"/$n", imgArray[n, :, :, :], CWH, step = step)
        end
        name = name*"/$N"
        permutedims(imgArray[N, :, :, :], (1, 3, 2))
    end
    )
    imgArray = formatdict[format](imgArray)
    channelcolordict = Dict(1 => Gray, 2 => GrayA, 3 => RGB, 4 => RGBA)
    channels, height, width = size(imgArray)
    @assert channels ∈ channelcolordict.keys
    #if it is a single channel Array, convert it to HW
    if channelcolordict[channels] == Gray
        imgArray = imgArray[1, :, :]
    end
    #convert Array to PNG and save in a buffer
    img = colorview(channelcolordict[channels], imgArray)
    image_summary(name, img)
end

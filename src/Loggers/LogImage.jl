# Note: we use the 100s place of the enum to represent the number of dimensions
# And the 10s place to represent which dimension is the observation (N), 0 for no observation dimension
@enum ImageFormat begin
    L=100;
    CL=200; LC; HW; WH; NL=210; LN=220;
    HWC=300; WHC; CHW; CWH; NCL=310; NHW; NWH; NLC; CLN=330; LCN; HWN; WHN;
    NHWC=410; NWHC; NCHW; NCWH; HWCN=440; WHCN; CHWN; CWHN;
end

expected_ndims(x::ImageFormat) = Int(x) ÷ 100 # get the 100's digit
obs_dim(x::ImageFormat) = (Int(x) % 100) ÷ 10 # get the 10's digit
const strip_obs = Dict(
    NL=>L, LN=>L, NCL=>CL, CLN=>CL, NLC=>LC, LCN=>LC,
    NHW=>HW, HWN=>HW, NWH=>WH, WHN=>WH,
    NHWC=>HWC, NWHC=>WHC, NCHW=>CHW, NCWH=>CWH, HWCN=>HWC, WHCN=>WHC, CHWN=>CHW, CWHN=>CWH
)

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
    @assert isa(first(imgArrays), AbstractArray{<:Colorant}) "Please specify format"
    for (n, imgArray) in enumerate(imgArrays)
        log_image(logger, name*"/$n", imgArray, step = step)
    end
end

function log_images(logger::TBLogger, name::AbstractString, imgArrays::AbstractArray, format::ImageFormat; step = nothing)
    for (n, imgArray) in enumerate(imgArrays)
        log_image(logger, name*"/$n", imgArray, format, step = step)
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
    summ = SummaryCollection(image_summary(name, img))
    write_event(logger.file, make_event(logger, summ, step=step))
end

function log_image(logger::TBLogger, name::AbstractString, imgArray::AbstractArray, format::ImageFormat; step=nothing)
    imgArray = channelview(imgArray)
    dims = ndims(imgArray)
    @assert dims == expected_ndims(format)
    obsdim = obs_dim(format)
    if iszero(obsdim)
        summ = SummaryCollection(image_summary(name, imgArray, format))
        write_event(logger.file, make_event(logger, summ, step=step))
    else
        format = strip_obs[format]
        index = collect("[:"* ",:"^(dims-1) *"]")
        index[2*obsdim] = 'g'
        index = join(index)
        global gimgArray = imgArray
        nth_img = Meta.parse("gimgArray$(index)")
        for n in 1:size(imgArray, obsdim)
            global g = n
            log_image(logger, name*"/$n", eval(nth_img), format, step = step)
        end
    end
end

function image_summary(name::AbstractString, img::AbstractArray{<:Colorant})
    #image is of type AbstractArray{<:Colorant}
    getcolorspaceid(::Type{<:Gray}) = 1
    getcolorspaceid(::Type{<:GrayA}) = 2
    getcolorspaceid(::Type{<:RGB}) = 3
    getcolorspaceid(::Type{<:RGBA}) = 4
    getcolorspaceid(::Type{<:BGRA}) = 6
    colorspace = getcolorspaceid(eltype(img))
    dimensions = ndims(img)
    if dimensions == 1
        #Grayscale/color array
        height = 1
        width = size(img, 1)
    elseif dimensions == 2
        #Grayscale/color matrix
        height, width = size(img)
    else
        throw("Too many dimensions")
    end
    #save image in a buffer
    io = IOBuffer()
    save(Stream(format"PNG", io), img)
    #read from buffer to obtain encoded string of the image
    eis = io.data
    imgsumm = Summary_Image(height = height, width = width, colorspace = colorspace, encoded_image_string = eis)
    Summary_Value(tag = name, image = imgsumm)
end

function image_summary(name::AbstractString, imgArray::AbstractArray, format::ImageFormat)
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
    #convert any format to CHW
    imgArray =
    format == L   ? reshape(imgArray, (1, 1, size(imgArray, 1))) :
    format == CL  ? reshape(imgArray, (size(imgArray, 1), 1, size(imgArray, 2))) :
    format == LC  ? reshape(transpose(imgArray), (size(imgArray, 2), 1, size(imgArray, 1))) :
    format == HW  ? reshape(imgArray, (1, size(imgArray, 1), size(imgArray, 2))) :
    format == WH  ? reshape(transpose(imgArray), (1, size(imgArray, 2), size(imgArray, 1))) :
    format == HWC ? permutedims(imgArray, (3, 1, 2)) :
    format == WHC ? permutedims(imgArray, (3, 2, 1)) :
    format == CHW ? imgArray :
    format == CWH ? permutedims(imgArray, (1, 3, 2)) :
    #== else ==#    throw("Invalid format")
    channels, height, width = size(imgArray)
    color =
    channels == 1 ? Gray :
    channels == 2 ? GrayA :
    channels == 3 ? RGB :
    channels == 4 ? RGBA :
    #== else ==#    throw("Too many channels")
    #if it is a single channel Array, convert it to HW
    if color == Gray
        imgArray = imgArray[1, :, :]
    end
    #convert Array to PNG pass it to image_summary
    img = colorview(color, imgArray)
    image_summary(name, img)
end

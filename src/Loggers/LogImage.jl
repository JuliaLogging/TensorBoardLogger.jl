function image_summary(name::AbstractString, img::PNG)

    attr    = img.attr
    imgsumm = Summary_Image(height     = attr[:height],
                            width      = attr[:width],
                            colorspace = attr[:colorspace],
                            encoded_image_string = img.data )
    return Summary_Value(tag = name, image = imgsumm)
end


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
    summ = SummaryCollection(image_summary(name, convert(PNG, img)))
    write_event(logger.file, make_event(logger, summ, step=step))
end

function log_image(logger::TBLogger, name::AbstractString, imgArray::AbstractArray, format::ImageFormat; step=nothing)
    imgArray = channelview(imgArray)
    dims = ndims(imgArray)
    @assert dims == expected_ndims(format)
    obsdim = obs_dim(format)
    if iszero(obsdim)
        summ = SummaryCollection(image_summary(name, convert(PNG, TBImage(imgArray, format))))
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

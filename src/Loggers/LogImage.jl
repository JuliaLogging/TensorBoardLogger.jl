function image_summary(name::AbstractString, img::PNG)

    attr    = img.attr
    imgsumm = Summary_Image(height     = attr[:height],
                            width      = attr[:width],
                            colorspace = attr[:colorspace],
                            encoded_image_string = img.data )
    return Summary_Value(tag = name, image = imgsumm)
end


"""
    log_images(logger::TBLogger, name::AbstractString, imgArrays::AbstractArray, format::ImageFormat; step=step(logger))

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
    log_keyval(logger, name, imgArrays, step)
end

log_images(logger::TBLogger, name::AbstractString, imgArrays::AbstractArray, format::ImageFormat; step = nothing) =
    log_keyval(logger, name, TBImages(imgArrays, format), step)

"""
    log_image(logger::TBLogger, name::AbstractString, imgArray::AbstractArray, format::ImageFormat; step=step(logger))

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
log_image(logger::TBLogger, name::AbstractString, img::AbstractArray{<:Colorant}; step = nothing) =
    log_keyval(logger, name, img, step)

log_image(logger::TBLogger, name::AbstractString, imgArray::AbstractArray, format::ImageFormat; step=nothing) =
    log_keyval(logger, name, TBImage(imgArray, format), step)

function image_summary(name::AbstractString, img::PngImage)

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
function log_images(logger::TBLogger, name::AbstractString, img_array::AbstractArray; step = nothing)
    if isa(first(img_array), AbstractArray{<:Colorant})
        log_keyval(logger, name, img_array, step)
    elseif showable("image/png", first(img_array))
        for (i,img)=enumerate(img_array)
            log_image(logger, name*"/$i", img, step=step)
        end
    else
        @error "Array is neither <:AbstractArray{<:Colorant} nor showable to png.\n If it's numeric data, you should specify the format."
    end
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

"""
log_image(logger, name, obj; [step=current_step])

Renders the object to PNG and sends it to TensorBoard as an image with tag `name`.
`showable("image/png", obj)` must be true.
"""
function log_image(lg::TBLogger, name::AbstractString, obj; step=nothing)
    if !showable("image/png", obj)
        @error "cannot log $name as an image object $obj"
        return
    end
    pb = PipeBuffer()
    show(pb, "image/png", obj)
    log_keyval(lg, name, PngImage(pb), step)
end

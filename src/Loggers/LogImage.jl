"""
    log_image(logger, name, img, step)
Logs an image
"""
function log_image(logger::TBLogger, name::AbstractString, img::Array; step=nothing)
    summ = SummaryCollection()
    push!(summ.value, image_summary(name, img))
    write_event(logger.file, make_event(logger, summ, step=step))
end

function image_summary(name::AbstractString, img::Array)
    #assuming input is in HWC #C is currently = 1
    #assuming input is of type Float64
    #obtain height, width channel of image
    height, width, channel = size(img)
    #Encode image to string
    Img = colorview(Gray, img)
    io = IOBuffer()
    save(Stream(format"PNG", io), Img)
    eis = io.data
    imgsumm = Summary_Image(height = height, width = width, colorspace = channel, encoded_image_string = eis)
    Summary_Value(tag = name, image = imgsumm)
end

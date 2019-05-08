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
    #Encode image to string
    io = IOBuffer()
    iob64_encode = Base64.Base64EncodePipe(io)
    write(iob64_encode, img)
    close(iob64_encode)
    str = String(take!(io));
    eis = Vector{UInt8}(str)
    #obtain height and width of image
    height = size(img)[1]
    width = size(img)[2]
    #obtain number of channels
    channels = 1
    if length(size(img)) <= 2
        channels = 1
    else
        channels = size(img)[3]
    end
    #imgsumm = Summary_Image(height = size(img)[1], width = size(img)[2], colorspace = channels, encoded_image_string = eis)
    imgsumm = Summary_Image(height = 4, width = 4, colorspace = 1, encoded_image_string = eis)
    Summary_Value(tag = name, image = imgsumm)
end


"""
import TensorBoardLogger
using .TensorBoardLogger
lgr = TBLogger("/home/shashi/run")
img = rand(UInt8, 24, 24)
log_value(lgr, "testval", 1226, step = 0)
log_image(lgr, "testimage", img, step = 0)
"""

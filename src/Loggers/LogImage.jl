"""
    log_image(logger, name, img, step)

Logs an image with name `name` at step `step`
"""
function log_image(logger::Logger, name::String, img; step=nothing)
    summ    = SummaryCollection()
    push!(summ.value, image_summary(name, img))
    write_event(logger.file, make_event(logger, summ, step=step))
end

function image_summary(name::String, img)
    Summary_Image(height = size(img)[1], width = size(img)[2], colorspace = 3, encoded_image_string = Nothing)
end

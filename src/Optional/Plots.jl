using .Plots

preprocess(name, val::Plots.Plot, data) = push!(data, name=>val)
summary_impl(name, value::Plots.Plot) = image_summary(name, value)

function image_summary(name::AbstractString, img::Plots.Plot)
    pb = PipeBuffer()
    show(pb, MIME("image/png"), img)
    imdata = pb.data

    # De-serializing PNG by hand. Because we're crazy.
    # I want to get the h,w from the PNG because I don't trust Plots.jl
    # https://www.w3.org/TR/PNG-Chunks.html
    # Skipping first chunk 1:8 and going to the second 9:..
    h, w = ntoh.(reinterpret(Int32, imdata[17:24]))
    cspace = Int(ntoh(imdata[26]))

    imgsumm = Summary_Image(height = h, width = w, colorspace = cspace,
                            encoded_image_string = imdata)

    Summary_Value(tag = name, image = imgsumm)
end


"""
    log_image(logger, name, plot::Plots.Plot; [step=current_step])

Renders the Plots' and sends it to TensorBoard as an image with tag `name`.
"""
function log_image(lg::TBLogger, name::AbstractString, img::Plots.Plot; step=nothing)
    summ = SummaryCollection(image_summary(name, img))
    write_event(logger.file, make_event(logger, summ, step=step))
end

using .Plots

function Base.convert(t::Type{PNG}, plot::Plots.Plot)
    pb = PipeBuffer()
    show(pb, MIME("image/png"), plot)
    return PNG(pb)
end

preprocess(name, val::Plots.Plot, data) = preprocess(name, convert(PNG, val), data)

"""
    log_image(logger, name, plot::Plots.Plot; [step=current_step])

Renders the Plots' and sends it to TensorBoard as an image with tag `name`.
"""
function log_image(lg::TBLogger, name::AbstractString, img::Plots.Plot; step=nothing)
    summ = SummaryCollection(image_summary(name, img))
    write_event(lg.file, make_event(lg, summ, step=step))
end

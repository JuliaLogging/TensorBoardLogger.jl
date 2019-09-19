using .Plots

function Base.convert(t::Type{PNG}, figure::PyPlot.Figure)
    pb = PipeBuffer()
    show(pb, MIME("image/png"), figure)
    return PNG(pb)
end

preprocess(name, val::Plots.Plot, data) = preprocess(name, convert(PNG, val), data)

"""
    log_image(logger, name, plot::Plots.Figure; [step=current_step])

Renders the PyPlots' and sends it to TensorBoard as an image with tag `name`.
"""
function log_image(lg::TBLogger, name::AbstractString, img::PyPlot.Figure; step=nothing)
    summ = SummaryCollection(image_summary(name, img))
    write_event(lg.file, make_event(lg, summ, step=step))
end

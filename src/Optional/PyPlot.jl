import .PyPlot: PyPlot

function Base.convert(t::Type{PNG}, figure::PyPlot.Figure)
    pb = PipeBuffer()
    show(pb, MIME("image/png"), figure)
    return PNG(pb)
end

preprocess(name, plot::PyPlot.Figure, data) = preprocess(name, convert(PNG, plot), data)
preprocess(name, plots::AbstractArray{<:PyPlot.Figure}, data) = begin
    for (i, plot)=enumerate(plots)
        preprocess(name*"/$i", plot, data)
    end
    return data
end

"""
    log_image(logger, name, plot::Plots.Figure; [step=current_step])

Renders the PyPlots' and sends it to TensorBoard as an image with tag `name`.
"""
log_image(lg::TBLogger, name::AbstractString, img::PyPlot.Figure; step=nothing) =
    log_keyval(lg, name, img, step)

log_image(lg::TBLogger, name::AbstractString, img::AbstractArray{<:PyPlot.Figure}; step=nothing) =
    log_keyval(lg, name, img, step)

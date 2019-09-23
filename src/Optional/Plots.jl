import .Plots: Plots

function Base.convert(t::Type{PNG}, plot::Plots.Plot)
    pb = PipeBuffer()
    show(pb, MIME("image/png"), plot)
    return PNG(pb)
end

preprocess(name, plot::Plots.Plot, data) = preprocess(name, convert(PNG, plot), data)
preprocess(name, plots::AbstractArray{<:Plots.Plot}, data) = begin
    for (i, plot)=enumerate(plots)
        preprocess(name*"/$i", plot, data)
    end
    return data
end


"""
    log_image(logger, name, plot::Plots.Plot; [step=current_step])

Renders the Plots' and sends it to TensorBoard as an image with tag `name`.
"""
log_image(lg::TBLogger, name::AbstractString, img::Plots.Plot; step=nothing) =
    log_keyval(lg, name, img, step)

log_image(lg::TBLogger, name::AbstractString, img::AbstractArray{<:Plots.Plot}; step=nothing) =
    log_keyval(lg, name, img, step)

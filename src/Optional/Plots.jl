import .Plots: Plots

function Base.convert(t::Type{PngImage}, plot::Plots.Plot)
    pb = PipeBuffer()
    show(pb, MIME("image/png"), plot)
    return PngImage(pb)
end

preprocess(name, plot::Plots.Plot, data) = preprocess(name, convert(PngImage, plot), data)
preprocess(name, plots::AbstractArray{<:Plots.Plot}, data) = begin
    for (i, plot)=enumerate(plots)
        preprocess(name*"/$i", plot, data)
    end
    return data
end

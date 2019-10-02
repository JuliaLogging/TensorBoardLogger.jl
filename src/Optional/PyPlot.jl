import .PyPlot: PyPlot

function Base.convert(t::Type{PngImage}, figure::PyPlot.Figure)
    pb = PipeBuffer()
    show(pb, MIME("image/png"), figure)
    return PngImage(pb)
end

preprocess(name, plot::PyPlot.Figure, data) = preprocess(name, convert(PngImage, plot), data)
preprocess(name, plots::AbstractArray{<:PyPlot.Figure}, data) = begin
    for (i, plot)=enumerate(plots)
        preprocess(name*"/$i", plot, data)
    end
    return data
end

import .CairoMakie: Figure

function Base.convert(t::Type{PngImage}, plot::CairoMakie.Figure)
    pb = PipeBuffer()
    show(pb, MIME("image/png"), plot)
    return PngImage(pb)
end

preprocess(name, plot::CairoMakie.Figure, data) = preprocess(name, convert(PngImage, plot), data)
preprocess(name, plots::AbstractArray{<:CairoMakie.Figure}, data) = begin
    for (i, plot)=enumerate(plots)
        preprocess(name*"/$i", plot, data)
    end
    return data
end

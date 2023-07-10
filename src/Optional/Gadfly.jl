import .Gadfly: Plot, render, draw
function Base.convert(t::Type{PngImage}, plot::Gadfly.Plot)
    pb = PipeBuffer();
    show(pb, MIME("image/png"), render(plot));
    # draw(Gadfly.PNG(pb), plot); # leaving here for now, does same thing
    return PngImage(pb)
end

preprocess(name, plot::Gadfly.Plot, data) = preprocess(name, convert(PngImage, plot), data)
preprocess(name, plots::AbstractArray{<:Gadfly.Plot}, data) = begin
    for (i, plot)=enumerate(plots)
        preprocess(name*"/$i", plot, data)
    end
    return data
end
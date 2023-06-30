using .tensorboard: HistogramProto

"""
    log_histogram(logger, name, (bins,weights); step=step(logger))

Logs a histogram under the tag `name` on given `step`. The histogram must be
passed as a tuple holding the `N+1` bin edges and the height of the `N` bins.

You can also pass the raw data, and a binning algorithm from `StatsBase.jl` will
be used to bin the data.
"""
function log_histogram(logger::TBLogger, name::AbstractString, (bins,weights)::Tuple{AbstractVector, AbstractArray};
                       step=nothing)
    weights = collect(vec(weights))
    hist = fit(Histogram, weights, bins)
    summ = SummaryCollection(histogram_summary(name, hist))
    write_event(logger.file, make_event(logger, summ, step=step))
end

"""
    log_histogram(logger, name, data::Vector; step=step(logger))

Bins the values found in `data` and logs them as an histogram under the tag
`name`.
"""
function log_histogram(logger::TBLogger, name::AbstractString, data::AbstractArray;
                       step=nothing)
    data = collect(vec(data))
    hist = fit(Histogram, data)
    summ = SummaryCollection(histogram_summary(name, hist))
    write_event(logger.file, make_event(logger, summ, step=step))
end

function histogram_summary(name::AbstractString, hist::Histogram{T,1}) where T
    edges     = first(hist.edges)
    hist_vals = hist.weights
    num = length(hist_vals)
    histsum = sum(hist_vals)
    histsumsqr = sum(hist_vals.^2) 
    hp = HistogramProto(first(edges), last(edges),
                        num,
                        histsum,
                        histsumsqr,
                        collect(edges[2:end]),
                        hist_vals)
    return Summary_Value(name, name, nothing, OneOf(:histo, hp))
end

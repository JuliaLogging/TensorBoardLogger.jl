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
    summ = SummaryCollection(histogram_summary(name, collect(bins), weights))
    write_event(logger.file, make_event(logger, summ, step=step))
end

"""
    log_histogram(logger, name, data::Vector; step=step(logger))

Bins the values found in `data` and logs them as an histogram under the tag
`name`.
"""
function log_histogram(logger::TBLogger, name::AbstractString, data::AbstractArray;
                       step=nothing)
    data = vec(data)
    hvals = fit(Histogram, data)
    summ = SummaryCollection(histogram_summary(name, collect(hvals.edges[1]), hvals.weights))
    write_event(logger.file, make_event(logger, summ, step=step))
end

"""
    log_vector(logger, name, data::Vector; step=step(logger))

Logs the vector found in `data` as an histogram under the name `name`.
"""
function log_vector(logger::TBLogger, name::AbstractString, data::AbstractVector; step=nothing)
    summ = SummaryCollection(histogram_summary(name, collect(0:length(data)),data))
    write_event(logger.file, make_event(logger, summ, step=step))
end

function histogram_summary(name::AbstractString, edges::AbstractVector{<:Number}, hist_vals::AbstractVector{<:Number})
    @assert length(edges) == length(hist_vals)+1
    return histogram_summary(name, Histogram(edges, hist_vals))
end

function histogram_summary(name::AbstractString, hist::Histogram{T,1}) where T
    edges     = first(hist.edges)
    hist_vals = hist.weights

    hp = HistogramProto(min=first(edges), max=last(edges),
                        bucket_limit=collect(edges[2:end]),
                        bucket=hist_vals)
    return Summary_Value(tag=name, histo=hp)
end

# Writes to an Histogram summary the flattened version of the array.
# Also stores the shape of the array as a field in a plugin, which allows to
# reconstruct the original shape when read back into Julia
function histogram_arr_summary(name::AbstractString, tensor::AbstractArray)

    smpd = SummaryMetadata_PluginData(plugin_name=TB_PLUGIN_JLARRAY_NAME,
                    content=reinterpret(UInt8, collect(size(tensor))))
    sm = SummaryMetadata(plugin_data=smpd)


    edges = collect(0:length(tensor))
    hp = HistogramProto(min=minimum(edges), max=maximum(edges),
                        bucket_limit=edges[2:end],
                        bucket=vec(tensor))

    return Summary_Value(tag=name, histo=hp, metadata=sm)
end

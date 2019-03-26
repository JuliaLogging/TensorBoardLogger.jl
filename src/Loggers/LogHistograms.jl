
"""
    log_histogram(logger, name, (bins,weights); step)

Logs a histogram under the tag `name` on given `step`. The histogram must be
passed as a tuple holding the `N+1` bin edges and the height of the `N` bins.

You can also pass the raw data, and a binning algorithm from `StatsBase.jl` will
be used to bin the data.
"""
function log_histogram(logger::TBLogger, name::String, (bins,weights)::Tuple{Vector,Vector};
                       step=nothing)
    summ    = SummaryCollection()
    push!(summ.value,  histogram_summary(name, bins, weights))
    write_event(logger.file, make_event(logger, summ, step=step))
end

"""
    log_histogram(logger, name, data::Vector; step)

Bins the values found in `data` and logs them as an histogram under the tag
`name`.
"""
function log_histogram(logger::TBLogger, name::String, data::Vector;
                       step=nothing)
    summ    = SummaryCollection()
    hvals = fit(Histogram, data)
    push!(summ.value, histogram_summary(name, collect(hvals.edges[1]), hvals.weights))
    write_event(logger.file, make_event(logger, summ, step=step))
end

"""
    log_vector(logger, name, data::Vector; step)

Logs the vector found in `data` as an histogram under the name `name`.
"""
function log_vector(logger::TBLogger, name::String, data::Vector; step=nothing)
    summ    = SummaryCollection()
    push!(summ.value, histogram_summary(name, collect(0:length(data)),data))
    write_event(logger.file, make_event(logger, summ, step))
end

function histogram_summary(name::String, edges::Vector{T1}, hist_vals::Vector{T2}) where {T1<:Number, T2<:Number}
    @assert length(edges) == length(hist_vals)+1

    hp = HistogramProto(min=minimum(edges), max=maximum(edges),
                        bucket_limit=Vector{Float64}(),
                        bucket=Vector{Float64}())
    for val=edges[2:end]
        push!(hp.bucket_limit, val)
    end
    for val=hist_vals
        push!(hp.bucket, val)
    end

    Summary_Value(tag=name, histo=hp)
end

## Backward compatibility
log_histogram(logger, name, value, step) =
    log_histogram(logger, name, value; step=step)


# Forward
preprocess(name, val::AbstractVector, data) where T<:Complex = push!(data, name*"/re"=>real.(val), name*"/im"=>imag.(val))
preprocess(name, val::AbstractArray, data) = push!(data, name=>vec(val))

loggable(::AbstractVector{T}) where T<:Real = true
summary_impl(name, val::AbstractVector) = histogram_summary(name, collect(0:length(val)),val)

loggable(::Tuple{Vector,Vector}) = true
summary_impl(name, (bins,weights)::Tuple{Vector,Vector}) = histogram_summary(name, bins, weights)

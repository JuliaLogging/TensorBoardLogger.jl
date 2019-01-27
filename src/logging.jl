# Create summary for Summary_value (default constructor by
# protobuf is broken).
const SummaryCollection(;kwargs...) = Summary(value=Base.Vector{Summary_Value}(); kwargs...)

"""
    log_value(logger, name, value, step)

Logs a Floating-point variable with name `name` at step `step`
"""
function log_value(logger::Logger, name::String, value::Float64, step::Int64)
    summ    = SummaryCollection()
    push!(summ.value, scalar_summary(name, value))
    write_event(logger.file, make_event(logger, summ, step))
end

function log_value(logger::Logger, name::String, value::ComplexF64, step::Int64)
    log_value(logger, name*"_re", real(value), step)
    log_value(logger, name*"_im", imag(value), step)
end

function scalar_summary(name::String, value::Float64)
    Summary_Value(tag=name, simple_value=value)
end


"""Log a histogram for given name on given step.
Args:
    name (str): name of the variable (it will be converted to a valid
        tensorflow summary name).
    value (tuple or list): either list of numbers
        to be summarized as a histogram, or a tuple of bin_edges and
        bincounts that directly define a histogram.
    step (int): non-negative integer used for visualization
"""
function log_histogram(logger::Logger, name::String, data, step::Int64)
    summ    = SummaryCollection()
    push!(summ.value, histogram_summary(name, data))
    write_event(logger.file, make_event(logger, summ, step))
end

function log_vector(logger::Logger, name::String, data::Vector, step::Int64)
    summ    = SummaryCollection()
    push!(summ.value, histogram_summary(name, (collect(0:length(data)),data)))
    write_event(logger.file, make_event(logger, summ, step))
end

function histogram_summary(name::String, data::Tuple{Array{T}, Array{T}}) where {T<:Number}
    edges = first(data)
    hist_vals = last(data)
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


function make_event(logger::Logger, summary::Summary, step)
    Event(wall_time=time(), summary=summary, step=step)
end

function write_event(file::IOStream, event::Event)
    data = PipeBuffer();
    writeproto(data, event)

    #header
    header     = collect(reinterpret(UInt8, [data.size]))
    crc_header = reinterpret(UInt8, UInt32[masked_crc32c(header)])
    crc_data   = reinterpret(UInt8, UInt32[masked_crc32c(data.data)])

    write(file, header)
    write(file, crc_header)
    write(file, data.data)
    write(file, crc_data)
    flush(file)
end

write_event(logger::Logger, event::Event) = write_event(logger.file, event)

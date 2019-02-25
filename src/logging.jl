# Create summary for Summary_value (default constructor by
# protobuf is broken).
const SummaryCollection(;kwargs...) = Summary(value=Base.Vector{Summary_Value}(); kwargs...)

function make_event(logger::Logger, summary::Summary;
                    step::Union{Nothing, Int}=nothing)
    # If the step is not set explicitly, get it from the logger
    if typeof(step) == Nothing
        step = iteration(logger)
    end
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

# Create summary for Summary_value (default constructor by
# protobuf is broken).
SummaryCollection(;kwargs...) = Summary(value=Vector{Summary_Value}(); kwargs...)
SummaryCollection(summaries::Vector{Summary_Value}; kwargs...) = Summary(value=summaries; kwargs...)
SummaryCollection(summary::Summary_Value; kwargs...) = Summary(value=[summary]; kwargs...)

function make_event(logger::TBLogger, summary::Summary;
                    step::Int=TensorBoardLogger.step(logger))
    return Event(wall_time=time(), summary=summary, step=step)
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

write_event(logger::TBLogger, event::Event) = write_event(logger.file, event)

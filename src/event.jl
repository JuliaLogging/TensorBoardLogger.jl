# Create summary for Summary_value (default constructor by
# protobuf is broken).
SummaryCollection(;kwargs...) = Summary(value=Vector{Summary_Value}(); kwargs...)
SummaryCollection(summaries::Vector{Summary_Value}; kwargs...) = Summary(value=summaries; kwargs...)
SummaryCollection(summary::Summary_Value; kwargs...) = Summary(value=[summary]; kwargs...)
SummaryCollection(summary::GraphDef; kwargs...) = summary

make_event(logger::TBLogger, summary::Summary; step::Int=TensorBoardLogger.step(logger)) = Event(wall_time=time(), summary=summary, step=step)
make_event(logger::TBLogger, summary::GraphDef; step::Int=TensorBoardLogger.step(logger)) = Event(wall_time=time(), graph_def=serialize_proto(summary), step=step)

"""
    write_event(out::IOStream, event::Event)

Serializes the Event `event` to the `out` stream according to the TensorBoard
format. The format follows the following rule (in bytes)

#1 0...8       Int64   size of serialized `event`
#2 9...15      UInt32  masked_CRC of #1
#3 16...N        -     serialized `event` as protobuffer
#4 N..N+8      UInt32  masked_CRC of #3
"""
function write_event(out::IOStream, event::Event)
    data = PipeBuffer();
    writeproto(data, event)

    #header
    header     = collect(reinterpret(UInt8, [data.size]))
    crc_header = reinterpret(UInt8, UInt32[masked_crc32c(header)])
    crc_data   = reinterpret(UInt8, UInt32[masked_crc32c(data.data)])

    write(out, header)
    write(out, crc_header)
    write(out, data.data)
    write(out, crc_data)
    flush(out)
end

write_event(logger::TBLogger, event::Event) = write_event(logger.file, event)

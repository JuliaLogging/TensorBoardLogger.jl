# Create summary for Summary_value (default constructor by
# protobuf is broken).
SummaryCollection(;kwargs...) = Summary(Vector{Summary_Value}(); kwargs...)
SummaryCollection(summaries::Vector{Summary_Value}; kwargs...) = Summary(summaries; kwargs...)
SummaryCollection(summary::Summary_Value; kwargs...) = Summary([summary]; kwargs...)
SummaryCollection(summary::GraphDef; kwargs...) = summary

# TODO Clean up this nothing crazyness
function make_event(logger::TBLogger, summary::Summary; step=TensorBoardLogger.step(logger))
    step = typeof(step) == Nothing ?  TensorBoardLogger.step(logger) : step
    source_metadata=Ref{Union{Nothing, SourceMetadata}}(nothing)
    return Event(time(), step, OneOf(:summary, summary), source_metadata[])
end
function make_event(logger::TBLogger, summary::GraphDef; step=TensorBoardLogger.step(logger))
    step = typeof(step) == Nothing ?  TensorBoardLogger.step(logger) : step
    source_metadata=Ref{Union{Nothing, SourceMetadata}}(nothing)
    Event(time(), step, OneOf(:graph_def, serialize_proto(summary)), source_metadata[])
end

"""
    write_event(out::IO, event::Event)

Serializes the Event `event` to the `out` stream according to the TensorBoard
format. The format follows the following rule (in bytes)

#1 0...8       Int64   size of serialized `event`
#2 9...15      UInt32  masked_CRC of #1
#3 16...N        -     serialized `event` as protobuffer
#4 N..N+8      UInt32  masked_CRC of #3
"""
function write_event(out::IO, event::Event)
    event_bytes = serialize_proto(event)

    #header
    header     = collect(reinterpret(UInt8, [length(event_bytes)]))
    crc_header = reinterpret(UInt8, UInt32[masked_crc32c(header)])
    crc_data   = reinterpret(UInt8, UInt32[masked_crc32c(event_bytes)])

    write(out, header)
    write(out, crc_header)
    write(out, event_bytes)
    write(out, crc_data)
    flush(out)
end

write_event(logger::TBLogger, event::Event) = write_event(logger.file, event)

export summary_iterator

"""
    read_event(f::IOStream) => Event

Reads the stream `f`, assuming it's encoded according to TensorBoard format,
and decodes a single event.
This function assumes that `eof(f) == false`.
"""
function read_event(f::IOStream)
    header = read(f, 8)
    crc_header = read(f, 4)

    # check
    crc_header_ck = reinterpret(UInt8, UInt32[masked_crc32c(header)])
    @assert crc_header == crc_header_ck

    # read data
    data_len = first(reinterpret(Int64, header))
    data = read(f, data_len)
    crc_data = read(f, 4)

    # check
    crc_data_ck = reinterpret(UInt8, UInt32[masked_crc32c(data)])
    @assert crc_data == crc_data_ck

    pb = PipeBuffer(data)
    ev = readproto(pb, Event())
    return ev
end


struct TBEventFileCollectionIterator
    dir::String
    files::Vector
end

function Base.iterate(it::TBEventFileCollectionIterator, state=1)
    state > length(it.files) && return nothing
    fstream = open(joinpath(it.dir, it.files[state]))

    purge_step = typemax(Int) # default value (no purging)
    # If there is a logfile after this one, read the first event and check
    # if we should purge some steps.
    if state+1 <= length(it.files)
        for ev=TBEventFileIterator(open(joinpath(it.dir,it.files[state+1])))
            if ev.step != 0
                purge_step = ev.step
            end
            break
        end
    end

    return TBEventFileIterator(fstream, purge_step), state+1
end

"""
    TBEventFileIterator(fstream)

Iterator for iterating along a fstream
"""
struct TBEventFileIterator
    fstream::IOStream
    stop_at_step::Int
end
TBEventFileIterator(fstream) = TBEventFileIterator(fstream, typemax(Int))

function Base.iterate(it::TBEventFileIterator, state=0)
    eof(it.fstream) && return nothing
    ev=read_event(it.fstream)
    ev.step >= it.stop_at_step && @info "stopping!!!!!"
    ev.step >= it.stop_at_step && return nothing

    return ev, state+1
end

"""
    iterate(evs::Summary, state=1)

Iterate along all summaries stored inside an event, automatically decoding the
data stored inside of each summary.
"""
function Base.iterate(evs::Summary, state=1)
    # if ev.summary is not defined, don't bother processing this event, as it's
    # probably a "start file" event or a graph event.
    summaries = evs.value

    state > length(summaries) && return nothing
    summary = summaries[state]

    tag = summary.tag

    if isdefined(summary, :histo)
        val = decode_histogram(summary.audio)
    elseif isdefined(summary, :image)
        val = decode_image(summary.image)
    elseif isdefined(summary, :audio)
        val = decode_audio(summary.audio)
    elseif isdefined(summary, :simple_value)
        val = summary.simple_value
    else
        @error "Event with unknown field $summary"
    end
    return (tag, val), state+1
end


summary_iterator(tb::TBLogger) = summary_iterator(logdir(tb_logger))

function summary_iterator(path::String)
    coll = TBEventFileCollectionIterator(path,sort(readdir(path)))
    return coll
end

function decode_histogram(histo)
    # check if it's a vectorized array

end

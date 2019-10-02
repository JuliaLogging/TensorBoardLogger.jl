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

"""
    TBEventFileCollectionIterator(path; purge=true)

Iterate along all event-files in the folder `path`.
When the keyword argument `purge==true`, if the i+1-th file begins with a purge
at step `s`, the i-th file is read only up to step `s`.
"""
struct TBEventFileCollectionIterator
    dir::String
    files::Vector

    purge::Bool
end
TBEventFileCollectionIterator(path; purge=true) =
    TBEventFileCollectionIterator(path, sort(readdir(path)), purge)

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
    TBEventFileIterator(fstream, stop_at_step=∞)

Iterator for iterating along a fstream.
The optional argument `stop_at_step` tells at what step the iterator should stop.
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

Iterate along all summaries stored inside an event, automatically returning the
correct value (histogram, audio, image or scalar).
"""
function Base.iterate(evs::Summary, state=1)
    # if ev.summary is not defined, don't bother processing this event, as it's
    # probably a "start file" event or a graph event.
    summaries = evs.value

    state > length(summaries) && return nothing
    summary = summaries[state]

    tag = summary.tag

    if isdefined(summary, :histo)
        val = summary.histo
    elseif isdefined(summary, :image)
        val = summary.image
    elseif isdefined(summary, :audio)
        val = summary.audio
    elseif isdefined(summary, :simple_value)
        val = summary.simple_value
    else
        @error "Event with unknown field" summary=summary
    end
    return (tag, val), state+1
end

"""
    map_summaries(fun, path; purge=true)

Maps the function `fun(name, value)` on all the values logged to the folder
at `path`. The function is called sequentially, starting from the first
event till the last.

When the keyword argument `purge==true`, if the i+1-th file begins with a purge
at step `s`, the i-th file is read only up to step `s`.

`fun` should take 2 arguments:
    - a String representing the name/tag of the logged value
    - a value, which can be of the following types:
        - Float32
        - HistogramProto (containing bin edges and values)
        - Summary_Audio  (containing a serialized WAV clip)
        - Summary_Image  (containing a serialized PNG image)
"""
function map_summaries(fun::Function, folder_path::String; purge=true)
    for event_file in TBEventFileCollectionIterator(folder_path, purge=purge)
        for event in event_file
            !isdefined(event, :summary) && continue
            for (name, val) in event.summary
                fun(name, val)
            end
        end
    end
end


"""
    map_summaries(fun, path; purge=true)

Maps the function `fun(event)` on all the event logged to the folder
at `path`. The function is called sequentially, starting from the first
event till the last.

When the keyword argument `purge==true`, if the i+1-th file begins with a purge
at step `s`, the i-th file is read only up to step `s`.

Also metadata events, without any real data attached are mapped.
You can detect those by `isdefined(event, :summary) == false`
"""
function map_events(fun::Function, folder_path::String)
    for event_file in TBEventFileCollectionIterator(folder_path)
        for event in event_file
            fun(event)
        end
    end
end

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
    files::Vector{String}

    purge::Bool
end
TBEventFileCollectionIterator(path; purge=true) =
    TBEventFileCollectionIterator(path, sort(readdir(path)), purge)

TBEventFileCollectionIterator(logger::TBLogger; purge=true) =
    TBEventFileCollectionIterator(logdir(logger), purge=true)

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
    summaries = evs.value

    state > length(summaries) && return nothing
    summary = summaries[state]

    tag = summary.tag
    Δ_state = 0

    if isdefined(summary, :histo)
        val = deserialize_histogram_summary(summary)
        tag, val, Δ_state = lookahead_deserialize(tag, val, evs, state+1, :histo)
    elseif isdefined(summary, :image)
        val = deserialize_image_summary(summary)
        tag, val, Δ_state = lookahead_deserialize(tag, val, evs, state+1, :image)
    elseif isdefined(summary, :audio)
        val = deserialize_audio_summary(summary)
    elseif isdefined(summary, :tensor)
        val = deserialize_tensor_summary(summary)
    elseif isdefined(summary, :simple_value)
        val = summary.simple_value
        tag, val, Δ_state = lookahead_deserialize(tag, val, evs, state+1, :simple_value)
    else
        @error "Event with unknown field" summary=summary
    end
    return (tag, val), state + Δ_state + 1
end

"""
    lookahead_deserialize(old_tag, old_val, summaries, state, type)

Looks ahead at state, and checks that the tag of `state` matches `old_tag`, and
if so, attempts to combine the value of `state` with that of `old_val`.

For example, if `old_tag = "someval/re"` then if `state` contains "someval/im" the
two values will be combined as real and immaginary part.

Returns a possibly modified tag, a possibily modified value, and the number
of states that it has looked ahead.
If the lookahead fails to find matching states, he returns (old_tag, old_val, 0)
"""
function lookahead_deserialize(old_tag, old_val, evs::Summary, state, type)
    result = old_tag, old_val, 0
    summaries = evs.value

    state > length(summaries) && return result
    summary = summaries[state]

    tag = summary.tag

    if type == :histo && isdefined(summary, :histo)
        if tags_match_re_im(old_tag, tag)
            val_im = deserialize_histogram_summary(summary)
            result = tag[1:end-3], old_val + im*val_im, 1
        end
    elseif isdefined(summary, :image)
        nothing
    elseif isdefined(summary, :audio)
        nothing
    elseif isdefined(summary, :tensor)
        nothing
    elseif type == :simple_value
        if tags_match_re_im(old_tag, tag)
            val_im = summary.simple_value
            result = tag[1:end-3], old_val + im*val_im, 1
        end
    end

    return result
end

"""
    tags_match_re_im(old_tag, new_tag)

If `old_tag` and `new_tag` tag the real part and imaginary part of the same
quantity, such as `old_tag = "test/struct/re"` and `new_tag = "test/struct/im"`
then returns true. False otherwise
"""
function tags_match_re_im(old_tag, new_tag)
    if old_tag[end-2:end] == "/re"
        old_tag_parts = split(old_tag, "/")
        new_tag_parts = split(new_tag, "/")
        if ( all(old_tag_parts[1:end-1] .== new_tag_parts[1:end-1]) &&
            new_tag_parts[end] == "im" )
            return true
        end
    end
    return false
end

"""
    map_summaries(fun, path; purge=true, tags=all, steps=all)

Maps the function `fun(name, value)` on all the values logged to the folder
at `path`. The function is called sequentially, starting from the first
event till the last.

When the keyword argument `purge==true`, if the i+1-th file begins with a purge
at step `s`, the i-th file is read only up to step `s`.

`fun` should take 3 arguments:
    (1) a String representing the name/tag of the logged value
    (2) an Integer, representing the step number
    (3) a value, which can be of the following types:

Optional kwargs `tags` takes as input a collection of Strings, and will only
iterate across tags summaries with a tag in that collection.

Optional kwargs `steps` takes as input a collection of integers, and will
only iterate across events with step within that collection.
"""
function map_summaries(fun::Function, logdir; purge=true, tags=nothing, steps=nothing)
    if tags isa AbstractString
        s = Set{typeof(tags)}()
        push!(s, tags)
        tags = s
    end

    for event_file in TBEventFileCollectionIterator(logdir, purge=purge)
        for event in event_file
            # if event.summary is not defined, don't bother processing this event,
            # as it's probably a "start file" event or a graph event.
            !isdefined(event, :summary) && continue

            step = event.step
            !isnothing(steps) && step ∉ steps && continue

            for (name, val) in event.summary
                !isnothing(tags) && name ∉ tags && continue

                fun(name, step, val)
            end
        end
    end
end


"""
    map_summaries(fun, path; purge=true, steps=all)

Maps the function `fun(event)` on all the event logged to the folder
at `path`. The function is called sequentially, starting from the first
event till the last.

When the keyword argument `purge==true`, if the i+1-th file begins with a purge
at step `s`, the i-th file is read only up to step `s`.

Also metadata events, without any real data attached are mapped.
You can detect those by `isdefined(event, :summary) == false`

Optional kwargs `steps` takes as input a collection of integers, and will
only iterate across events with step within that collection.
"""
function map_events(fun::Function, logdir; purge=true, steps=nothing)
    for event_file in TBEventFileCollectionIterator(logdir, purge=purge)
        for event in event_file
            step = event.step
            !isnothing(steps) && step ∈ steps

            fun(event)
        end
    end
end

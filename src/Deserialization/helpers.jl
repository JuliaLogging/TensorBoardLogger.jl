"""
    tags(logger)

Returns a set of all the strings used as tags in messages serialized by
`logger`.

`logger` can be a `TBLogger` or the path of a valid TensorBoard logdir.
"""
function tags(tbl; kwargs...)
    tags = Set{String}()

    map_summaries(tbl; kwargs...) do tag, iter, val
        push!(tags, tag)
    end

    return tags
end

"""
    steps(logger)

Returns a set of all the steps used as tags in messages serialized by
`logger`.

`logger` can be a `TBLogger` or the path of a valid TensorBoard logdir.
"""
function steps(tbl; kwargs...)
    steps = BitSet()

    map_events(tbl; kwargs...) do ev
        push!(steps, ev.step)
    end

    return steps
end

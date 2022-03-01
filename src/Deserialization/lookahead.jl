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
    lookahead_deserialize(old_tag, old_val, summaries, state, type)

Looks ahead at state, and checks that the tag of `state` matches `old_tag`, and
if so, attempts to combine the value of `state` with that of `old_val`.

For example, if `old_tag = "someval/re"` then if `state` contains "someval/im" the
two values will be combined as real and immaginary part.

Returns a possibly modified tag, a possibily modified value, and the number
of states that it has looked ahead.
If the lookahead fails to find matching states, he returns (old_tag, old_val, 0)
"""
function lookahead_deserialize(old_tag, old_val, evs::Summary, state, typ)
    res = old_tag, old_val, state

    if typ == :histo
        res = lookahead_deserialize_histogram_summary(old_tag, old_val, evs, state)
    elseif typ === :image
        res = lookahead_deserialize_image_summary(old_tag, old_val, evs, state)
    elseif typ == :simple_value
        res = lookahead_deserialize_simple_value_summary(old_tag, old_val, evs, state)
    end

    return res
end

# Lookahead for simple values.
# Checks the next entry if it is /re and /im, and combines them
function lookahead_deserialize_simple_value_summary(old_tag, old_val, evs::Summary,
                                                 state)
    # prepare the default output (when no action is taken)
    result = old_tag, old_val, state
    # iterate to the next element
    res = iterate(evs, state + 1)
    res == nothing && return result

    # if the next event is identified, check its type
    (new_tag, summary), i_state = res
    typ = summary_type(summary)

    # if types match, check tags. If they match, return modified structure
    if typ === :simple_value && tags_match_re_im(old_tag, new_tag)
        val_im = summary.simple_value
        result = new_tag[1:end-3], old_val + im*val_im, i_state - 1
    else
        return result
    end
end

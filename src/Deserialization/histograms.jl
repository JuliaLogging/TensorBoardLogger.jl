function deserialize_histogram_summary(summary)
    # custom deserialization
    if isdefined(summary, :metadata)
        if summary.metadata.plugin_data.plugin_name == TB_PLUGIN_JLARRAY_NAME
            val = reshape(summary.histo.bucket,
                          reinterpret(Int,
                                      summary.metadata.plugin_data.content)...)
        else
            val = summary.histo
        end
    else
        val = summary.histo
    end

    return val
end

# Lookahead for histograms .
# Checks the next entry if it is /re and /im, and combines them
function lookahead_deserialize_histogram_summary(old_tag, old_val, evs::Summary,
                                                 state)
    # prepare the default output (when no action is taken)
    result = old_tag, old_val, state
    # iterate to the next element
    res = iterate(evs, state + 1)
    res == nothing && return result

    # if the next event is identified, check it's type
    (new_tag, summary), i_state = res
    typ = summary_type(summary)

    # if types match, check tags. If they match, return modified structure
    if typ === :histo && tags_match_re_im(old_tag, new_tag)
        val_im = deserialize_histogram_summary(summary)
        result = new_tag[1:end-3], old_val + im*val_im, i_state - 1
    else
        return result
    end
end

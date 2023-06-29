function deserialize_histogram_summary(summary::Summary_Value)
    # custom deserialization
    if hasproperty(summary, :metadata)
        histo = summary.value.value
        if summary.metadata.plugin_data.plugin_name == TB_PLUGIN_JLARRAY_NAME
            val = reshape(histo.bucket,
                          reinterpret(Int,
                                      summary.metadata.plugin_data.content)...)

            return val
        end
    end

    # deserialize histogramproto
    hist_proto = summary.value.value
    bin_edges = similar(hist_proto.bucket_limit, length(hist_proto.bucket_limit)+1)
    bin_edges[1] = hist_proto.min
    bin_edges[2:end] .= hist_proto.bucket_limit

    return Histogram(bin_edges, hist_proto.bucket)
end

# Lookahead for histograms .
# Checks the next entry if it is /re and /im, and combines them
function lookahead_deserialize_histogram_summary(old_tag, old_val, evs::Summary,
                                                 state)
    # prepare the default output (when no action is taken)
    result = old_tag, old_val, state
    # iterate to the next element
    res = iterate(evs, state + 1)
    res isa Nothing && return result

    # if the next event is identified, check its type
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

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

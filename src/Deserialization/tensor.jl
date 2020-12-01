using .tensorboard: TextPluginData

function deserialize_tensor_summary(summary)
    metadata    = summary.metadata
    plugin_data = metadata.plugin_data

    plugin_name = plugin_data.plugin_name

    dim_szs, dim_nms = deserialize_tensor_shape(summary.tensor)

    if plugin_name == "text"
        val = deserialize_text_tensor(summary, dim_szs, dim_nms)
    end
    return val
end

function deserialize_text_tensor(summary, sizes, names)
    version_data = readproto(PipeBuffer(summary.metadata.plugin_data.content),
                             TextPluginData())
    tensor = summary.tensor
    strings = Array{String, length(sizes)}(undef, sizes...)

    # Ignore dimension names
    if version_data.version == 0
        for (i, in) = enumerate(tensor.string_val)
            #TODO should undo `markdown_repr`, because all strings
            # will be displayed with a starting and ending \"
            strings[i] = String(in)
            delimiter = '\"'
            if delimiter === first(strings[i]) === last(strings[i])
                strings[i] = strings[i][2:end-1]
            end
        end
    else
        @warn "Unknown string version $(version_data.version)"
    end

    return strings
end

function deserialize_tensor_shape(tensor)
    t_shape = tensor.tensor_shape

    dim_names = Union{String,Nothing}[]
    dim_sz    = Int[]
    for dim = t_shape.dim
        push!(dim_sz, dim.size)
        isempty(dim.name) ? push!(dim_names, nothing) : push!(dim_names, dim.name)
    end

    return tuple(dim_sz...), tuple(dim_names...)
end

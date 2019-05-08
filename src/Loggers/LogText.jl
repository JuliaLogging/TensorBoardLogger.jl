"""
    log_text(logger, name, text, step)

Logs text with name `name` at step `step`
"""
function log_text(logger::TBLogger, name::String, text::Any; step=nothing)
    summ = SummaryCollection()
    push!(summ.value, text_summary(name, text))
    write_event(logger.file, make_event(logger, summ, step=step))
end

function text_summary(name::String, text::Any)
    text = markdown_repr(text)
    textstringval = [Vector{UInt8}(text)]
    texttensorshape = TensorShapeProto(dim = Vector([TensorShapeProto_Dim(size = 1)]))
    textcontent = serialize_proto(TextPluginData(version = 0))
    plugindata = SummaryMetadata_PluginData(plugin_name = "text", content = textcontent)
    smd = SummaryMetadata(plugin_data = plugindata)
    texttensor = TensorProto(dtype = _DataType.DT_STRING, string_val = textstringval, tensor_shape = texttensorshape)
    return Summary_Value(tag = name, metadata = smd, tensor = texttensor)
end

"""
    markdown_repr(x)

Returns the most suitable method for displaying `x` in a markdown document.
"""
function markdown_repr(x)
    for mime_type in ("text/markdown", "text/html", "text/plain")
        try
            if showable(mime_type, x)
                return repr(mime_type, x)
            end
        catch
            @debug "It said it was showable, but it lied" mime_type x exception=err
            # we blindly catch everything, because who knows what evil
            # people are doing in their misimplemented `repr` functions
        end
    end
    return repr(x)
end


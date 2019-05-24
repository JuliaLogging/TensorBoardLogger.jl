"""
    log_text(logger::TBLogger, name::String, text::Any, step = nothing)

Logs text with name `name` at step `step`
- text: If text is a 2-D or 3-D `Array`, it will be rendered as a table or a list. Any other data will be represented as string
"""
function log_text(logger::TBLogger, name::String, text::Any; step = nothing)
    summ = SummaryCollection(text_summary(name, text))
    write_event(logger.file, make_event(logger, summ, step=step))
end

function text_summary(name::String, text::Any)
    #Create a string tensor
    #shape of the tensor
    dims = Array{TensorShapeProto_Dim, 1}()
    if isa(text, AbstractArray)
        for dim in size(text)
            push!(dims, TensorShapeProto_Dim(size = dim))
        end
    else
        push!(dims, TensorShapeProto_Dim(size = 1))
    end
    texttensorshape = TensorShapeProto(dim = Vector(dims))

    #content of the tensor
    textstringval = Vector{Array{UInt8, 1}}()
    if isa(text, AbstractArray)
        if ndims(text) == 2
            text = permutedims(text, (2, 1))
        end
        for string in text
            string = markdown_repr(string)
            push!(textstringval, Array{UInt8, 1}(string))
        end
    else
        text = markdown_repr(text)
        push!(textstringval, Array{UInt8, 1}(text))
    end
    #metadata for the text
    textcontent = serialize_proto(TextPluginData(version = 0))
    plugindata = SummaryMetadata_PluginData(plugin_name = "text", content = textcontent)
    smd = SummaryMetadata(plugin_data = plugindata)
    #create tensor
    texttensor = TensorProto(dtype = _DataType.DT_STRING, string_val = textstringval, tensor_shape = texttensorshape)
    Summary_Value(tag = name, metadata = smd, tensor = texttensor)
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

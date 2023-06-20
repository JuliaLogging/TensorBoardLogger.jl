using .tensorboard_plugin_text: TextPluginData
using .tensorboard: DataClass

"""
    log_text(logger::TBLogger, name::String, text::Any; step=step(logger))

Logs text with name `name` at step `step`
- text: If text is a 2-D or 3-D `Array`, it will be rendered as a table or a list. Any other data will be represented as string
"""
function log_text(logger::TBLogger, name::String, text::Any; step = nothing)
    summ = SummaryCollection(text_summary(name, text))
    write_event(logger.file, make_event(logger, summ, step=step))
end

"""
    construct_tensor_dims(data) -> TensorShapeProto_Dim

Constructs the `TensorShapeProto_Dim` protobuffer holding the size (and eventually
name) of a single dimension of a tensor/array.

If you define a custom array type, such as AxisArray or named array types,
you should define this method so that you can serialize the name to string.
"""
function construct_tensor_dims(data::AbstractArray)
    dims = Vector{TensorShapeProto_Dim}()
    for dim in size(data)
        push!(dims, TensorShapeProto_Dim(dim, ""))
    end
    return dims
end

construct_tensor_dims(data) = [TensorShapeProto_Dim(1, "")]

function construct_tensor_string_val(data::AbstractArray)
    textstringval = Vector{Vector{UInt8}}()

    if ndims(data) == 2
        text = permutedims(data, (2, 1))
    end

    for string in data
        string = markdown_repr(string)
        push!(textstringval, Vector{UInt8}(string))
    end

    return textstringval
end

construct_tensor_string_val(data) = [Vector{UInt8}(markdown_repr(data))]

function text_summary(name::String, text::Any)
    # Create a string tensor
    textstringval = construct_tensor_string_val(text)

    # Structure holding the shape of the tensor
    dims = construct_tensor_dims(text)
    texttensorshape = TensorShapeProto(dims, false)

    # Metadata for the text
    textcontent = serialize_proto(TextPluginData(0))
    plugindata = SummaryMetadata_PluginData("text", textcontent)
    smd = SummaryMetadata(plugindata, name, "text", DataClass.DATA_CLASS_TENSOR)

    # Create the tensor
    texttensor = TensorProto(_DataType.DT_STRING, 
                             texttensorshape, 
                             Int32(0), 
                             Vector{UInt8}(),
                             Vector{Int32}(),
                             Vector{Float32}(),
                             Vector{Float64}(),
                             Vector{Int32}(),
                             textstringval,
                             Vector{Float32}(),
                             Vector{Int64}(),
                             Vector{Bool}(),
                             Vector{Float64}(),
                             Vector{ResourceHandleProto}(),
                             Vector{VariantTensorDataProto}(),
                             Vector{UInt32}(),
                             Vector{UInt64}(),
                             UInt8[])
    Summary_Value(name, name, smd, OneOf(:tensor, texttensor))
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

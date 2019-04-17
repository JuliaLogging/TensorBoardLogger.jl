"""
    log_text(logger, name, text, step)

Logs text with name `name` at step `step`
"""
function log_text(logger::TBLogger, name::String, text::String; step=nothing)
    summ    = SummaryCollection()
    push!(summ.value, text_summary(name, text))
    write_event(logger.file, make_event(logger, summ, step=step))
end

function text_summary(name::String, text::String)
    texttensorshape = TensorShapeProto(dim = Vector([TensorShapeProto_Dim(size = 1)]))
    textstringval = Vector{Array{UInt8, 1}}()
    push!(textstringval, Array{UInt8, 1}(text))
    pb = PipeBuffer()
    writeproto(pb, TextPluginData(version = 0))
    textcontent = pb.data
    plugindata = SummaryMetadata_PluginData(plugin_name = "text", content = textcontent)
    smd = SummaryMetadata(plugin_data = plugindata)
    texttensor = TensorProto(dtype = _DataType.DT_STRING, string_val = textstringval, tensor_shape = texttensorshape)
    Summary_Value(tag = name, metadata = smd, tensor = texttensor)
end

## Logger Interface

# Define the type(s) that can be serialized to TensorBoard
preprocess(name, val::String, data) where T<:String = push!(data, name=>val)
summary_impl(name, value::String) = text_summary(name, value)

"""
import TensorBoardLogger
using .TensorBoardLogger
using Logging
lg = TBLogger("/home/shashi/testing")
with_logger(lg) do
    @info "StringTest" simple = "HelloWorld"
    @info "ValTest" simple = 26
end

"""

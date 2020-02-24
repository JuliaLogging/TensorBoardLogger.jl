# possible chart types
@enum tb_chart_type tb_multiline=1 tb_margin=2

"""
log_custom_scalar(logger, layout::AbstractDict; step = step(logger))

Groups multiple scalars in the same plot to be visualized by the CUSTOM_SCALARS
plugin. Note that this function sets the metadata: the actual values must be
logged separately with `log_value` and referenced with the correct tag.

The `layout` argument is structured as follows:

layout = Dict(category => Dict(name => (chart_type, [tag1, tag2, ...])))

where `category` is the main tag for the plot, `name` is the plot's name,
`chart_type` is one between `tb_multiline` and `tb_margin` and the array of tags
contains the actual references to the logged scalars.
"""
function log_custom_scalar(logger::TBLogger, layout::AbstractDict; step = nothing)
    summ = SummaryCollection(custom_scalar_summary(layout))
    write_event(logger.file, make_event(logger, summ, step = step))
end

function chart(name::String, metadata::Tuple{tb_chart_type, AbstractArray})
    chart_type, tags = metadata

    if chart_type == tb_multiline
        content = MultilineChartContent(tag = tags)
        return Chart(title = name, multiline = content)
    elseif chart_type == tb_margin
        @assert length(tags) == 3
        args = Dict(k => v for (k, v) in zip([:value, :lower, :upper], tags))
        content = MarginChartContent(
                    series = [MarginChartContent_Series(; args...)])
        return Chart(title = name, margin = content)
    else
        @error "The chart type must be `tb_multiline` or `tb_margin`"
    end
end

function charts(dict::AbstractDict)
    [chart(name, meta) for (name, meta) in zip(keys(dict), values(dict))]
end

function custom_scalar_summary(layout)
    cat_spec = zip(keys(layout), values(layout))
    categories = [Category(title = k, chart = charts(c)) for (k, c) in cat_spec]

    layout = Layout(category = categories)
    plugin_data = SummaryMetadata_PluginData(plugin_name = "custom_scalars")
    smd = SummaryMetadata(plugin_data = plugin_data)
    cs_tensor = TensorProto(dtype = _DataType.DT_STRING,
                            string_val = [serialize_proto(layout)],
                            tensor_shape = TensorShapeProto())

    Summary_Value(tag = "custom_scalars__config__",
                  tensor = cs_tensor,
                  metadata = smd)
end

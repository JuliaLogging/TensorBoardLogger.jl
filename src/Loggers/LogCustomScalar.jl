using .tensorboard_plugin_custom_scalar
using .tensorboard_plugin_custom_scalar: var"MarginChartContent.Series" as MarginChartContent_Series

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
        content = MultilineChartContent(tags)
        return Chart(name, OneOf(:multiline, content))
    elseif chart_type == tb_margin
        @assert length(tags) == 3  # value, lower, upper
        content = MarginChartContent([MarginChartContent_Series(tags...)])
        return Chart(name, OneOf(:margin, content))
    else
        @error "The chart type must be `tb_multiline` or `tb_margin`"
    end
end

function charts(dict::AbstractDict)
    [chart(name, meta) for (name, meta) in zip(keys(dict), values(dict))]
end

function custom_scalar_summary(layout)
    cat_spec = zip(keys(layout), values(layout))
    categories = [Category(title, charts(c), false) for (title, c) in cat_spec]

    layout = Layout(zero(Int32), categories)
    plugin_data = SummaryMetadata_PluginData("custom_scalars", UInt8[])
    smd = SummaryMetadata(plugin_data, "", "", DataClass.DATA_CLASS_UNKNOWN)
    cs_tensor = TensorProto(_DataType.DT_STRING,
                            nothing,
                            zero(Int32),
                            UInt8[],
                            Int32[],
                            Float32[],
                            Float64[],
                            Int32[],
                            [serialize_proto(layout)],
                            Float32[],
                            Int64[],
                            Bool[],
                            Float64[],
                            ResourceHandleProto[],
                            VariantTensorDataProto[],
                            UInt32[],
                            UInt64[],
                            UInt8[])

    Summary_Value("", "custom_scalars__config__", smd, OneOf(:tensor, cs_tensor))
end

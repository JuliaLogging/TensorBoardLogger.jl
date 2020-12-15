using .tensorboard.hparams: HParamsPluginData

"""
    log_hparams(logger::TBLogger, name::String, hparams::Any; step=step(logger))

"""
function log_hparams(logger::TBLogger, name::String, hparams::Any; step = nothing)
    summ = SummaryCollection(hparams_summary(name, hparams))
    write_event(logger.file, make_event(logger, summ, step=step))
end

function hparams_summary(name::String, hparams::TBHyperParams)
    Summary_Value(
        tag = name,
        metadata = SummaryMetadata(
            plugin_data = SummaryMetadata_PluginData(
                plugin_name = "hparams",
                content = serialize_proto(HParamsPluginData(
                    version = hparams.version,
                    experiment = hparams.experiment,
                    session_start_info = hparams.session_start_info,
                    session_end_info = hparams.session_end_info
                ))
            )
        ),
        tensor = TensorProto(dtype = _DataType.DT_FLOAT, tensor_shape = TensorShapeProto(dim=[]))
    )
end


# hparams = TBHyperParams(
#     0,
#     Experiment(
#         name = "exp_name",
#         description = "exp_desc",
#         user = "exp_user",
#         time_created_secs = 1.0,
#         hparam_infos = [
#             HParamInfo(
#                 name = "hparam_info_name",
#                 display_name = "hparam_info_display_name",
#                 description = "hparam_info_description",
#                 _type = 0,  # FIXME: Check this
#                 domain_discrete = ListValue(values=[Value(number_value=0.0)]),  # FIXME: Check this
#                 domain_interval = Interval(
#                     min_value = 0.0,
#                     max_value = 1.2
#                 )
#             )
#         ],
#         metric_infos = [
#             MetricInfo(
#                 name = MetricName(
#                     group = "metric_group",
#                     tag = "metric_tag"
#                 ),
#                 display_name = "metric_info_display_name",
#                 description = "metric_info_description",
#                 dataset_type = 0  # FIXME: Check this
#             )
#         ]
#     ),
#     SessionStartInfo(
#         hparams = Dict("hparam1" => Value(number_value=0.0)),
#         model_uri = "session_start_model_uri",
#         monitor_url = "session_start_monitor_url",
#         group_name = "session_start_group_name",
#         start_time_secs = 1.3
#     ),
#     SessionEndInfo(
#         status = 0,  # FIXME: check this
#         end_time_secs = 4.7
#     )
# )

# sum = hparams_summary("test", hparams)

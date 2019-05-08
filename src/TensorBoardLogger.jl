module TensorBoardLogger
using ProtoBuf
using CRC32c
using StatsBase  #TODO: remove this. Only needed to compute histogram bins.
using Base.CoreLogging: global_logger, LogLevel, Info
import Base.CoreLogging:
    AbstractLogger, handle_message, shouldlog, min_enabled_level,
	catch_exceptions

export log_histogram, log_value, log_vector, log_text
export scalar_summary, histogram_summary, text_summary, make_event
export TBLogger
export reset!, set_step!, increment_step!


# Protobuffer definitions for tensorboard
include("protojl/tensorflow.jl")
include("protojl/tensor_shape_pb.jl")
include("protojl/resource_handle_pb.jl")
include("protojl/tensor_pb.jl")
include("protojl/attr_value_pb.jl")
include("protojl/op_def_pb.jl")
include("protojl/node_def_pb.jl")
include("protojl/function_pb.jl")
include("protojl/versions_pb.jl")
include("protojl/graph_pb.jl")
include("protojl/types_pb.jl")
include("protojl/summary_pb.jl")
include("protojl/event_pb.jl")
include("protojl/plugin_text_pb.jl")

include("TBLogger.jl")
include("utils.jl")  # CRC Utils
include("event.jl")
include("Loggers/LogValue.jl")
include("Loggers/LogText.jl")
include("Loggers/LogHistograms.jl")
include("logger_dispatch.jl")
end # module

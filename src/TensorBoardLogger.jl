module TensorBoardLogger

using ProtoBuf
using CRC32c

#TODO: remove it. Only needed to compute histogram bins.
using StatsBase

# Import Base methods for Logging
using Base.CoreLogging:
    global_logger, LogLevel, Info

import Base.CoreLogging:
    AbstractLogger, handle_message, shouldlog, min_enabled_level,
	catch_exceptions

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
# CRC Utils
include("utils.jl")

# Logging structures
mutable struct TBLogger <: AbstractLogger
    logdir::String
    file::IOStream
    all_files::Dict{String, IOStream}
    global_step::Int

	min_level::LogLevel
end

include("event.jl")
include("Loggers/LogValue.jl")
include("Loggers/LogText.jl")
include("Loggers/LogHistograms.jl")
include("Logger.jl")


export log_histogram, log_value, log_vector, log_text
export scalar_summary, histogram_summary, text_summary, make_event
export TBLogger

export set_tb_logdir, reset_tb_logs, default_logging_session

end # module

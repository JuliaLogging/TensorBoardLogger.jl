module TensorBoardLogger
using ProtoBuf
using CRC32c
using ImageCore
using ColorTypes
using FileIO
using FileIO: @format_str
using StatsBase  #TODO: remove this. Only needed to compute histogram bins.
using Base.CoreLogging: global_logger, LogLevel, Info
import Base.CoreLogging:
    AbstractLogger, handle_message, shouldlog, min_enabled_level,
	catch_exceptions

export log_histogram, log_value, log_vector, log_text, log_image, log_images, log_audio, log_audios
export scalar_summary, histogram_summary, text_summary, make_event
export TBLogger
export reset!, set_step!, increment_step!
export ImageFormat, L, CL, LC, LN, NL, NCL, NLC, CLN, LCN, HW, WH, HWC, WHC, CHW, CWH,HWN, WHN, NHW, NWH, HWCN, WHCN, CHWN, CWHN, NHWC, NWHC, NCHW, NCWH
# Wrapper types
export TBText, TBVector, TBHistogram, TBImage, TBImages, TBAudio, TBAudios

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
include("Loggers/LogImage.jl")
include("Loggers/LogAudio.jl")

include("logger_dispatch.jl")
include("logger_dispatch_overrides.jl")
end # module

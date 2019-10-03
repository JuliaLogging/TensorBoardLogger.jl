module TensorBoardLogger

using ProtoBuf, CRC32c

using ImageCore, ColorTypes
using FileIO: @format_str, Stream, save

using StatsBase  #TODO: remove this. Only needed to compute histogram bins.

using  Base.CoreLogging: CoreLogging, AbstractLogger, LogLevel, Info,
    handle_message, shouldlog, min_enabled_level, catch_exceptions

export TBLogger, reset!, set_step!, increment_step!
export log_histogram, log_value, log_vector, log_text, log_image, log_images,
       log_audio, log_audios, log_graph
export ImageFormat, L, CL, LC, LN, NL, NCL, NLC, CLN, LCN, HW, WH, HWC, WHC,
       CHW, CWH,HWN, WHN, NHW, NWH, HWCN, WHCN, CHWN, CWHN, NHWC, NWHC, NCHW, NCWH

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

include("PNG.jl")
include("ImageFormat.jl")

include("TBLogger.jl")
include("utils.jl")  # CRC Utils
include("event.jl")
include("Loggers/base.jl")
include("Loggers/LogValue.jl")
include("Loggers/LogText.jl")
include("Loggers/LogHistograms.jl")
include("Loggers/LogAudio.jl")

include("logger_dispatch.jl")
include("logger_dispatch_overrides.jl")

# TODO move it: It depends on TBImage for the explicit interface...
# maybe we could split the explicit and the @log interfaces?
include("Loggers/LogImage.jl")

using Requires
function __init__()
    @require LightGraphs="093fc24a-ae57-5d10-9952-331d41423f4d" begin
        using .LightGraphs
        include("Optional/LogGraph.jl")
    end
    @require Plots="91a5bcdd-55d7-5caf-9e0b-520d859cae80" begin
        include("Optional/Plots.jl")
    end
    @require PyPlot="d330b81b-6aea-500a-939a-2ce795aea3ee" begin
        include("Optional/PyPlot.jl")
    end
    @require Tracker="9f7883ad-71c0-57eb-9f7f-b5c9e6d3789c" begin
        include("Optional/Tracker.jl")
    end
end

end # module

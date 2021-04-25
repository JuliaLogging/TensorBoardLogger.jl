module TensorBoardLogger

using ProtoBuf: readproto, writeproto, ProtoType
using CRC32c

using ImageCore: colorview, channelview
using ImageCore: Colorant, Gray, GrayA, RGB, RGBA
using FileIO: FileIO, @format_str, Stream, save, load

# hasproperty is not defined before 1.2. This is Compat.hasproperty
if VERSION < v"1.2.0-DEV.272"
    using ProtoBuf: hasproperty
end

#TODO: Is there a more lightweight package for compmuting an histogram?
using StatsBase: Histogram, fit

using  Base.CoreLogging: CoreLogging, AbstractLogger, LogLevel, Info,
    handle_message, shouldlog, min_enabled_level, catch_exceptions

export TBLogger, reset!, set_step!, increment_step!, set_step_increment!
export log_histogram, log_value, log_vector, log_text, log_image, log_images,
       log_audio, log_audios, log_graph, log_embeddings, log_custom_scalar
export map_summaries, TBReader

export ImageFormat, L, CL, LC, LN, NL, NCL, NLC, CLN, LCN, HW, WH, HWC, WHC,
       CHW, CWH,HWN, WHN, NHW, NWH, HWCN, WHCN, CHWN, CWHN, NHWC, NWHC, NCHW, NCWH

# Custom Scalar Plugin
export tb_multiline, tb_margin

# Wrapper types
export TBText, TBVector, TBHistogram, TBImage, TBImages, TBAudio, TBAudios

# workaround for FileIO pre 1.6
include("FileIO_workaround.jl")

# Protobuffer definitions for tensorboard
include("protojl/tensorboard/tensorboard.jl")
using .tensorboard: Summary_Value, GraphDef, Summary, Event, SessionLog_SessionStatus, SessionLog
using .tensorboard: TensorShapeProto_Dim, TensorShapeProto, TextPluginData
using .tensorboard: TensorProto, SummaryMetadata, SummaryMetadata_PluginData, _DataType

include("PNG.jl")
using .PNGImage
include("ImageFormat.jl")

# Plugin name used to store julia-specific metadata.
const TB_PLUGIN_JLARRAY_NAME = "_jl_tbl_array_sz"

include("TBLogger.jl")
include("utils.jl")  # CRC Utils
include("event.jl")
include("Loggers/base.jl")
include("Loggers/LogValue.jl")
include("Loggers/LogText.jl")
include("Loggers/LogHistograms.jl")
include("Loggers/LogAudio.jl")
include("Loggers/LogEmbeddings.jl")

# Custom Scalar Plugin
include("Loggers/LogCustomScalar.jl")

include("logger_dispatch.jl")
include("logger_dispatch_overrides.jl")

# TODO move it: It depends on TBImage for the explicit interface...
# maybe we could split the explicit and the @log interfaces?
include("Loggers/LogImage.jl")

include("Deserialization/reader.jl")
include("Deserialization/deserialization.jl")
include("Deserialization/lookahead.jl")
include("Deserialization/helpers.jl")
include("Deserialization/audio.jl")
include("Deserialization/histograms.jl")
include("Deserialization/images.jl")
include("Deserialization/tensor.jl")

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
    @require ValueHistories="98cad3c8-aec3-5f06-8e41-884608649ab7" begin
        include("Optional/ValueHistories.jl")
    end
end

end # module

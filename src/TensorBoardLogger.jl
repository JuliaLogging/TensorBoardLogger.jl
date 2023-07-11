module TensorBoardLogger

using ProtoBuf: decode, encode, ProtoDecoder, ProtoEncoder, OneOf
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
    handle_message, shouldlog, min_enabled_level, catch_exceptions, with_logger,
    NullLogger

export TBLogger, reset!, set_step!, increment_step!, set_step_increment!, with_TBLogger_hold_step
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
include("protojl/tensorboard/tensorboard/tensorboard.jl")
using .tensorboard: GraphDef, Summary, Event, SessionLog, TensorShapeProto, SourceMetadata, ResourceHandleProto
using .tensorboard: var"Summary.Value" as Summary_Value
using .tensorboard: var"SessionLog.SessionStatus" as SessionLog_SessionStatus
using .tensorboard: var"TensorShapeProto.Dim" as TensorShapeProto_Dim
using .tensorboard: var"#DataType" as _DataType
using .tensorboard: TensorProto, VariantTensorDataProto, DataClass, SummaryMetadata
using .tensorboard: var"SummaryMetadata.PluginData" as SummaryMetadata_PluginData
using .tensorboard: var"AttrValue.ListValue" as AttrValue_ListValue

include("protojl/tensorboard/plugins/text/tensorboard/tensorboard.jl")
using .tensorboard_plugin_text: TextPluginData
include("protojl/tensorboard/plugins/hparams/tensorboard/tensorboard.jl")
using .tensorboard_plugin_hparams
include("hparams.jl")
include("protojl/tensorboard/plugins/custom_scalar/tensorboard/tensorboard.jl")
using .tensorboard_plugin_custom_scalar

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
    @require Gadfly="c91e804a-d5a3-530f-b6f0-dfbca275c004" begin
        @require Fontconfig="186bb1d3-e1f7-5a2c-a377-96d770f13627" begin
            @require Cairo="159f3aea-2a34-519c-b102-8c37f9878175" begin
                using .Cairo
                using .Fontconfig
                include("Optional/Gadfly.jl")        
            end
        end
    end
    # @require Gadfly="c91e804a-d5a3-530f-b6f0-dfbca275c004" include("Optional/Gadfly.jl")
    @require Tracker="9f7883ad-71c0-57eb-9f7f-b5c9e6d3789c" begin
        include("Optional/Tracker.jl")
    end
    @require ValueHistories="98cad3c8-aec3-5f06-8e41-884608649ab7" begin
        include("Optional/ValueHistories.jl")
    end
end

end # module

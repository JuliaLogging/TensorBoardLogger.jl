module TensorBoardLogger

using ProtoBuf
using CRC32c

# Protobuffer definitions for tensorboard
include("protojl/tensorflow.jl")
include("protojl/summary_pb.jl")
include("protojl/event_pb.jl")

# CRC Utils
include("utils.jl")

# Logging structures
mutable struct Logger
    logdir::String
    file::IOStream
    all_files::Dict{String, IOStream}
    global_step::Int
end

include("logging.jl")
include("Loggers/LogValue.jl")
include("Loggers/LogHistograms.jl")
include("Logger.jl")


#macro tb_log(name)
#    :(_tb_log($(esc(string(name))), $(esc(name))))
#end

export log_histogram, log_value, log_vector
export scalar_summary, histogram_summary, make_event
export Logger

export set_tb_logdir, reset_tb_logs, default_logging_session

end # module

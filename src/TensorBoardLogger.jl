module TensorBoardLogger

using ProtoBuf
using CRC32c

#TODO: remove it. Only needed to compute histogram bins. 
using StatsBase

# Protobuffer definitions for tensorboard
include("protojl/tensorflow.jl")
include("protojl/summary_pb.jl")
include("protojl/event_pb.jl")
include("protojl/tensor_shape_pb.jl")
include("protojl/resource_handle_pb.jl")
include("protojl/tensor_pb.jl")
include("protojl/attr_value_pb.jl")
include("protojl/node_def_pb.jl")
include("protojl/op_def_pb.jl")
include("protojl/function_pb.jl")
include("protojl/types_pb.jl")
include("protojl/versions_pb.jl")
include("protojl/graph_pb.jl")

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
include("Loggers/LogGraph.jl")
include("Logger.jl")


#macro tb_log(name)
#    :(_tb_log($(esc(string(name))), $(esc(name))))
#end

export log_histogram, log_value, log_vector, log_graph
export scalar_summary, histogram_summary, make_event, graph_summary
export Logger

export set_tb_logdir, reset_tb_logs, default_logging_session

end # module

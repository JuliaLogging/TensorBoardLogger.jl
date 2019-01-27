module TensorBoardLogger

using ProtoBuf
using CRC32c

include("protojl/tensorflow.jl")
include("protojl/summary_pb.jl")
include("protojl/event_pb.jl")

include("utils.jl")

mutable struct Logger
    logdir::String
    file::IOStream
    global_step::Int
end

include("logging.jl")

"""
    Logger(logdir; [overwrite=false, time=time()])

Creates a TensorBoardLogger in the folder `logdir`.
"""
function Logger(logdir; overwrite=false, time=time())
    if overwrite
        rm(logdir; force=true, recursive=true)
    end
    mkpath(logdir)

    hostname = gethostname()
    fname = "events.out.tfevents.$time.$hostname"
    file = open(joinpath(logdir, fname), "w")

    # Create the initial log
    ev_0 = Event(wall_time=time, step=0, file_version="brain.Event:2")
    write_event(file, ev_0)

    Logger(realpath(logdir), file, 0)
end

# normally the logs don't overwrite, but if you've not given a path, you clearly don't care.
Logger() = Logger("tensorboard_logs", overwrite=true)


#macro tb_log(name)
#    :(_tb_log($(esc(string(name))), $(esc(name))))
#end

export log_histogram, log_value, log_vector
export scalar_summary, histogram_summary, make_event
export Logger

end # module

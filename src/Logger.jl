"""
    Logger(logdir; [overwrite=false, time=time(), purge_step::Int])

Creates a TensorBoardLogger in the folder `logdir`. If `overwrite` is true it
deletes previously created events.
If `purge_step::Int` is passed, every step before `purge_step` will be ignored
by tensorboard (usefull in the case of restarting a crashed computation).
"""
function Logger(logdir; overwrite=false, time=time(), purge_step::Union{Int,Nothing}=nothing)
    if overwrite
        rm(logdir; force=true, recursive=true)
    end
    mkpath(logdir)

    hostname = gethostname()
    fname    = "events.out.tfevents.$time.$hostname"
    fpath    = joinpath(logdir, fname)
    file     = open(fpath, "w")

    all_files = Dict(fpath => file)

    # Create the initial log
    if purge_step != nothing
        start_step = purge_step
        ev_0 = Event(wall_time=time, step=start_step, file_version="brain.Event:2")
        write_event(file, ev_0)
        sess_log = TensorBoardLogger.SessionLog(status=TensorBoardLogger.SessionLog_SessionStatus.START)
        ev_0 = Event(wall_time=time, step=start_step, session_log=sess_log)
        write_event(file, ev_0)
    else
        start_step = 0
        ev_0 = Event(wall_time=time, step=start_step, file_version="brain.Event:2")
        write_event(file, ev_0)
    end

    Logger(realpath(logdir), file, all_files, start_step)
end

# normally the logs don't overwrite, but if you've not given a path, you clearly don't care.
Logger() = Logger("tensorboard_logs", overwrite=true)

# Accessors
"""
    logdir(lg::Logger) -> String

Returns the directory to which Logger `lg` is writing data.
"""
logdir(lg::Logger)   = lg.logdir

"""
    get_file(lg::Logger) -> IOS

Returns the main `file` IOStream object of Logger `lg`.
"""
get_file(lg::Logger) = lg.file
function add_log_file(lg::Logger, path::String)
    file = open(path, "w")
    lg.all_files[path] = file
    return file
end

"""
    get_file(lg, tags::String...) -> IOS

Returns the `file` IOStream object of Logger `lg` writing to the tag
`tags1/tags2.../tagsN`.
"""
function get_file(lg::Logger, tags::String...)
    key = joinpath(logdir(lg), tags...)
    if key ∈ lg.all_files
        return lg.all_files[key]
    else
        return add_log_file(lg, key)
    end
end

"""
    set_step(lg, iter::Int)

Sets the iteration counter in the logger to `iter`. This counter is used by the
logger when no value is passed by the user.
"""
set_step(lg::Logger, iter::Int) = lg.global_step = iter

"""
    iteration(lg)

Returns the internal iteration counter of the logger. When no step keyword
is provided to the loggers, it will use this value.
"""
step(lg::Logger) = lg.global_step


# Additional things

#const default_logging_session = Ref(Logger())

"""
    set_tb_logdir(logdir, overwrite=false)
Start a new log in the given directory
"""
function set_tb_logdir(logdir, overwrite=false)
    default_logging_session[] = Logger(logdir, overwrite=overwrite)
end

"""
    reset_tb_logs()
Reset the current log, deleteing all information
"""
function reset_tb_logs()
    logdir = default_logging_session[].logdir
    default_logging_session[] = Logger(logdir, overwrite=true)
end

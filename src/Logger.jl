"""
    Logger(logdir; [overwrite=false, time=time(), purge_step::Int])

Creates a TensorBoardLogger in the folder `logdir`. If `overwrite` is true it
deletes previously created events.
If `purge_step::Int` is passed, every step before `purge_step` will be ignored
by tensorboard (usefull in the case of restarting a crashed computation).
"""
function TBLogger(logdir; overwrite=false, time=time(), purge_step::Union{Int,Nothing}=nothing, min_level::LogLevel=Info)
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

    TBLogger(realpath(logdir), file, all_files, start_step, min_level)
end

# normally the logs don't overwrite, but if you've not given a path, you clearly don't care.
TBLogger() = TBLogger("tensorboard_logs", overwrite=true)

# Accessors
"""
    logdir(lg::Logger) -> String

Returns the directory to which Logger `lg` is writing data.
"""
logdir(lg::TBLogger)   = lg.logdir

"""
    get_file(lg::Logger) -> IOS

Returns the main `file` IOStream object of Logger `lg`.
"""
get_file(lg::TBLogger) = lg.file
function add_log_file(lg::TBLogger, path::String)
    file = open(path, "w")
    lg.all_files[path] = file
    return file
end

"""
    get_file(lg, tags::String...) -> IOS

Returns the `file` IOStream object of Logger `lg` writing to the tag
`tags1/tags2.../tagsN`.
"""
function get_file(lg::TBLogger, tags::String...)
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
set_step(lg::TBLogger, iter::Int) = lg.global_step = iter

increment_step(lg::TBLogger, iter::Int) = lg.global_step += iter

"""
    step(lg)

Returns the internal iteration counter of the logger. When no step keyword
is provided to the loggers, it will use this value.
"""
step(lg::TBLogger) = lg.global_step


# Additional things

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


# Implement the AbstractLogger Interface

catch_exceptions(lg::TBLogger) = false

min_enabled_level(lg::TBLogger) = lg.min_level

# For now, log everything that is above the lg.min_level
shouldlog(lg::TBLogger, level, _module, group, id) = true

function handle_message(lg::TBLogger, level, message, _module, group, id, file, line; kwargs...)
    # Unpack the message
    summ    = SummaryCollection()
    i_step = 1 # :log_step_increment default value

    if !isempty(kwargs)
        data = Vector{Pair{String,Any}}()

        # ∀ (k-v) pairs, decompose values into objects that can be serialized
        for (key,val) in pairs(kwargs)
            # special key describing step increment
            if key == :log_step_increment
                i_step = val
                continue
            end

            preprocess(message*"/$key", val, data)
        end

        # Serialize every object
        for (name,val) in data
            push!(summ.value, summary_impl(name, val))
        end
    end
    iter = increment_step(lg, i_step)
    write_event(lg.file, make_event(lg, summ, step=iter))
end

"""
    preprocess(name, val, data)

This method takes a tag `name` and the value `val::T` pair. If type `T` can be
serialized to TensorBoard then the pair is pushed to `data`, otherwise it should
call `preprocess` recursively with some simpler types, until a serializable
type is finally hit.

For a struct, it calls preprocess on every field.
"""
function preprocess(name, val::T, data) where T
    if isstructtype(T)
        fn = fieldnames(T)
        for f=fn
            prop = getfield(val, f)
            preprocess(name*"/$f", prop, data)
        end

    #TODO If you encounter something that can't be logged, silently drop it.
    # When String/text logging will be implemented we should use it as a fallback.
    #else
    #    throw(ErrorException("Can't log type $T, but can't preprocess it either.\n You should define preprocess(name, val::$T, data)."))
    end
    data
end

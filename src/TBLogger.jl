mutable struct TBLogger <: AbstractLogger
    logdir::String
    file::IOStream
    all_files::Dict{String, IOStream}
    global_step::Int
    min_level::LogLevel
end


"""
    InitPolicy

An enum that describes how to behave if the folder that tensorboard should log
already exists.
"""
@enum InitPolicy tb_append=1 tb_overwrite=2 tb_increment=3
export tb_append, tb_overwrite, tb_increment

"""
    TBLogger(logdir, [tb_increment ; time=time(), purge_step::Int, min_level=Logging.Info])

Creates a TensorBoardLogger in the folder `logdir`. The second (optional)
argument specifies the behaviour if the `logdir` already exhists: the default
choice `tb_increment` appends an increasing number 1,2... to logdir. Other
choices are `tb_overwrite`, which overwrites the previous folder and `tb_append`.

If `purge_step::Int` is passed, every step before `purge_step` will be ignored
by tensorboard (usefull in the case of restarting a crashed computation).

`min_level=Logging.Info` specifies the minimum level of messages logged to
tensorboard
"""
function TBLogger(logdir="tensorboard_logs/run", overwrite=tb_increment;
                  time=time(), purge_step::Union{Int,Nothing}=nothing,
                  min_level::LogLevel=Info)

    logdir = init_logdir(logdir, overwrite)
    fpath, evfile = create_eventfile(logdir, purge_step, time)

    all_files  = Dict(fpath => evfile)
    start_step = something(purge_step, 0)

    TBLogger(logdir, evfile, all_files, start_step, min_level)
end

"""
	init_logdir(logdir, [overwrite=tb_increment])

Creates a folder at path `logdir`. If the folder already exhists the behaviour
is determined by `overwrite`.

 - `overwrite=tb_increment` appends an increasing number 1,2... to logdir.
 - `overwrite=tb_overwrite` overwrites the folder, deleting it's content.
 - `overwrite=tb_append` appends to it's previous content.
"""
function init_logdir(logdir, overwrite=tb_increment)
    if overwrite == tb_overwrite
        rm(logdir; force=true, recursive=true)
    elseif overwrite == tb_append
        # do nothing
    elseif overwrite == tb_increment
        # find the next viable name
        if ispath(logdir)
            i=1
            while i<1000 # avoids an infinite loop
                logdir_new = logdir*"_$i"
                #println("trying $logdir_new")
                !ispath(logdir_new) && break
                i+=1
            end
            logdir = logdir*"_$i"
        end
    end
    mkpath(logdir)

    return realpath(logdir)
end

"""
	create_eventfile(logdir, [purge_step=nothing; time=time()]) -> IOStream

Creates a protobuffer events file in the logdir and returns the IO buffer for
writing to it. If `purge_step::Int` is passed then a special event is written
that makes TensorBoard ignore all events before that step (usefull to ignore
part of a calculation that crashed).

Optional keyword argument `prepend` can be passed to prepend a path to the file
name.
"""
function create_eventfile(logdir, purge_step=nothing, time=time(); prepend="")
    hostname = gethostname()
    fname    = prepend*"events.out.tfevents.$time.$hostname"
    fpath    = joinpath(logdir, fname)

    mkpath(dirname(fpath))
    file     = open(fpath, "w")

    # Create the initial log
    if purge_step != nothing
        ev_0 = Event(wall_time=time, step=purge_step, file_version="brain.Event:2")
        write_event(file, ev_0)
        sess_log = TensorBoardLogger.SessionLog(status=TensorBoardLogger.SessionLog_SessionStatus.START)
        ev_0 = Event(wall_time=time, step=purge_step, session_log=sess_log)
        write_event(file, ev_0)
    else
        ev_0 = Event(wall_time=time, step=0, file_version="brain.Event:2")
        write_event(file, ev_0)
    end
	return fname, file
end

"""
	add_eventfile(lg::TBLogger, path::String)

Adds an event file to `lg` with `path` prepended to it's name. It can be used
to create sub-event collection in a single event collection.
"""
function add_eventfile(lg::TBLogger, path="")
    fname, file = create_eventfile(logdir(lg), prepend=path)
    lg.all_files[fname] = file
    return fname
end

# Accessors
"""
    logdir(lg::TBLogger) -> String

Returns the directory where `lg` is writing events data.
"""
logdir(lg::TBLogger)   = lg.logdir

"""
    get_file(lg::TBLogger) -> IOS

Returns the main `file` IOStream object of Logger `lg`.
"""
get_file(lg::TBLogger) = lg.file

"""
    get_file(lg, tags::String...) -> IOS

Returns the `file` IOStream object of Logger `lg` writing to the tag
`tags1/tags2.../tagsN`.
"""
function get_file(lg::TBLogger, tags::String...)
    key = joinpath(tags...)
    if key ∈ keys(lg.all_files)
        return lg.all_files[key]
    else
        return add_eventfile(lg, key)
    end
end

"""
    set_step!(lg, step) -> Int

Sets the iteration counter in the logger to `step`. This counter is used by the
logger when no value is passed by the user.
"""
set_step!(lg::TBLogger, step) = lg.global_step = step

"""
	increment_step!(lg, Δ_Step) -> Int

Increments the step counter in the logger by `Δ_Step` and returns the new value.
"""
increment_step!(lg::TBLogger, Δ_Step) = lg.global_step += Δ_Step

"""
    step(lg) -> Int

Returns the internal step counter of the logger.
"""
step(lg::TBLogger) = lg.global_step

"""
    reset!(lg)

Reset the TBLogger `lg`, deleting everything in it's log directory.
"""
function reset!(lg::TBLogger)
    # close open streams
    for k=keys(lg.all_files)
        close(lg.all_files[k])
        delete!(lg.all_files, k)
    end

    # Overwrite the logdirectoy and create a new base event file
    init_logdir(logdir(lg), tb_overwrite)
    fname   = add_eventfile(lg, "")
    lg.file = get_file(lg, fname)
    set_step!(lg, 0)

    return lg
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
    iter = increment_step!(lg, i_step)
    write_event(lg.file, make_event(lg, summ, step=iter))
end

######################### Methods for pretty printing ##########################
Base.show(io::IO, tbl::TBLogger) = begin
	str  = "TBLogger(\"$(tbl.logdir)\"), min_level=$(tbl.min_level), "*
		   "purge_step=$(tbl.global_step))"
    Base.print(io, str)
end

Base.show(io::IO, mime::MIME"text/plain", tbl::TBLogger) = begin
	str = """
	TBLogger:
		- Log level     : $(tbl.min_level)
		- Current step  : $(tbl.global_step)
		- Output        : $(tbl.logdir)
		- open files    : $(length(tbl.all_files))
	"""
    Base.print(io, str)
end

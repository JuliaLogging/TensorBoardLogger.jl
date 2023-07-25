mutable struct TBLogger{P,S} <: AbstractLogger
    logdir::P
    file::S
    all_files::Dict{String, S}
    global_step::Int
    step_increment::Int
    min_level::LogLevel

    function TBLogger{P,S}(logdir::P,
                           file::S,
                           all_files::Dict{String, S},
                           global_step::Int,
                           step_increment::Int,
                           min_level::LogLevel) where {P,S}
        lg = new{P, S}(logdir, file, all_files, global_step, step_increment, min_level)
        return Base.finalizer(Base.close, lg)
    end
end


"""
    InitPolicy

An enum that describes how to behave if the folder that tensorboard should log
already exists.
"""
@enum InitPolicy tb_append=1 tb_overwrite=2 tb_increment=3
export tb_append, tb_overwrite, tb_increment

"""
    TBLogger(logdir[, tb_increment]; 
            time=time(), 
            prefix="",
            purge_step=nothing, 
            step_increment=1, 
            min_level=Logging.Info)

Creates a TensorBoardLogger in the folder `logdir`. The second (optional)
argument specifies the behaviour if the `logdir` already exhists: the default
choice `tb_increment` appends an increasing number 1,2... to `logdir`. Other
choices are `tb_overwrite`, which overwrites the previous folder, and `tb_append`,
which adds to any existing logs.

Optional keyword argument `prefix` can be passed to prepend a path to the file
name (note, not the log directory). See `create_eventfile()`

If a `purge_step::Int` is passed, every step before `purge_step` will be ignored
by tensorboard (usefull in the case of restarting a crashed computation).

`min_level` specifies the minimum level of messages logged to
tensorboard.
"""
function TBLogger(logdir="tensorboard_logs/run", overwrite=tb_increment;
                  time=time(),
                  prefix="",
                  purge_step::Union{Int,Nothing}=nothing,
                  step_increment = 1, 
                  min_level::LogLevel=Info)

    logdir = init_logdir(logdir, overwrite)
    fpath, evfile = create_eventfile(logdir, purge_step, time; prepend = prefix)

    all_files  = Dict(fpath => evfile)
    start_step = something(purge_step, 0)

    TBLogger{typeof(logdir), typeof(evfile)}(logdir, evfile, all_files, start_step, step_increment, min_level)
end

"""
    init_logdir(logdir, [overwrite=tb_increment])

Creates a folder at path `logdir`. If the folder already exhists the behaviour
is determined by `overwrite`.

 - `overwrite=tb_increment` appends an increasing number 1,2... to logdir.
 - `overwrite=tb_overwrite` overwrites the folder, deleting its content.
 - `overwrite=tb_append` appends to its previous content.
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
    create_eventfile(logdir, [purge_step=nothing; time=time()]) -> IO

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
    source_metadata = Ref{Union{Nothing,SourceMetadata}}(nothing)
    if !(purge_step isa Nothing)
        ev_0 = Event(time, purge_step, OneOf(:file_version,"brain.Event:2"), source_metadata[])
        write_event(file, ev_0)
        sess_log = TensorBoardLogger.SessionLog(TensorBoardLogger.SessionLog_SessionStatus.START, logdir, "")
        ev_0 = Event(time, purge_step, OneOf(:session_log, sess_log), source_metadata[])
        write_event(file, ev_0)
    else
        ev_0 = Event(time, 0, OneOf(:file_version,"brain.Event:2"), source_metadata[])
        write_event(file, ev_0)
    end
    return fname, file
end

"""
    add_eventfile(lg::TBLogger, path::String)

Adds an event file to `lg` with `path` prepended to its name. It can be used
to create sub-event collection in a single event collection.
"""
function add_eventfile(lg::TBLogger, path="")
    fname, file = create_eventfile(logdir(lg); prepend=path)
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

Returns the main `file` IO object of Logger `lg`.
"""
get_file(lg::TBLogger) = lg.file

"""
    get_file(lg, tags::String...) -> IOS

Returns the `file` IO object of Logger `lg` writing to the tag
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
    set_step_increment!(lg, increment) -> Int

Sets the default increment applyed to logger `lg`'s iteration counter
each time logging is performed.

Can be overidden by passing `log_step_increment=some_increment` when logging.
"""
set_step_increment!(lg::TBLogger, Δstep) = lg.step_increment = Δstep

"""
    increment_step!(lg, Δ_Step) -> Int

Increments the step counter in the logger by `Δ_Step` and returns the new value.
"""
function increment_step!(lg::TBLogger, Δ_Step)
    lg.global_step += Δ_Step
    return lg.global_step
end

"""
    step(lg) -> Int

Returns the internal step counter of the logger.
"""
step(lg::TBLogger) = lg.global_step

"""
    close(lg)

Close the TBLogger `lg`, releasing all file handles.
"""
function Base.close(lg::TBLogger)
    # close open streams
    for k=keys(lg.all_files)
        close(lg.all_files[k])
    end
end

"""
    reset!(lg)

Reset the TBLogger `lg`, deleting everything in its log directory.
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

CoreLogging.catch_exceptions(lg::TBLogger) = false

CoreLogging.min_enabled_level(lg::TBLogger) = lg.min_level

# For now, log everything that is above the lg.min_level
CoreLogging.shouldlog(lg::TBLogger, level, _module, group, id) = true

function CoreLogging.handle_message(lg::TBLogger, level, message, _module, group,
                                    id, file, line; kwargs...)
    # Unpack the message
    summ    = SummaryCollection()
    i_step = lg.step_increment # :log_step_increment default value

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

"""
`with_TBLogger_hold_step(f, [step]; step_at_end::Bool=true)`
Context function to ease control of logging steps and synchronization.
Amount of step increment can be controlled via `set_step_increment!``.

Example:
```julia
with_logger(lg) do
    for epoch in 1:10
        for i=1:100
            # increments global_step by default
            with_TBLogger_hold_step() do
                # all of these are logged at the same global_step
                # and the logger global_step is only then increased
                @info "train1/scalar" i=i
                @info "train2/scalar" i2=i^2
                @info "train3/scalar" i3=i^3
            end
        end
        # step increment at end can be disabled for easy train/test sync
        with_TBLogger_hold_step(;step_at_end=false) do
            # all of these are logged at the same global_step
            # and the logger global_step is only then increased
            @info "test1/scalar" i=i
            @info "test2/scalar" i2=i^2
            @info "test3/scalar" i3=i^3
        end
    end
end
```

"""
function with_TBLogger_hold_step(f, step::Int; step_at_end::Bool=true)
    logger = CoreLogging.current_logger()
    @assert logger isa TBLogger "with_TBLogger_hold_step: current logger is not a TBLogger, cannot establish current step automatically"
    curr_step = logger.global_step
    curr_increment = logger.step_increment
    set_step!(logger, step)
    set_step_increment!(logger, 0)
    f()
    set_step!(logger, curr_step)
    set_step_increment!(logger, curr_increment)
    step_at_end && increment_step!(logger, curr_increment)
end
function with_TBLogger_hold_step(f; step_at_end::Bool=true)
    logger = CoreLogging.current_logger()
    isa(logger, TBLogger) || error("with_TBLogger_hold_step: current logger is not a TBLogger, cannot establish current step automatically")
    with_TBLogger_hold_step(f, logger.global_step; step_at_end=step_at_end)
end

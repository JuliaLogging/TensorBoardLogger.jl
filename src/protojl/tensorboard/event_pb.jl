# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

const WorkerHealth = (;[
    Symbol("OK") => Int32(0),
    Symbol("RECEIVED_SHUTDOWN_SIGNAL") => Int32(1),
    Symbol("INTERNAL_ERROR") => Int32(2),
    Symbol("SHUTTING_DOWN") => Int32(3),
]...)

const WorkerShutdownMode = (;[
    Symbol("DEFAULT") => Int32(0),
    Symbol("NOT_CONFIGURED") => Int32(1),
    Symbol("WAIT_FOR_COORDINATOR") => Int32(2),
    Symbol("SHUTDOWN_AFTER_TIMEOUT") => Int32(3),
]...)

const LogMessage_Level = (;[
    Symbol("UNKNOWN") => Int32(0),
    Symbol("DEBUGGING") => Int32(10),
    Symbol("INFO") => Int32(20),
    Symbol("WARN") => Int32(30),
    Symbol("ERROR") => Int32(40),
    Symbol("FATAL") => Int32(50),
]...)

mutable struct LogMessage <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function LogMessage(; kwargs...)
        obj = new(meta(LogMessage), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct LogMessage
const __meta_LogMessage = Ref{ProtoMeta}()
function meta(::Type{LogMessage})
    ProtoBuf.metalock() do
        if !isassigned(__meta_LogMessage)
            __meta_LogMessage[] = target = ProtoMeta(LogMessage)
            allflds = Pair{Symbol,Union{Type,String}}[:level => Int32, :message => AbstractString]
            meta(target, LogMessage, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_LogMessage[]
    end
end
function Base.getproperty(obj::LogMessage, name::Symbol)
    if name === :level
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :message
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

const SessionLog_SessionStatus = (;[
    Symbol("STATUS_UNSPECIFIED") => Int32(0),
    Symbol("START") => Int32(1),
    Symbol("STOP") => Int32(2),
    Symbol("CHECKPOINT") => Int32(3),
]...)

mutable struct SessionLog <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SessionLog(; kwargs...)
        obj = new(meta(SessionLog), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct SessionLog
const __meta_SessionLog = Ref{ProtoMeta}()
function meta(::Type{SessionLog})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SessionLog)
            __meta_SessionLog[] = target = ProtoMeta(SessionLog)
            allflds = Pair{Symbol,Union{Type,String}}[:status => Int32, :checkpoint_path => AbstractString, :msg => AbstractString]
            meta(target, SessionLog, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SessionLog[]
    end
end
function Base.getproperty(obj::SessionLog, name::Symbol)
    if name === :status
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :checkpoint_path
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :msg
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct TaggedRunMetadata <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function TaggedRunMetadata(; kwargs...)
        obj = new(meta(TaggedRunMetadata), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct TaggedRunMetadata
const __meta_TaggedRunMetadata = Ref{ProtoMeta}()
function meta(::Type{TaggedRunMetadata})
    ProtoBuf.metalock() do
        if !isassigned(__meta_TaggedRunMetadata)
            __meta_TaggedRunMetadata[] = target = ProtoMeta(TaggedRunMetadata)
            allflds = Pair{Symbol,Union{Type,String}}[:tag => AbstractString, :run_metadata => Vector{UInt8}]
            meta(target, TaggedRunMetadata, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_TaggedRunMetadata[]
    end
end
function Base.getproperty(obj::TaggedRunMetadata, name::Symbol)
    if name === :tag
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :run_metadata
        return (obj.__protobuf_jl_internal_values[name])::Vector{UInt8}
    else
        getfield(obj, name)
    end
end

mutable struct Event <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function Event(; kwargs...)
        obj = new(meta(Event), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct Event
const __meta_Event = Ref{ProtoMeta}()
function meta(::Type{Event})
    ProtoBuf.metalock() do
        if !isassigned(__meta_Event)
            __meta_Event[] = target = ProtoMeta(Event)
            allflds = Pair{Symbol,Union{Type,String}}[:wall_time => Float64, :step => Int64, :file_version => AbstractString, :graph_def => Vector{UInt8}, :summary => Summary, :log_message => LogMessage, :session_log => SessionLog, :tagged_run_metadata => TaggedRunMetadata, :meta_graph_def => Vector{UInt8}]
            oneofs = Int[0,0,1,1,1,1,1,1,1]
            oneof_names = Symbol[Symbol("what")]
            meta(target, Event, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, oneofs, oneof_names)
        end
        __meta_Event[]
    end
end
function Base.getproperty(obj::Event, name::Symbol)
    if name === :wall_time
        return (obj.__protobuf_jl_internal_values[name])::Float64
    elseif name === :step
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :file_version
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :graph_def
        return (obj.__protobuf_jl_internal_values[name])::Vector{UInt8}
    elseif name === :summary
        return (obj.__protobuf_jl_internal_values[name])::Summary
    elseif name === :log_message
        return (obj.__protobuf_jl_internal_values[name])::LogMessage
    elseif name === :session_log
        return (obj.__protobuf_jl_internal_values[name])::SessionLog
    elseif name === :tagged_run_metadata
        return (obj.__protobuf_jl_internal_values[name])::TaggedRunMetadata
    elseif name === :meta_graph_def
        return (obj.__protobuf_jl_internal_values[name])::Vector{UInt8}
    else
        getfield(obj, name)
    end
end

mutable struct WatchdogConfig <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function WatchdogConfig(; kwargs...)
        obj = new(meta(WatchdogConfig), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct WatchdogConfig
const __meta_WatchdogConfig = Ref{ProtoMeta}()
function meta(::Type{WatchdogConfig})
    ProtoBuf.metalock() do
        if !isassigned(__meta_WatchdogConfig)
            __meta_WatchdogConfig[] = target = ProtoMeta(WatchdogConfig)
            allflds = Pair{Symbol,Union{Type,String}}[:timeout_ms => Int64]
            meta(target, WatchdogConfig, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_WatchdogConfig[]
    end
end
function Base.getproperty(obj::WatchdogConfig, name::Symbol)
    if name === :timeout_ms
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct RequestedExitCode <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function RequestedExitCode(; kwargs...)
        obj = new(meta(RequestedExitCode), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct RequestedExitCode
const __meta_RequestedExitCode = Ref{ProtoMeta}()
function meta(::Type{RequestedExitCode})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RequestedExitCode)
            __meta_RequestedExitCode[] = target = ProtoMeta(RequestedExitCode)
            allflds = Pair{Symbol,Union{Type,String}}[:exit_code => Int32]
            meta(target, RequestedExitCode, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RequestedExitCode[]
    end
end
function Base.getproperty(obj::RequestedExitCode, name::Symbol)
    if name === :exit_code
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct WorkerHeartbeatRequest <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function WorkerHeartbeatRequest(; kwargs...)
        obj = new(meta(WorkerHeartbeatRequest), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct WorkerHeartbeatRequest
const __meta_WorkerHeartbeatRequest = Ref{ProtoMeta}()
function meta(::Type{WorkerHeartbeatRequest})
    ProtoBuf.metalock() do
        if !isassigned(__meta_WorkerHeartbeatRequest)
            __meta_WorkerHeartbeatRequest[] = target = ProtoMeta(WorkerHeartbeatRequest)
            allflds = Pair{Symbol,Union{Type,String}}[:shutdown_mode => Int32, :watchdog_config => WatchdogConfig, :exit_code => RequestedExitCode]
            meta(target, WorkerHeartbeatRequest, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_WorkerHeartbeatRequest[]
    end
end
function Base.getproperty(obj::WorkerHeartbeatRequest, name::Symbol)
    if name === :shutdown_mode
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :watchdog_config
        return (obj.__protobuf_jl_internal_values[name])::WatchdogConfig
    elseif name === :exit_code
        return (obj.__protobuf_jl_internal_values[name])::RequestedExitCode
    else
        getfield(obj, name)
    end
end

mutable struct WorkerHeartbeatResponse <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function WorkerHeartbeatResponse(; kwargs...)
        obj = new(meta(WorkerHeartbeatResponse), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct WorkerHeartbeatResponse
const __meta_WorkerHeartbeatResponse = Ref{ProtoMeta}()
function meta(::Type{WorkerHeartbeatResponse})
    ProtoBuf.metalock() do
        if !isassigned(__meta_WorkerHeartbeatResponse)
            __meta_WorkerHeartbeatResponse[] = target = ProtoMeta(WorkerHeartbeatResponse)
            allflds = Pair{Symbol,Union{Type,String}}[:health_status => Int32, :worker_log => Base.Vector{Event}, :hostname => AbstractString]
            meta(target, WorkerHeartbeatResponse, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_WorkerHeartbeatResponse[]
    end
end
function Base.getproperty(obj::WorkerHeartbeatResponse, name::Symbol)
    if name === :health_status
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :worker_log
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Event}
    elseif name === :hostname
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

export WorkerHealth, WorkerShutdownMode, Event, LogMessage_Level, LogMessage, SessionLog_SessionStatus, SessionLog, TaggedRunMetadata, WatchdogConfig, RequestedExitCode, WorkerHeartbeatRequest, WorkerHeartbeatResponse

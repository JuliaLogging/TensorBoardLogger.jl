# syntax: proto3
using ProtoBuf
import ProtoBuf.meta
import ProtoBuf.google.protobuf

mutable struct SessionStartInfo_HparamsEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SessionStartInfo_HparamsEntry(; kwargs...)
        obj = new(meta(SessionStartInfo_HparamsEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SessionStartInfo_HparamsEntry (mapentry)
const __meta_SessionStartInfo_HparamsEntry = Ref{ProtoMeta}()
function meta(::Type{SessionStartInfo_HparamsEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SessionStartInfo_HparamsEntry)
            __meta_SessionStartInfo_HparamsEntry[] = target = ProtoMeta(SessionStartInfo_HparamsEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => ProtoBuf.google.protobuf.Value]
            meta(target, SessionStartInfo_HparamsEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SessionStartInfo_HparamsEntry[]
    end
end
function Base.getproperty(obj::SessionStartInfo_HparamsEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::ProtoBuf.google.protobuf.Value
    else
        getfield(obj, name)
    end
end

mutable struct SessionStartInfo <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SessionStartInfo(; kwargs...)
        obj = new(meta(SessionStartInfo), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SessionStartInfo
const __meta_SessionStartInfo = Ref{ProtoMeta}()
function meta(::Type{SessionStartInfo})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SessionStartInfo)
            __meta_SessionStartInfo[] = target = ProtoMeta(SessionStartInfo)
            allflds = Pair{Symbol,Union{Type,String}}[:hparams => Base.Dict{AbstractString,ProtoBuf.google.protobuf.Value}, :model_uri => AbstractString, :monitor_url => AbstractString, :group_name => AbstractString, :start_time_secs => Float64]
            meta(target, SessionStartInfo, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SessionStartInfo[]
    end
end
function Base.getproperty(obj::SessionStartInfo, name::Symbol)
    if name === :hparams
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{AbstractString,ProtoBuf.google.protobuf.Value}
    elseif name === :model_uri
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :monitor_url
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :group_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :start_time_secs
        return (obj.__protobuf_jl_internal_values[name])::Float64
    else
        getfield(obj, name)
    end
end

mutable struct SessionEndInfo <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SessionEndInfo(; kwargs...)
        obj = new(meta(SessionEndInfo), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SessionEndInfo
const __meta_SessionEndInfo = Ref{ProtoMeta}()
function meta(::Type{SessionEndInfo})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SessionEndInfo)
            __meta_SessionEndInfo[] = target = ProtoMeta(SessionEndInfo)
            allflds = Pair{Symbol,Union{Type,String}}[:status => Int32, :end_time_secs => Float64]
            meta(target, SessionEndInfo, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SessionEndInfo[]
    end
end
function Base.getproperty(obj::SessionEndInfo, name::Symbol)
    if name === :status
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :end_time_secs
        return (obj.__protobuf_jl_internal_values[name])::Float64
    else
        getfield(obj, name)
    end
end

mutable struct HParamsPluginData <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function HParamsPluginData(; kwargs...)
        obj = new(meta(HParamsPluginData), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct HParamsPluginData
const __meta_HParamsPluginData = Ref{ProtoMeta}()
function meta(::Type{HParamsPluginData})
    ProtoBuf.metalock() do
        if !isassigned(__meta_HParamsPluginData)
            __meta_HParamsPluginData[] = target = ProtoMeta(HParamsPluginData)
            allflds = Pair{Symbol,Union{Type,String}}[:version => Int32, :experiment => Experiment, :session_start_info => SessionStartInfo, :session_end_info => SessionEndInfo]
            oneofs = Int[0,1,1,1]
            oneof_names = Symbol[Symbol("data")]
            meta(target, HParamsPluginData, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, oneofs, oneof_names)
        end
        __meta_HParamsPluginData[]
    end
end
function Base.getproperty(obj::HParamsPluginData, name::Symbol)
    if name === :version
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :experiment
        return (obj.__protobuf_jl_internal_values[name])::Experiment
    elseif name === :session_start_info
        return (obj.__protobuf_jl_internal_values[name])::SessionStartInfo
    elseif name === :session_end_info
        return (obj.__protobuf_jl_internal_values[name])::SessionEndInfo
    else
        getfield(obj, name)
    end
end

export HParamsPluginData, SessionStartInfo_HparamsEntry, SessionStartInfo, SessionEndInfo
# mapentries: "SessionStartInfo_HparamsEntry" => ("AbstractString", "ProtoBuf.google.protobuf.Value")

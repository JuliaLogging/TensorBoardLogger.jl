# syntax: proto3
using ProtoBuf
import ProtoBuf.meta
import ProtoBuf.google.protobuf

const _DataType = (;[
    Symbol("DATA_TYPE_UNSET") => Int32(0),
    Symbol("DATA_TYPE_STRING") => Int32(1),
    Symbol("DATA_TYPE_BOOL") => Int32(2),
    Symbol("DATA_TYPE_FLOAT64") => Int32(3),
]...)

const DatasetType = (;[
    Symbol("DATASET_UNKNOWN") => Int32(0),
    Symbol("DATASET_TRAINING") => Int32(1),
    Symbol("DATASET_VALIDATION") => Int32(2),
]...)

const Status = (;[
    Symbol("STATUS_UNKNOWN") => Int32(0),
    Symbol("STATUS_SUCCESS") => Int32(1),
    Symbol("STATUS_FAILURE") => Int32(2),
    Symbol("STATUS_RUNNING") => Int32(3),
]...)

const SortOrder = (;[
    Symbol("ORDER_UNSPECIFIED") => Int32(0),
    Symbol("ORDER_ASC") => Int32(1),
    Symbol("ORDER_DESC") => Int32(2),
]...)

const AggregationType = (;[
    Symbol("AGGREGATION_UNSET") => Int32(0),
    Symbol("AGGREGATION_AVG") => Int32(1),
    Symbol("AGGREGATION_MEDIAN") => Int32(2),
    Symbol("AGGREGATION_MIN") => Int32(3),
    Symbol("AGGREGATION_MAX") => Int32(4),
]...)

mutable struct Interval <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function Interval(; kwargs...)
        obj = new(meta(Interval), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct Interval
const __meta_Interval = Ref{ProtoMeta}()
function meta(::Type{Interval})
    ProtoBuf.metalock() do
        if !isassigned(__meta_Interval)
            __meta_Interval[] = target = ProtoMeta(Interval)
            allflds = Pair{Symbol,Union{Type,String}}[:min_value => Float64, :max_value => Float64]
            meta(target, Interval, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_Interval[]
    end
end
function Base.getproperty(obj::Interval, name::Symbol)
    if name === :min_value
        return (obj.__protobuf_jl_internal_values[name])::Float64
    elseif name === :max_value
        return (obj.__protobuf_jl_internal_values[name])::Float64
    else
        getfield(obj, name)
    end
end

mutable struct HParamInfo <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function HParamInfo(; kwargs...)
        obj = new(meta(HParamInfo), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct HParamInfo
const __meta_HParamInfo = Ref{ProtoMeta}()
function meta(::Type{HParamInfo})
    ProtoBuf.metalock() do
        if !isassigned(__meta_HParamInfo)
            __meta_HParamInfo[] = target = ProtoMeta(HParamInfo)
            allflds = Pair{Symbol,Union{Type,String}}[:name => AbstractString, :display_name => AbstractString, :description => AbstractString, :_type => Int32, :domain_discrete => ProtoBuf.google.protobuf.ListValue, :domain_interval => Interval]
            oneofs = Int[0,0,0,0,1,1]
            oneof_names = Symbol[Symbol("domain")]
            meta(target, HParamInfo, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, oneofs, oneof_names)
        end
        __meta_HParamInfo[]
    end
end
function Base.getproperty(obj::HParamInfo, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :display_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :description
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :domain_discrete
        return (obj.__protobuf_jl_internal_values[name])::ProtoBuf.google.protobuf.ListValue
    elseif name === :domain_interval
        return (obj.__protobuf_jl_internal_values[name])::Interval
    else
        getfield(obj, name)
    end
end

mutable struct MetricName <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function MetricName(; kwargs...)
        obj = new(meta(MetricName), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct MetricName
const __meta_MetricName = Ref{ProtoMeta}()
function meta(::Type{MetricName})
    ProtoBuf.metalock() do
        if !isassigned(__meta_MetricName)
            __meta_MetricName[] = target = ProtoMeta(MetricName)
            allflds = Pair{Symbol,Union{Type,String}}[:group => AbstractString, :tag => AbstractString]
            meta(target, MetricName, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_MetricName[]
    end
end
function Base.getproperty(obj::MetricName, name::Symbol)
    if name === :group
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :tag
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct MetricInfo <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function MetricInfo(; kwargs...)
        obj = new(meta(MetricInfo), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct MetricInfo
const __meta_MetricInfo = Ref{ProtoMeta}()
function meta(::Type{MetricInfo})
    ProtoBuf.metalock() do
        if !isassigned(__meta_MetricInfo)
            __meta_MetricInfo[] = target = ProtoMeta(MetricInfo)
            fnum = Int[1,3,4,5]
            allflds = Pair{Symbol,Union{Type,String}}[:name => MetricName, :display_name => AbstractString, :description => AbstractString, :dataset_type => Int32]
            meta(target, MetricInfo, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_MetricInfo[]
    end
end
function Base.getproperty(obj::MetricInfo, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::MetricName
    elseif name === :display_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :description
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :dataset_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct Experiment <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function Experiment(; kwargs...)
        obj = new(meta(Experiment), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct Experiment
const __meta_Experiment = Ref{ProtoMeta}()
function meta(::Type{Experiment})
    ProtoBuf.metalock() do
        if !isassigned(__meta_Experiment)
            __meta_Experiment[] = target = ProtoMeta(Experiment)
            fnum = Int[6,1,2,3,4,5]
            allflds = Pair{Symbol,Union{Type,String}}[:name => AbstractString, :description => AbstractString, :user => AbstractString, :time_created_secs => Float64, :hparam_infos => Base.Vector{HParamInfo}, :metric_infos => Base.Vector{MetricInfo}]
            meta(target, Experiment, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_Experiment[]
    end
end
function Base.getproperty(obj::Experiment, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :description
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :user
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :time_created_secs
        return (obj.__protobuf_jl_internal_values[name])::Float64
    elseif name === :hparam_infos
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{HParamInfo}
    elseif name === :metric_infos
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{MetricInfo}
    else
        getfield(obj, name)
    end
end

mutable struct MetricValue <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function MetricValue(; kwargs...)
        obj = new(meta(MetricValue), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct MetricValue
const __meta_MetricValue = Ref{ProtoMeta}()
function meta(::Type{MetricValue})
    ProtoBuf.metalock() do
        if !isassigned(__meta_MetricValue)
            __meta_MetricValue[] = target = ProtoMeta(MetricValue)
            allflds = Pair{Symbol,Union{Type,String}}[:name => MetricName, :value => Float64, :training_step => Int32, :wall_time_secs => Float64]
            meta(target, MetricValue, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_MetricValue[]
    end
end
function Base.getproperty(obj::MetricValue, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::MetricName
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::Float64
    elseif name === :training_step
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :wall_time_secs
        return (obj.__protobuf_jl_internal_values[name])::Float64
    else
        getfield(obj, name)
    end
end

mutable struct Session <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function Session(; kwargs...)
        obj = new(meta(Session), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct Session
const __meta_Session = Ref{ProtoMeta}()
function meta(::Type{Session})
    ProtoBuf.metalock() do
        if !isassigned(__meta_Session)
            __meta_Session[] = target = ProtoMeta(Session)
            allflds = Pair{Symbol,Union{Type,String}}[:name => AbstractString, :start_time_secs => Float64, :end_time_secs => Float64, :status => Int32, :model_uri => AbstractString, :metric_values => Base.Vector{MetricValue}, :monitor_url => AbstractString]
            meta(target, Session, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_Session[]
    end
end
function Base.getproperty(obj::Session, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :start_time_secs
        return (obj.__protobuf_jl_internal_values[name])::Float64
    elseif name === :end_time_secs
        return (obj.__protobuf_jl_internal_values[name])::Float64
    elseif name === :status
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :model_uri
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :metric_values
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{MetricValue}
    elseif name === :monitor_url
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct SessionGroup_HparamsEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SessionGroup_HparamsEntry(; kwargs...)
        obj = new(meta(SessionGroup_HparamsEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SessionGroup_HparamsEntry (mapentry)
const __meta_SessionGroup_HparamsEntry = Ref{ProtoMeta}()
function meta(::Type{SessionGroup_HparamsEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SessionGroup_HparamsEntry)
            __meta_SessionGroup_HparamsEntry[] = target = ProtoMeta(SessionGroup_HparamsEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => ProtoBuf.google.protobuf.Value]
            meta(target, SessionGroup_HparamsEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SessionGroup_HparamsEntry[]
    end
end
function Base.getproperty(obj::SessionGroup_HparamsEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::ProtoBuf.google.protobuf.Value
    else
        getfield(obj, name)
    end
end

mutable struct SessionGroup <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SessionGroup(; kwargs...)
        obj = new(meta(SessionGroup), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SessionGroup
const __meta_SessionGroup = Ref{ProtoMeta}()
function meta(::Type{SessionGroup})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SessionGroup)
            __meta_SessionGroup[] = target = ProtoMeta(SessionGroup)
            allflds = Pair{Symbol,Union{Type,String}}[:name => AbstractString, :hparams => Base.Dict{AbstractString,ProtoBuf.google.protobuf.Value}, :metric_values => Base.Vector{MetricValue}, :sessions => Base.Vector{Session}, :monitor_url => AbstractString]
            meta(target, SessionGroup, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SessionGroup[]
    end
end
function Base.getproperty(obj::SessionGroup, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :hparams
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{AbstractString,ProtoBuf.google.protobuf.Value}
    elseif name === :metric_values
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{MetricValue}
    elseif name === :sessions
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Session}
    elseif name === :monitor_url
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct GetExperimentRequest <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function GetExperimentRequest(; kwargs...)
        obj = new(meta(GetExperimentRequest), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct GetExperimentRequest
const __meta_GetExperimentRequest = Ref{ProtoMeta}()
function meta(::Type{GetExperimentRequest})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetExperimentRequest)
            __meta_GetExperimentRequest[] = target = ProtoMeta(GetExperimentRequest)
            allflds = Pair{Symbol,Union{Type,String}}[:experiment_name => AbstractString]
            meta(target, GetExperimentRequest, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetExperimentRequest[]
    end
end
function Base.getproperty(obj::GetExperimentRequest, name::Symbol)
    if name === :experiment_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct ColParams <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ColParams(; kwargs...)
        obj = new(meta(ColParams), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ColParams
const __meta_ColParams = Ref{ProtoMeta}()
function meta(::Type{ColParams})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ColParams)
            __meta_ColParams[] = target = ProtoMeta(ColParams)
            allflds = Pair{Symbol,Union{Type,String}}[:metric => MetricName, :hparam => AbstractString, :order => Int32, :missing_values_first => Bool, :filter_regexp => AbstractString, :filter_interval => Interval, :filter_discrete => ProtoBuf.google.protobuf.ListValue, :exclude_missing_values => Bool]
            oneofs = Int[1,1,0,0,2,2,2,0]
            oneof_names = Symbol[Symbol("name"),Symbol("filter")]
            meta(target, ColParams, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, oneofs, oneof_names)
        end
        __meta_ColParams[]
    end
end
function Base.getproperty(obj::ColParams, name::Symbol)
    if name === :metric
        return (obj.__protobuf_jl_internal_values[name])::MetricName
    elseif name === :hparam
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :order
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :missing_values_first
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :filter_regexp
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :filter_interval
        return (obj.__protobuf_jl_internal_values[name])::Interval
    elseif name === :filter_discrete
        return (obj.__protobuf_jl_internal_values[name])::ProtoBuf.google.protobuf.ListValue
    elseif name === :exclude_missing_values
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct ListSessionGroupsRequest <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ListSessionGroupsRequest(; kwargs...)
        obj = new(meta(ListSessionGroupsRequest), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ListSessionGroupsRequest
const __meta_ListSessionGroupsRequest = Ref{ProtoMeta}()
function meta(::Type{ListSessionGroupsRequest})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ListSessionGroupsRequest)
            __meta_ListSessionGroupsRequest[] = target = ProtoMeta(ListSessionGroupsRequest)
            fnum = Int[6,7,1,2,3,4,5]
            pack = Symbol[:allowed_statuses]
            allflds = Pair{Symbol,Union{Type,String}}[:experiment_name => AbstractString, :allowed_statuses => Base.Vector{Int32}, :col_params => Base.Vector{ColParams}, :aggregation_type => Int32, :aggregation_metric => MetricName, :start_index => Int32, :slice_size => Int32]
            meta(target, ListSessionGroupsRequest, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, pack, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ListSessionGroupsRequest[]
    end
end
function Base.getproperty(obj::ListSessionGroupsRequest, name::Symbol)
    if name === :experiment_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :allowed_statuses
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    elseif name === :col_params
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ColParams}
    elseif name === :aggregation_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :aggregation_metric
        return (obj.__protobuf_jl_internal_values[name])::MetricName
    elseif name === :start_index
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :slice_size
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct ListSessionGroupsResponse <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ListSessionGroupsResponse(; kwargs...)
        obj = new(meta(ListSessionGroupsResponse), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ListSessionGroupsResponse
const __meta_ListSessionGroupsResponse = Ref{ProtoMeta}()
function meta(::Type{ListSessionGroupsResponse})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ListSessionGroupsResponse)
            __meta_ListSessionGroupsResponse[] = target = ProtoMeta(ListSessionGroupsResponse)
            fnum = Int[1,3]
            allflds = Pair{Symbol,Union{Type,String}}[:session_groups => Base.Vector{SessionGroup}, :total_size => Int32]
            meta(target, ListSessionGroupsResponse, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ListSessionGroupsResponse[]
    end
end
function Base.getproperty(obj::ListSessionGroupsResponse, name::Symbol)
    if name === :session_groups
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{SessionGroup}
    elseif name === :total_size
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct ListMetricEvalsRequest <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ListMetricEvalsRequest(; kwargs...)
        obj = new(meta(ListMetricEvalsRequest), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ListMetricEvalsRequest
const __meta_ListMetricEvalsRequest = Ref{ProtoMeta}()
function meta(::Type{ListMetricEvalsRequest})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ListMetricEvalsRequest)
            __meta_ListMetricEvalsRequest[] = target = ProtoMeta(ListMetricEvalsRequest)
            fnum = Int[3,1,2]
            allflds = Pair{Symbol,Union{Type,String}}[:experiment_name => AbstractString, :session_name => AbstractString, :metric_name => MetricName]
            meta(target, ListMetricEvalsRequest, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ListMetricEvalsRequest[]
    end
end
function Base.getproperty(obj::ListMetricEvalsRequest, name::Symbol)
    if name === :experiment_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :session_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :metric_name
        return (obj.__protobuf_jl_internal_values[name])::MetricName
    else
        getfield(obj, name)
    end
end

export _DataType, DatasetType, Status, SortOrder, AggregationType, Experiment, HParamInfo, Interval, MetricName, MetricInfo, SessionGroup_HparamsEntry, SessionGroup, MetricValue, Session, GetExperimentRequest, ListSessionGroupsRequest, ColParams, ListSessionGroupsResponse, ListMetricEvalsRequest
# mapentries: "SessionGroup_HparamsEntry" => ("AbstractString", "ProtoBuf.google.protobuf.Value")

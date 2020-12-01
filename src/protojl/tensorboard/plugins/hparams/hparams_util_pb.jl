# syntax: proto3
using ProtoBuf
import ProtoBuf.meta
import ProtoBuf.google.protobuf

mutable struct HParamInfosList <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function HParamInfosList(; kwargs...)
        obj = new(meta(HParamInfosList), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct HParamInfosList
const __meta_HParamInfosList = Ref{ProtoMeta}()
function meta(::Type{HParamInfosList})
    ProtoBuf.metalock() do
        if !isassigned(__meta_HParamInfosList)
            __meta_HParamInfosList[] = target = ProtoMeta(HParamInfosList)
            allflds = Pair{Symbol,Union{Type,String}}[:hparam_infos => Base.Vector{HParamInfo}]
            meta(target, HParamInfosList, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_HParamInfosList[]
    end
end
function Base.getproperty(obj::HParamInfosList, name::Symbol)
    if name === :hparam_infos
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{HParamInfo}
    else
        getfield(obj, name)
    end
end

mutable struct MetricInfosList <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function MetricInfosList(; kwargs...)
        obj = new(meta(MetricInfosList), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct MetricInfosList
const __meta_MetricInfosList = Ref{ProtoMeta}()
function meta(::Type{MetricInfosList})
    ProtoBuf.metalock() do
        if !isassigned(__meta_MetricInfosList)
            __meta_MetricInfosList[] = target = ProtoMeta(MetricInfosList)
            allflds = Pair{Symbol,Union{Type,String}}[:metric_infos => Base.Vector{MetricInfo}]
            meta(target, MetricInfosList, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_MetricInfosList[]
    end
end
function Base.getproperty(obj::MetricInfosList, name::Symbol)
    if name === :metric_infos
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{MetricInfo}
    else
        getfield(obj, name)
    end
end

mutable struct HParams_HparamsEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function HParams_HparamsEntry(; kwargs...)
        obj = new(meta(HParams_HparamsEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct HParams_HparamsEntry (mapentry)
const __meta_HParams_HparamsEntry = Ref{ProtoMeta}()
function meta(::Type{HParams_HparamsEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_HParams_HparamsEntry)
            __meta_HParams_HparamsEntry[] = target = ProtoMeta(HParams_HparamsEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => ProtoBuf.google.protobuf.Value]
            meta(target, HParams_HparamsEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_HParams_HparamsEntry[]
    end
end
function Base.getproperty(obj::HParams_HparamsEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::ProtoBuf.google.protobuf.Value
    else
        getfield(obj, name)
    end
end

mutable struct HParams <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function HParams(; kwargs...)
        obj = new(meta(HParams), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct HParams
const __meta_HParams = Ref{ProtoMeta}()
function meta(::Type{HParams})
    ProtoBuf.metalock() do
        if !isassigned(__meta_HParams)
            __meta_HParams[] = target = ProtoMeta(HParams)
            allflds = Pair{Symbol,Union{Type,String}}[:hparams => Base.Dict{AbstractString,ProtoBuf.google.protobuf.Value}]
            meta(target, HParams, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_HParams[]
    end
end
function Base.getproperty(obj::HParams, name::Symbol)
    if name === :hparams
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{AbstractString,ProtoBuf.google.protobuf.Value}
    else
        getfield(obj, name)
    end
end

export HParamInfosList, MetricInfosList, HParams_HparamsEntry, HParams
# mapentries: "HParams_HparamsEntry" => ("AbstractString", "ProtoBuf.google.protobuf.Value")

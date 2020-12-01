# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

const DataClass = (;[
    Symbol("DATA_CLASS_UNKNOWN") => Int32(0),
    Symbol("DATA_CLASS_SCALAR") => Int32(1),
    Symbol("DATA_CLASS_TENSOR") => Int32(2),
    Symbol("DATA_CLASS_BLOB_SEQUENCE") => Int32(3),
]...)

mutable struct SummaryDescription <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SummaryDescription(; kwargs...)
        obj = new(meta(SummaryDescription), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SummaryDescription
const __meta_SummaryDescription = Ref{ProtoMeta}()
function meta(::Type{SummaryDescription})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SummaryDescription)
            __meta_SummaryDescription[] = target = ProtoMeta(SummaryDescription)
            allflds = Pair{Symbol,Union{Type,String}}[:type_hint => AbstractString]
            meta(target, SummaryDescription, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SummaryDescription[]
    end
end
function Base.getproperty(obj::SummaryDescription, name::Symbol)
    if name === :type_hint
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct HistogramProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function HistogramProto(; kwargs...)
        obj = new(meta(HistogramProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct HistogramProto
const __meta_HistogramProto = Ref{ProtoMeta}()
function meta(::Type{HistogramProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_HistogramProto)
            __meta_HistogramProto[] = target = ProtoMeta(HistogramProto)
            pack = Symbol[:bucket_limit,:bucket]
            allflds = Pair{Symbol,Union{Type,String}}[:min => Float64, :max => Float64, :num => Float64, :sum => Float64, :sum_squares => Float64, :bucket_limit => Base.Vector{Float64}, :bucket => Base.Vector{Float64}]
            meta(target, HistogramProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, pack, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_HistogramProto[]
    end
end
function Base.getproperty(obj::HistogramProto, name::Symbol)
    if name === :min
        return (obj.__protobuf_jl_internal_values[name])::Float64
    elseif name === :max
        return (obj.__protobuf_jl_internal_values[name])::Float64
    elseif name === :num
        return (obj.__protobuf_jl_internal_values[name])::Float64
    elseif name === :sum
        return (obj.__protobuf_jl_internal_values[name])::Float64
    elseif name === :sum_squares
        return (obj.__protobuf_jl_internal_values[name])::Float64
    elseif name === :bucket_limit
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Float64}
    elseif name === :bucket
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Float64}
    else
        getfield(obj, name)
    end
end

mutable struct SummaryMetadata_PluginData <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SummaryMetadata_PluginData(; kwargs...)
        obj = new(meta(SummaryMetadata_PluginData), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SummaryMetadata_PluginData
const __meta_SummaryMetadata_PluginData = Ref{ProtoMeta}()
function meta(::Type{SummaryMetadata_PluginData})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SummaryMetadata_PluginData)
            __meta_SummaryMetadata_PluginData[] = target = ProtoMeta(SummaryMetadata_PluginData)
            allflds = Pair{Symbol,Union{Type,String}}[:plugin_name => AbstractString, :content => Vector{UInt8}]
            meta(target, SummaryMetadata_PluginData, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SummaryMetadata_PluginData[]
    end
end
function Base.getproperty(obj::SummaryMetadata_PluginData, name::Symbol)
    if name === :plugin_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :content
        return (obj.__protobuf_jl_internal_values[name])::Vector{UInt8}
    else
        getfield(obj, name)
    end
end

mutable struct SummaryMetadata <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SummaryMetadata(; kwargs...)
        obj = new(meta(SummaryMetadata), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SummaryMetadata
const __meta_SummaryMetadata = Ref{ProtoMeta}()
function meta(::Type{SummaryMetadata})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SummaryMetadata)
            __meta_SummaryMetadata[] = target = ProtoMeta(SummaryMetadata)
            allflds = Pair{Symbol,Union{Type,String}}[:plugin_data => SummaryMetadata_PluginData, :display_name => AbstractString, :summary_description => AbstractString, :data_class => Int32]
            meta(target, SummaryMetadata, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SummaryMetadata[]
    end
end
function Base.getproperty(obj::SummaryMetadata, name::Symbol)
    if name === :plugin_data
        return (obj.__protobuf_jl_internal_values[name])::SummaryMetadata_PluginData
    elseif name === :display_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :summary_description
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :data_class
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct Summary_Image <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function Summary_Image(; kwargs...)
        obj = new(meta(Summary_Image), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct Summary_Image
const __meta_Summary_Image = Ref{ProtoMeta}()
function meta(::Type{Summary_Image})
    ProtoBuf.metalock() do
        if !isassigned(__meta_Summary_Image)
            __meta_Summary_Image[] = target = ProtoMeta(Summary_Image)
            allflds = Pair{Symbol,Union{Type,String}}[:height => Int32, :width => Int32, :colorspace => Int32, :encoded_image_string => Vector{UInt8}]
            meta(target, Summary_Image, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_Summary_Image[]
    end
end
function Base.getproperty(obj::Summary_Image, name::Symbol)
    if name === :height
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :width
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :colorspace
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :encoded_image_string
        return (obj.__protobuf_jl_internal_values[name])::Vector{UInt8}
    else
        getfield(obj, name)
    end
end

mutable struct Summary_Audio <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function Summary_Audio(; kwargs...)
        obj = new(meta(Summary_Audio), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct Summary_Audio
const __meta_Summary_Audio = Ref{ProtoMeta}()
function meta(::Type{Summary_Audio})
    ProtoBuf.metalock() do
        if !isassigned(__meta_Summary_Audio)
            __meta_Summary_Audio[] = target = ProtoMeta(Summary_Audio)
            allflds = Pair{Symbol,Union{Type,String}}[:sample_rate => Float32, :num_channels => Int64, :length_frames => Int64, :encoded_audio_string => Vector{UInt8}, :content_type => AbstractString]
            meta(target, Summary_Audio, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_Summary_Audio[]
    end
end
function Base.getproperty(obj::Summary_Audio, name::Symbol)
    if name === :sample_rate
        return (obj.__protobuf_jl_internal_values[name])::Float32
    elseif name === :num_channels
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :length_frames
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :encoded_audio_string
        return (obj.__protobuf_jl_internal_values[name])::Vector{UInt8}
    elseif name === :content_type
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct Summary_Value <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function Summary_Value(; kwargs...)
        obj = new(meta(Summary_Value), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct Summary_Value
const __meta_Summary_Value = Ref{ProtoMeta}()
function meta(::Type{Summary_Value})
    ProtoBuf.metalock() do
        if !isassigned(__meta_Summary_Value)
            __meta_Summary_Value[] = target = ProtoMeta(Summary_Value)
            fnum = Int[7,1,9,2,3,4,5,6,8]
            allflds = Pair{Symbol,Union{Type,String}}[:node_name => AbstractString, :tag => AbstractString, :metadata => SummaryMetadata, :simple_value => Float32, :obsolete_old_style_histogram => Vector{UInt8}, :image => Summary_Image, :histo => HistogramProto, :audio => Summary_Audio, :tensor => TensorProto]
            oneofs = Int[0,0,0,1,1,1,1,1,1]
            oneof_names = Symbol[Symbol("value")]
            meta(target, Summary_Value, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, oneofs, oneof_names)
        end
        __meta_Summary_Value[]
    end
end
function Base.getproperty(obj::Summary_Value, name::Symbol)
    if name === :node_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :tag
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :metadata
        return (obj.__protobuf_jl_internal_values[name])::SummaryMetadata
    elseif name === :simple_value
        return (obj.__protobuf_jl_internal_values[name])::Float32
    elseif name === :obsolete_old_style_histogram
        return (obj.__protobuf_jl_internal_values[name])::Vector{UInt8}
    elseif name === :image
        return (obj.__protobuf_jl_internal_values[name])::Summary_Image
    elseif name === :histo
        return (obj.__protobuf_jl_internal_values[name])::HistogramProto
    elseif name === :audio
        return (obj.__protobuf_jl_internal_values[name])::Summary_Audio
    elseif name === :tensor
        return (obj.__protobuf_jl_internal_values[name])::TensorProto
    else
        getfield(obj, name)
    end
end

mutable struct Summary <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function Summary(; kwargs...)
        obj = new(meta(Summary), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct Summary
const __meta_Summary = Ref{ProtoMeta}()
function meta(::Type{Summary})
    ProtoBuf.metalock() do
        if !isassigned(__meta_Summary)
            __meta_Summary[] = target = ProtoMeta(Summary)
            allflds = Pair{Symbol,Union{Type,String}}[:value => Base.Vector{Summary_Value}]
            meta(target, Summary, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_Summary[]
    end
end
function Base.getproperty(obj::Summary, name::Symbol)
    if name === :value
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Summary_Value}
    else
        getfield(obj, name)
    end
end

export DataClass, SummaryDescription, HistogramProto, SummaryMetadata_PluginData, SummaryMetadata, Summary_Image, Summary_Audio, Summary_Value, Summary

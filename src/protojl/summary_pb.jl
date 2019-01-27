# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct HistogramProto <: ProtoType
    min::Float64
    max::Float64
    num::Float64
    sum::Float64
    sum_squares::Float64
    bucket_limit::Base.Vector{Float64}
    bucket::Base.Vector{Float64}
    HistogramProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct HistogramProto
const __pack_HistogramProto = Symbol[:bucket_limit,:bucket]
meta(t::Type{HistogramProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, __pack_HistogramProto, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Summary_Image <: ProtoType
    height::Int32
    width::Int32
    colorspace::Int32
    encoded_image_string::Array{UInt8,1}
    Summary_Image(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Summary_Image

mutable struct Summary_Audio <: ProtoType
    sample_rate::Float32
    num_channels::Int64
    length_frames::Int64
    encoded_audio_string::Array{UInt8,1}
    content_type::AbstractString
    Summary_Audio(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Summary_Audio

mutable struct Summary_Value <: ProtoType
    node_name::AbstractString
    tag::AbstractString
    simple_value::Float32
    obsolete_old_style_histogram::Array{UInt8,1}
    image::Summary_Image
    histo::HistogramProto
    audio::Summary_Audio
    Summary_Value(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Summary_Value
const __fnum_Summary_Value = Int[7,1,2,3,4,5,6]
const __oneofs_Summary_Value = Int[0,0,1,1,1,1,1]
const __oneof_names_Summary_Value = [Symbol("value")]
meta(t::Type{Summary_Value}) = meta(t, ProtoBuf.DEF_REQ, __fnum_Summary_Value, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, __oneofs_Summary_Value, __oneof_names_Summary_Value, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Summary <: ProtoType
    value::Base.Vector{Summary_Value}
    Summary(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Summary

export HistogramProto, Summary_Image, Summary_Audio, Summary_Value, Summary

# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct MultilineChartContent <: ProtoType
    tag::Base.Vector{AbstractString}
    MultilineChartContent(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct MultilineChartContent

mutable struct MarginChartContent_Series <: ProtoType
    value::AbstractString
    lower::AbstractString
    upper::AbstractString
    MarginChartContent_Series(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct MarginChartContent_Series

mutable struct MarginChartContent <: ProtoType
    series::Base.Vector{MarginChartContent_Series}
    MarginChartContent(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct MarginChartContent

mutable struct Chart <: ProtoType
    title::AbstractString
    multiline::MultilineChartContent
    margin::MarginChartContent
    Chart(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Chart
const __oneofs_Chart = Int[0,1,1]
const __oneof_names_Chart = [Symbol("content")]
meta(t::Type{Chart}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, __oneofs_Chart, __oneof_names_Chart, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Category <: ProtoType
    title::AbstractString
    chart::Base.Vector{Chart}
    closed::Bool
    Category(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Category

mutable struct Layout <: ProtoType
    version::Int32
    category::Base.Vector{Category}
    Layout(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Layout

export Chart, MultilineChartContent, MarginChartContent_Series, MarginChartContent, Category, Layout

# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct TextPluginData <: ProtoType
    version::Int32
    TextPluginData(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct TextPluginData

export TextPluginData

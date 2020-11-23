# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct MultilineChartContent <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function MultilineChartContent(; kwargs...)
        obj = new(meta(MultilineChartContent), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct MultilineChartContent
const __meta_MultilineChartContent = Ref{ProtoMeta}()
function meta(::Type{MultilineChartContent})
    ProtoBuf.metalock() do
        if !isassigned(__meta_MultilineChartContent)
            __meta_MultilineChartContent[] = target = ProtoMeta(MultilineChartContent)
            allflds = Pair{Symbol,Union{Type,String}}[:tag => Base.Vector{AbstractString}]
            meta(target, MultilineChartContent, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_MultilineChartContent[]
    end
end
function Base.getproperty(obj::MultilineChartContent, name::Symbol)
    if name === :tag
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    else
        getfield(obj, name)
    end
end

mutable struct MarginChartContent_Series <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function MarginChartContent_Series(; kwargs...)
        obj = new(meta(MarginChartContent_Series), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct MarginChartContent_Series
const __meta_MarginChartContent_Series = Ref{ProtoMeta}()
function meta(::Type{MarginChartContent_Series})
    ProtoBuf.metalock() do
        if !isassigned(__meta_MarginChartContent_Series)
            __meta_MarginChartContent_Series[] = target = ProtoMeta(MarginChartContent_Series)
            allflds = Pair{Symbol,Union{Type,String}}[:value => AbstractString, :lower => AbstractString, :upper => AbstractString]
            meta(target, MarginChartContent_Series, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_MarginChartContent_Series[]
    end
end
function Base.getproperty(obj::MarginChartContent_Series, name::Symbol)
    if name === :value
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :lower
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :upper
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct MarginChartContent <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function MarginChartContent(; kwargs...)
        obj = new(meta(MarginChartContent), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct MarginChartContent
const __meta_MarginChartContent = Ref{ProtoMeta}()
function meta(::Type{MarginChartContent})
    ProtoBuf.metalock() do
        if !isassigned(__meta_MarginChartContent)
            __meta_MarginChartContent[] = target = ProtoMeta(MarginChartContent)
            allflds = Pair{Symbol,Union{Type,String}}[:series => Base.Vector{MarginChartContent_Series}]
            meta(target, MarginChartContent, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_MarginChartContent[]
    end
end
function Base.getproperty(obj::MarginChartContent, name::Symbol)
    if name === :series
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{MarginChartContent_Series}
    else
        getfield(obj, name)
    end
end

mutable struct Chart <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function Chart(; kwargs...)
        obj = new(meta(Chart), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct Chart
const __meta_Chart = Ref{ProtoMeta}()
function meta(::Type{Chart})
    ProtoBuf.metalock() do
        if !isassigned(__meta_Chart)
            __meta_Chart[] = target = ProtoMeta(Chart)
            allflds = Pair{Symbol,Union{Type,String}}[:title => AbstractString, :multiline => MultilineChartContent, :margin => MarginChartContent]
            oneofs = Int[0,1,1]
            oneof_names = Symbol[Symbol("content")]
            meta(target, Chart, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, oneofs, oneof_names)
        end
        __meta_Chart[]
    end
end
function Base.getproperty(obj::Chart, name::Symbol)
    if name === :title
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :multiline
        return (obj.__protobuf_jl_internal_values[name])::MultilineChartContent
    elseif name === :margin
        return (obj.__protobuf_jl_internal_values[name])::MarginChartContent
    else
        getfield(obj, name)
    end
end

mutable struct Category <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function Category(; kwargs...)
        obj = new(meta(Category), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct Category
const __meta_Category = Ref{ProtoMeta}()
function meta(::Type{Category})
    ProtoBuf.metalock() do
        if !isassigned(__meta_Category)
            __meta_Category[] = target = ProtoMeta(Category)
            allflds = Pair{Symbol,Union{Type,String}}[:title => AbstractString, :chart => Base.Vector{Chart}, :closed => Bool]
            meta(target, Category, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_Category[]
    end
end
function Base.getproperty(obj::Category, name::Symbol)
    if name === :title
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :chart
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Chart}
    elseif name === :closed
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct Layout <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function Layout(; kwargs...)
        obj = new(meta(Layout), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct Layout
const __meta_Layout = Ref{ProtoMeta}()
function meta(::Type{Layout})
    ProtoBuf.metalock() do
        if !isassigned(__meta_Layout)
            __meta_Layout[] = target = ProtoMeta(Layout)
            allflds = Pair{Symbol,Union{Type,String}}[:version => Int32, :category => Base.Vector{Category}]
            meta(target, Layout, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_Layout[]
    end
end
function Base.getproperty(obj::Layout, name::Symbol)
    if name === :version
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :category
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Category}
    else
        getfield(obj, name)
    end
end

export Chart, MultilineChartContent, MarginChartContent_Series, MarginChartContent, Category, Layout

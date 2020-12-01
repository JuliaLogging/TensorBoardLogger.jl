# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct DebugTensorWatch <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function DebugTensorWatch(; kwargs...)
        obj = new(meta(DebugTensorWatch), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct DebugTensorWatch
const __meta_DebugTensorWatch = Ref{ProtoMeta}()
function meta(::Type{DebugTensorWatch})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DebugTensorWatch)
            __meta_DebugTensorWatch[] = target = ProtoMeta(DebugTensorWatch)
            allflds = Pair{Symbol,Union{Type,String}}[:node_name => AbstractString, :output_slot => Int32, :debug_ops => Base.Vector{AbstractString}, :debug_urls => Base.Vector{AbstractString}, :tolerate_debug_op_creation_failures => Bool]
            meta(target, DebugTensorWatch, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DebugTensorWatch[]
    end
end
function Base.getproperty(obj::DebugTensorWatch, name::Symbol)
    if name === :node_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :output_slot
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :debug_ops
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :debug_urls
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :tolerate_debug_op_creation_failures
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct DebugOptions <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function DebugOptions(; kwargs...)
        obj = new(meta(DebugOptions), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct DebugOptions
const __meta_DebugOptions = Ref{ProtoMeta}()
function meta(::Type{DebugOptions})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DebugOptions)
            __meta_DebugOptions[] = target = ProtoMeta(DebugOptions)
            fnum = Int[4,10,11]
            allflds = Pair{Symbol,Union{Type,String}}[:debug_tensor_watch_opts => Base.Vector{DebugTensorWatch}, :global_step => Int64, :reset_disk_byte_usage => Bool]
            meta(target, DebugOptions, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DebugOptions[]
    end
end
function Base.getproperty(obj::DebugOptions, name::Symbol)
    if name === :debug_tensor_watch_opts
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{DebugTensorWatch}
    elseif name === :global_step
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :reset_disk_byte_usage
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct DebuggedSourceFile <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function DebuggedSourceFile(; kwargs...)
        obj = new(meta(DebuggedSourceFile), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct DebuggedSourceFile
const __meta_DebuggedSourceFile = Ref{ProtoMeta}()
function meta(::Type{DebuggedSourceFile})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DebuggedSourceFile)
            __meta_DebuggedSourceFile[] = target = ProtoMeta(DebuggedSourceFile)
            allflds = Pair{Symbol,Union{Type,String}}[:host => AbstractString, :file_path => AbstractString, :last_modified => Int64, :bytes => Int64, :lines => Base.Vector{AbstractString}]
            meta(target, DebuggedSourceFile, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DebuggedSourceFile[]
    end
end
function Base.getproperty(obj::DebuggedSourceFile, name::Symbol)
    if name === :host
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :file_path
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :last_modified
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :bytes
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :lines
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    else
        getfield(obj, name)
    end
end

mutable struct DebuggedSourceFiles <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function DebuggedSourceFiles(; kwargs...)
        obj = new(meta(DebuggedSourceFiles), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct DebuggedSourceFiles
const __meta_DebuggedSourceFiles = Ref{ProtoMeta}()
function meta(::Type{DebuggedSourceFiles})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DebuggedSourceFiles)
            __meta_DebuggedSourceFiles[] = target = ProtoMeta(DebuggedSourceFiles)
            allflds = Pair{Symbol,Union{Type,String}}[:source_files => Base.Vector{DebuggedSourceFile}]
            meta(target, DebuggedSourceFiles, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DebuggedSourceFiles[]
    end
end
function Base.getproperty(obj::DebuggedSourceFiles, name::Symbol)
    if name === :source_files
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{DebuggedSourceFile}
    else
        getfield(obj, name)
    end
end

export DebugTensorWatch, DebugOptions, DebuggedSourceFile, DebuggedSourceFiles

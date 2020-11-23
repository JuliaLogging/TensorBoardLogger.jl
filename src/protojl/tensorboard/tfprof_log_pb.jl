# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct CodeDef_Trace <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function CodeDef_Trace(; kwargs...)
        obj = new(meta(CodeDef_Trace), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct CodeDef_Trace
const __meta_CodeDef_Trace = Ref{ProtoMeta}()
function meta(::Type{CodeDef_Trace})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CodeDef_Trace)
            __meta_CodeDef_Trace[] = target = ProtoMeta(CodeDef_Trace)
            fnum = Int[1,6,2,3,7,4,8,5]
            allflds = Pair{Symbol,Union{Type,String}}[:file => AbstractString, :file_id => Int64, :lineno => Int32, :_function => AbstractString, :function_id => Int64, :line => AbstractString, :line_id => Int64, :func_start_line => Int32]
            meta(target, CodeDef_Trace, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CodeDef_Trace[]
    end
end
function Base.getproperty(obj::CodeDef_Trace, name::Symbol)
    if name === :file
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :file_id
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :lineno
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :_function
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :function_id
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :line
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :line_id
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :func_start_line
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct CodeDef <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function CodeDef(; kwargs...)
        obj = new(meta(CodeDef), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct CodeDef
const __meta_CodeDef = Ref{ProtoMeta}()
function meta(::Type{CodeDef})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CodeDef)
            __meta_CodeDef[] = target = ProtoMeta(CodeDef)
            allflds = Pair{Symbol,Union{Type,String}}[:traces => Base.Vector{CodeDef_Trace}]
            meta(target, CodeDef, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CodeDef[]
    end
end
function Base.getproperty(obj::CodeDef, name::Symbol)
    if name === :traces
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{CodeDef_Trace}
    else
        getfield(obj, name)
    end
end

mutable struct OpLogEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function OpLogEntry(; kwargs...)
        obj = new(meta(OpLogEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct OpLogEntry
const __meta_OpLogEntry = Ref{ProtoMeta}()
function meta(::Type{OpLogEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_OpLogEntry)
            __meta_OpLogEntry[] = target = ProtoMeta(OpLogEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:name => AbstractString, :float_ops => Int64, :types => Base.Vector{AbstractString}, :code_def => CodeDef]
            meta(target, OpLogEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_OpLogEntry[]
    end
end
function Base.getproperty(obj::OpLogEntry, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :float_ops
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :types
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :code_def
        return (obj.__protobuf_jl_internal_values[name])::CodeDef
    else
        getfield(obj, name)
    end
end

mutable struct OpLogProto_IdToStringEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function OpLogProto_IdToStringEntry(; kwargs...)
        obj = new(meta(OpLogProto_IdToStringEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct OpLogProto_IdToStringEntry (mapentry)
const __meta_OpLogProto_IdToStringEntry = Ref{ProtoMeta}()
function meta(::Type{OpLogProto_IdToStringEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_OpLogProto_IdToStringEntry)
            __meta_OpLogProto_IdToStringEntry[] = target = ProtoMeta(OpLogProto_IdToStringEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => Int64, :value => AbstractString]
            meta(target, OpLogProto_IdToStringEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_OpLogProto_IdToStringEntry[]
    end
end
function Base.getproperty(obj::OpLogProto_IdToStringEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct OpLogProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function OpLogProto(; kwargs...)
        obj = new(meta(OpLogProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct OpLogProto
const __meta_OpLogProto = Ref{ProtoMeta}()
function meta(::Type{OpLogProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_OpLogProto)
            __meta_OpLogProto[] = target = ProtoMeta(OpLogProto)
            allflds = Pair{Symbol,Union{Type,String}}[:log_entries => Base.Vector{OpLogEntry}, :id_to_string => Base.Dict{Int64,AbstractString}]
            meta(target, OpLogProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_OpLogProto[]
    end
end
function Base.getproperty(obj::OpLogProto, name::Symbol)
    if name === :log_entries
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{OpLogEntry}
    elseif name === :id_to_string
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{Int64,AbstractString}
    else
        getfield(obj, name)
    end
end

mutable struct Tuple <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function Tuple(; kwargs...)
        obj = new(meta(Tuple), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct Tuple
const __meta_Tuple = Ref{ProtoMeta}()
function meta(::Type{Tuple})
    ProtoBuf.metalock() do
        if !isassigned(__meta_Tuple)
            __meta_Tuple[] = target = ProtoMeta(Tuple)
            pack = Symbol[:int64_values]
            allflds = Pair{Symbol,Union{Type,String}}[:int64_values => Base.Vector{Int64}]
            meta(target, Tuple, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, pack, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_Tuple[]
    end
end
function Base.getproperty(obj::Tuple, name::Symbol)
    if name === :int64_values
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int64}
    else
        getfield(obj, name)
    end
end

mutable struct ProfileNode_OutputShapesEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ProfileNode_OutputShapesEntry(; kwargs...)
        obj = new(meta(ProfileNode_OutputShapesEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ProfileNode_OutputShapesEntry (mapentry)
const __meta_ProfileNode_OutputShapesEntry = Ref{ProtoMeta}()
function meta(::Type{ProfileNode_OutputShapesEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ProfileNode_OutputShapesEntry)
            __meta_ProfileNode_OutputShapesEntry[] = target = ProtoMeta(ProfileNode_OutputShapesEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => Int32, :value => Tuple]
            meta(target, ProfileNode_OutputShapesEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ProfileNode_OutputShapesEntry[]
    end
end
function Base.getproperty(obj::ProfileNode_OutputShapesEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::Tuple
    else
        getfield(obj, name)
    end
end

mutable struct ProfileNode_InputShapesEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ProfileNode_InputShapesEntry(; kwargs...)
        obj = new(meta(ProfileNode_InputShapesEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ProfileNode_InputShapesEntry (mapentry)
const __meta_ProfileNode_InputShapesEntry = Ref{ProtoMeta}()
function meta(::Type{ProfileNode_InputShapesEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ProfileNode_InputShapesEntry)
            __meta_ProfileNode_InputShapesEntry[] = target = ProtoMeta(ProfileNode_InputShapesEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => Int32, :value => Tuple]
            meta(target, ProfileNode_InputShapesEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ProfileNode_InputShapesEntry[]
    end
end
function Base.getproperty(obj::ProfileNode_InputShapesEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::Tuple
    else
        getfield(obj, name)
    end
end

mutable struct ExecTime <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ExecTime(; kwargs...)
        obj = new(meta(ExecTime), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ExecTime
const __meta_ExecTime = Ref{ProtoMeta}()
function meta(::Type{ExecTime})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ExecTime)
            __meta_ExecTime[] = target = ProtoMeta(ExecTime)
            allflds = Pair{Symbol,Union{Type,String}}[:times => Base.Vector{Tuple}]
            meta(target, ExecTime, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ExecTime[]
    end
end
function Base.getproperty(obj::ExecTime, name::Symbol)
    if name === :times
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Tuple}
    else
        getfield(obj, name)
    end
end

mutable struct ExecProfile_AcceleratorExecsEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ExecProfile_AcceleratorExecsEntry(; kwargs...)
        obj = new(meta(ExecProfile_AcceleratorExecsEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ExecProfile_AcceleratorExecsEntry (mapentry)
const __meta_ExecProfile_AcceleratorExecsEntry = Ref{ProtoMeta}()
function meta(::Type{ExecProfile_AcceleratorExecsEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ExecProfile_AcceleratorExecsEntry)
            __meta_ExecProfile_AcceleratorExecsEntry[] = target = ProtoMeta(ExecProfile_AcceleratorExecsEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => ExecTime]
            meta(target, ExecProfile_AcceleratorExecsEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ExecProfile_AcceleratorExecsEntry[]
    end
end
function Base.getproperty(obj::ExecProfile_AcceleratorExecsEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::ExecTime
    else
        getfield(obj, name)
    end
end

mutable struct ExecProfile_CpuExecsEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ExecProfile_CpuExecsEntry(; kwargs...)
        obj = new(meta(ExecProfile_CpuExecsEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ExecProfile_CpuExecsEntry (mapentry)
const __meta_ExecProfile_CpuExecsEntry = Ref{ProtoMeta}()
function meta(::Type{ExecProfile_CpuExecsEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ExecProfile_CpuExecsEntry)
            __meta_ExecProfile_CpuExecsEntry[] = target = ProtoMeta(ExecProfile_CpuExecsEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => ExecTime]
            meta(target, ExecProfile_CpuExecsEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ExecProfile_CpuExecsEntry[]
    end
end
function Base.getproperty(obj::ExecProfile_CpuExecsEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::ExecTime
    else
        getfield(obj, name)
    end
end

mutable struct Memory <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function Memory(; kwargs...)
        obj = new(meta(Memory), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct Memory
const __meta_Memory = Ref{ProtoMeta}()
function meta(::Type{Memory})
    ProtoBuf.metalock() do
        if !isassigned(__meta_Memory)
            __meta_Memory[] = target = ProtoMeta(Memory)
            allflds = Pair{Symbol,Union{Type,String}}[:bytes => Int64, :ptr => UInt64]
            meta(target, Memory, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_Memory[]
    end
end
function Base.getproperty(obj::Memory, name::Symbol)
    if name === :bytes
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :ptr
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    else
        getfield(obj, name)
    end
end

mutable struct ExecMemory_OutputMemoryEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ExecMemory_OutputMemoryEntry(; kwargs...)
        obj = new(meta(ExecMemory_OutputMemoryEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ExecMemory_OutputMemoryEntry (mapentry)
const __meta_ExecMemory_OutputMemoryEntry = Ref{ProtoMeta}()
function meta(::Type{ExecMemory_OutputMemoryEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ExecMemory_OutputMemoryEntry)
            __meta_ExecMemory_OutputMemoryEntry[] = target = ProtoMeta(ExecMemory_OutputMemoryEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => Int32, :value => Memory]
            meta(target, ExecMemory_OutputMemoryEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ExecMemory_OutputMemoryEntry[]
    end
end
function Base.getproperty(obj::ExecMemory_OutputMemoryEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::Memory
    else
        getfield(obj, name)
    end
end

mutable struct ExecMemory <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ExecMemory(; kwargs...)
        obj = new(meta(ExecMemory), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ExecMemory
const __meta_ExecMemory = Ref{ProtoMeta}()
function meta(::Type{ExecMemory})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ExecMemory)
            __meta_ExecMemory[] = target = ProtoMeta(ExecMemory)
            allflds = Pair{Symbol,Union{Type,String}}[:memory_micros => Int64, :host_temp_bytes => Int64, :host_persistent_bytes => Int64, :accelerator_temp_bytes => Int64, :accelerator_persistent_bytes => Int64, :requested_bytes => Int64, :peak_bytes => Int64, :residual_bytes => Int64, :output_bytes => Int64, :allocator_bytes_in_use => Int64, :output_memory => Base.Dict{Int32,Memory}]
            meta(target, ExecMemory, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ExecMemory[]
    end
end
function Base.getproperty(obj::ExecMemory, name::Symbol)
    if name === :memory_micros
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :host_temp_bytes
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :host_persistent_bytes
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :accelerator_temp_bytes
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :accelerator_persistent_bytes
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :requested_bytes
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :peak_bytes
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :residual_bytes
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :output_bytes
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :allocator_bytes_in_use
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :output_memory
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{Int32,Memory}
    else
        getfield(obj, name)
    end
end

mutable struct ExecProfile <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ExecProfile(; kwargs...)
        obj = new(meta(ExecProfile), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ExecProfile
const __meta_ExecProfile = Ref{ProtoMeta}()
function meta(::Type{ExecProfile})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ExecProfile)
            __meta_ExecProfile[] = target = ProtoMeta(ExecProfile)
            fnum = Int[1,2,3,4,5,7,11,6]
            allflds = Pair{Symbol,Union{Type,String}}[:run_count => Int64, :all_start_micros => Int64, :latest_end_micros => Int64, :accelerator_execs => Base.Dict{AbstractString,ExecTime}, :cpu_execs => Base.Dict{AbstractString,ExecTime}, :memory_execs => Base.Vector{ExecMemory}, :allocations => Base.Vector{AllocationRecord}, :devices => Base.Vector{AbstractString}]
            meta(target, ExecProfile, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ExecProfile[]
    end
end
function Base.getproperty(obj::ExecProfile, name::Symbol)
    if name === :run_count
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :all_start_micros
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :latest_end_micros
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :accelerator_execs
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{AbstractString,ExecTime}
    elseif name === :cpu_execs
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{AbstractString,ExecTime}
    elseif name === :memory_execs
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ExecMemory}
    elseif name === :allocations
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AllocationRecord}
    elseif name === :devices
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    else
        getfield(obj, name)
    end
end

mutable struct ProfileNode_ExecsEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ProfileNode_ExecsEntry(; kwargs...)
        obj = new(meta(ProfileNode_ExecsEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ProfileNode_ExecsEntry (mapentry)
const __meta_ProfileNode_ExecsEntry = Ref{ProtoMeta}()
function meta(::Type{ProfileNode_ExecsEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ProfileNode_ExecsEntry)
            __meta_ProfileNode_ExecsEntry[] = target = ProtoMeta(ProfileNode_ExecsEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => Int64, :value => ExecProfile]
            meta(target, ProfileNode_ExecsEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ProfileNode_ExecsEntry[]
    end
end
function Base.getproperty(obj::ProfileNode_ExecsEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::ExecProfile
    else
        getfield(obj, name)
    end
end

mutable struct ProfileNode_InputsEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ProfileNode_InputsEntry(; kwargs...)
        obj = new(meta(ProfileNode_InputsEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ProfileNode_InputsEntry (mapentry)
const __meta_ProfileNode_InputsEntry = Ref{ProtoMeta}()
function meta(::Type{ProfileNode_InputsEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ProfileNode_InputsEntry)
            __meta_ProfileNode_InputsEntry[] = target = ProtoMeta(ProfileNode_InputsEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => Int32, :value => Int64]
            meta(target, ProfileNode_InputsEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ProfileNode_InputsEntry[]
    end
end
function Base.getproperty(obj::ProfileNode_InputsEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct ProfileNode_OutputsEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ProfileNode_OutputsEntry(; kwargs...)
        obj = new(meta(ProfileNode_OutputsEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ProfileNode_OutputsEntry (mapentry)
const __meta_ProfileNode_OutputsEntry = Ref{ProtoMeta}()
function meta(::Type{ProfileNode_OutputsEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ProfileNode_OutputsEntry)
            __meta_ProfileNode_OutputsEntry[] = target = ProtoMeta(ProfileNode_OutputsEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => Int32, :value => Int64]
            meta(target, ProfileNode_OutputsEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ProfileNode_OutputsEntry[]
    end
end
function Base.getproperty(obj::ProfileNode_OutputsEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct ProfileNode_SrcOutputIndexEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ProfileNode_SrcOutputIndexEntry(; kwargs...)
        obj = new(meta(ProfileNode_SrcOutputIndexEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ProfileNode_SrcOutputIndexEntry (mapentry)
const __meta_ProfileNode_SrcOutputIndexEntry = Ref{ProtoMeta}()
function meta(::Type{ProfileNode_SrcOutputIndexEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ProfileNode_SrcOutputIndexEntry)
            __meta_ProfileNode_SrcOutputIndexEntry[] = target = ProtoMeta(ProfileNode_SrcOutputIndexEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => Int64, :value => Int32]
            meta(target, ProfileNode_SrcOutputIndexEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ProfileNode_SrcOutputIndexEntry[]
    end
end
function Base.getproperty(obj::ProfileNode_SrcOutputIndexEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct ProfileNode_AttrsEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ProfileNode_AttrsEntry(; kwargs...)
        obj = new(meta(ProfileNode_AttrsEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ProfileNode_AttrsEntry (mapentry)
const __meta_ProfileNode_AttrsEntry = Ref{ProtoMeta}()
function meta(::Type{ProfileNode_AttrsEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ProfileNode_AttrsEntry)
            __meta_ProfileNode_AttrsEntry[] = target = ProtoMeta(ProfileNode_AttrsEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => AttrValue]
            meta(target, ProfileNode_AttrsEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ProfileNode_AttrsEntry[]
    end
end
function Base.getproperty(obj::ProfileNode_AttrsEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::AttrValue
    else
        getfield(obj, name)
    end
end

mutable struct ProfileNode <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ProfileNode(; kwargs...)
        obj = new(meta(ProfileNode), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ProfileNode
const __meta_ProfileNode = Ref{ProtoMeta}()
function meta(::Type{ProfileNode})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ProfileNode)
            __meta_ProfileNode[] = target = ProtoMeta(ProfileNode)
            fnum = Int[1,9,13,2,16,3,15,14,4,5,6,7,8,10,11,12]
            pack = Symbol[:shape]
            allflds = Pair{Symbol,Union{Type,String}}[:name => AbstractString, :op => AbstractString, :id => Int64, :inputs => Base.Dict{Int32,Int64}, :input_shapes => Base.Dict{Int32,Tuple}, :outputs => Base.Dict{Int32,Int64}, :output_shapes => Base.Dict{Int32,Tuple}, :src_output_index => Base.Dict{Int64,Int32}, :shape => Base.Vector{Int64}, :op_types => Base.Vector{AbstractString}, :canonical_device => AbstractString, :host_device => AbstractString, :float_ops => Int64, :trace => CodeDef, :attrs => Base.Dict{AbstractString,AttrValue}, :execs => Base.Dict{Int64,ExecProfile}]
            meta(target, ProfileNode, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, pack, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ProfileNode[]
    end
end
function Base.getproperty(obj::ProfileNode, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :op
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :id
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :inputs
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{Int32,Int64}
    elseif name === :input_shapes
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{Int32,Tuple}
    elseif name === :outputs
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{Int32,Int64}
    elseif name === :output_shapes
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{Int32,Tuple}
    elseif name === :src_output_index
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{Int64,Int32}
    elseif name === :shape
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int64}
    elseif name === :op_types
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :canonical_device
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :host_device
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :float_ops
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :trace
        return (obj.__protobuf_jl_internal_values[name])::CodeDef
    elseif name === :attrs
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{AbstractString,AttrValue}
    elseif name === :execs
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{Int64,ExecProfile}
    else
        getfield(obj, name)
    end
end

mutable struct ProfileProto_NodesEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ProfileProto_NodesEntry(; kwargs...)
        obj = new(meta(ProfileProto_NodesEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ProfileProto_NodesEntry (mapentry)
const __meta_ProfileProto_NodesEntry = Ref{ProtoMeta}()
function meta(::Type{ProfileProto_NodesEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ProfileProto_NodesEntry)
            __meta_ProfileProto_NodesEntry[] = target = ProtoMeta(ProfileProto_NodesEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => Int64, :value => ProfileNode]
            meta(target, ProfileProto_NodesEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ProfileProto_NodesEntry[]
    end
end
function Base.getproperty(obj::ProfileProto_NodesEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::ProfileNode
    else
        getfield(obj, name)
    end
end

mutable struct ProfileProto_IdToStringEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ProfileProto_IdToStringEntry(; kwargs...)
        obj = new(meta(ProfileProto_IdToStringEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ProfileProto_IdToStringEntry (mapentry)
const __meta_ProfileProto_IdToStringEntry = Ref{ProtoMeta}()
function meta(::Type{ProfileProto_IdToStringEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ProfileProto_IdToStringEntry)
            __meta_ProfileProto_IdToStringEntry[] = target = ProtoMeta(ProfileProto_IdToStringEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => Int64, :value => AbstractString]
            meta(target, ProfileProto_IdToStringEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ProfileProto_IdToStringEntry[]
    end
end
function Base.getproperty(obj::ProfileProto_IdToStringEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct ProfileProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ProfileProto(; kwargs...)
        obj = new(meta(ProfileProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ProfileProto
const __meta_ProfileProto = Ref{ProtoMeta}()
function meta(::Type{ProfileProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ProfileProto)
            __meta_ProfileProto[] = target = ProtoMeta(ProfileProto)
            fnum = Int[1,2,5,3,4]
            pack = Symbol[:steps]
            allflds = Pair{Symbol,Union{Type,String}}[:nodes => Base.Dict{Int64,ProfileNode}, :has_trace => Bool, :miss_accelerator_stream => Bool, :steps => Base.Vector{Int64}, :id_to_string => Base.Dict{Int64,AbstractString}]
            meta(target, ProfileProto, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, pack, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ProfileProto[]
    end
end
function Base.getproperty(obj::ProfileProto, name::Symbol)
    if name === :nodes
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{Int64,ProfileNode}
    elseif name === :has_trace
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :miss_accelerator_stream
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :steps
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int64}
    elseif name === :id_to_string
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{Int64,AbstractString}
    else
        getfield(obj, name)
    end
end

export CodeDef_Trace, CodeDef, OpLogEntry, OpLogProto_IdToStringEntry, OpLogProto, ProfileProto_NodesEntry, ProfileProto_IdToStringEntry, ProfileProto, ProfileNode_InputsEntry, ProfileNode_InputShapesEntry, ProfileNode_OutputsEntry, ProfileNode_OutputShapesEntry, ProfileNode_SrcOutputIndexEntry, ProfileNode_AttrsEntry, ProfileNode_ExecsEntry, ProfileNode, ExecProfile_AcceleratorExecsEntry, ExecProfile_CpuExecsEntry, ExecProfile, ExecTime, ExecMemory_OutputMemoryEntry, ExecMemory, Tuple, Memory
# mapentries: "ProfileNode_AttrsEntry" => ("AbstractString", "AttrValue"), "ProfileNode_ExecsEntry" => ("Int64", "ExecProfile"), "ProfileNode_InputsEntry" => ("Int32", "Int64"), "ProfileNode_InputShapesEntry" => ("Int32", "Tuple"), "ExecProfile_CpuExecsEntry" => ("AbstractString", "ExecTime"), "ExecMemory_OutputMemoryEntry" => ("Int32", "Memory"), "ProfileNode_SrcOutputIndexEntry" => ("Int64", "Int32"), "ProfileProto_NodesEntry" => ("Int64", "ProfileNode"), "ExecProfile_AcceleratorExecsEntry" => ("AbstractString", "ExecTime"), "ProfileNode_OutputsEntry" => ("Int32", "Int64"), "OpLogProto_IdToStringEntry" => ("Int64", "AbstractString"), "ProfileNode_OutputShapesEntry" => ("Int32", "Tuple"), "ProfileProto_IdToStringEntry" => ("Int64", "AbstractString")

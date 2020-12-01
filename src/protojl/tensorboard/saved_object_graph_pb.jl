# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct SavedUserObject <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SavedUserObject(; kwargs...)
        obj = new(meta(SavedUserObject), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SavedUserObject
const __meta_SavedUserObject = Ref{ProtoMeta}()
function meta(::Type{SavedUserObject})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SavedUserObject)
            __meta_SavedUserObject[] = target = ProtoMeta(SavedUserObject)
            allflds = Pair{Symbol,Union{Type,String}}[:identifier => AbstractString, :version => VersionDef, :metadata => AbstractString]
            meta(target, SavedUserObject, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SavedUserObject[]
    end
end
function Base.getproperty(obj::SavedUserObject, name::Symbol)
    if name === :identifier
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :version
        return (obj.__protobuf_jl_internal_values[name])::VersionDef
    elseif name === :metadata
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct SavedAsset <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SavedAsset(; kwargs...)
        obj = new(meta(SavedAsset), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SavedAsset
const __meta_SavedAsset = Ref{ProtoMeta}()
function meta(::Type{SavedAsset})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SavedAsset)
            __meta_SavedAsset[] = target = ProtoMeta(SavedAsset)
            allflds = Pair{Symbol,Union{Type,String}}[:asset_file_def_index => Int32]
            meta(target, SavedAsset, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SavedAsset[]
    end
end
function Base.getproperty(obj::SavedAsset, name::Symbol)
    if name === :asset_file_def_index
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct SavedConcreteFunction <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SavedConcreteFunction(; kwargs...)
        obj = new(meta(SavedConcreteFunction), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SavedConcreteFunction
const __meta_SavedConcreteFunction = Ref{ProtoMeta}()
function meta(::Type{SavedConcreteFunction})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SavedConcreteFunction)
            __meta_SavedConcreteFunction[] = target = ProtoMeta(SavedConcreteFunction)
            fnum = Int[2,3,4]
            pack = Symbol[:bound_inputs]
            allflds = Pair{Symbol,Union{Type,String}}[:bound_inputs => Base.Vector{Int32}, :canonicalized_input_signature => StructuredValue, :output_signature => StructuredValue]
            meta(target, SavedConcreteFunction, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, pack, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SavedConcreteFunction[]
    end
end
function Base.getproperty(obj::SavedConcreteFunction, name::Symbol)
    if name === :bound_inputs
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    elseif name === :canonicalized_input_signature
        return (obj.__protobuf_jl_internal_values[name])::StructuredValue
    elseif name === :output_signature
        return (obj.__protobuf_jl_internal_values[name])::StructuredValue
    else
        getfield(obj, name)
    end
end

mutable struct SavedObjectGraph_ConcreteFunctionsEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SavedObjectGraph_ConcreteFunctionsEntry(; kwargs...)
        obj = new(meta(SavedObjectGraph_ConcreteFunctionsEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SavedObjectGraph_ConcreteFunctionsEntry (mapentry)
const __meta_SavedObjectGraph_ConcreteFunctionsEntry = Ref{ProtoMeta}()
function meta(::Type{SavedObjectGraph_ConcreteFunctionsEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SavedObjectGraph_ConcreteFunctionsEntry)
            __meta_SavedObjectGraph_ConcreteFunctionsEntry[] = target = ProtoMeta(SavedObjectGraph_ConcreteFunctionsEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => SavedConcreteFunction]
            meta(target, SavedObjectGraph_ConcreteFunctionsEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SavedObjectGraph_ConcreteFunctionsEntry[]
    end
end
function Base.getproperty(obj::SavedObjectGraph_ConcreteFunctionsEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::SavedConcreteFunction
    else
        getfield(obj, name)
    end
end

mutable struct SavedConstant <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SavedConstant(; kwargs...)
        obj = new(meta(SavedConstant), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SavedConstant
const __meta_SavedConstant = Ref{ProtoMeta}()
function meta(::Type{SavedConstant})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SavedConstant)
            __meta_SavedConstant[] = target = ProtoMeta(SavedConstant)
            allflds = Pair{Symbol,Union{Type,String}}[:operation => AbstractString]
            meta(target, SavedConstant, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SavedConstant[]
    end
end
function Base.getproperty(obj::SavedConstant, name::Symbol)
    if name === :operation
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct SavedVariable <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SavedVariable(; kwargs...)
        obj = new(meta(SavedVariable), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SavedVariable
const __meta_SavedVariable = Ref{ProtoMeta}()
function meta(::Type{SavedVariable})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SavedVariable)
            __meta_SavedVariable[] = target = ProtoMeta(SavedVariable)
            allflds = Pair{Symbol,Union{Type,String}}[:dtype => Int32, :shape => TensorShapeProto, :trainable => Bool, :synchronization => Int32, :aggregation => Int32, :name => AbstractString, :device => AbstractString, :experimental_distributed_variable_components => Base.Vector{SavedVariable}]
            meta(target, SavedVariable, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SavedVariable[]
    end
end
function Base.getproperty(obj::SavedVariable, name::Symbol)
    if name === :dtype
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :shape
        return (obj.__protobuf_jl_internal_values[name])::TensorShapeProto
    elseif name === :trainable
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :synchronization
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :aggregation
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :device
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :experimental_distributed_variable_components
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{SavedVariable}
    else
        getfield(obj, name)
    end
end

const FunctionSpec_ExperimentalCompile = (;[
    Symbol("DEFAULT") => Int32(0),
    Symbol("ON") => Int32(1),
    Symbol("OFF") => Int32(2),
]...)

mutable struct FunctionSpec <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function FunctionSpec(; kwargs...)
        obj = new(meta(FunctionSpec), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct FunctionSpec
const __meta_FunctionSpec = Ref{ProtoMeta}()
function meta(::Type{FunctionSpec})
    ProtoBuf.metalock() do
        if !isassigned(__meta_FunctionSpec)
            __meta_FunctionSpec[] = target = ProtoMeta(FunctionSpec)
            fnum = Int[1,2,5,6]
            allflds = Pair{Symbol,Union{Type,String}}[:fullargspec => StructuredValue, :is_method => Bool, :input_signature => StructuredValue, :experimental_compile => Int32]
            meta(target, FunctionSpec, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_FunctionSpec[]
    end
end
function Base.getproperty(obj::FunctionSpec, name::Symbol)
    if name === :fullargspec
        return (obj.__protobuf_jl_internal_values[name])::StructuredValue
    elseif name === :is_method
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :input_signature
        return (obj.__protobuf_jl_internal_values[name])::StructuredValue
    elseif name === :experimental_compile
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct SavedFunction <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SavedFunction(; kwargs...)
        obj = new(meta(SavedFunction), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SavedFunction
const __meta_SavedFunction = Ref{ProtoMeta}()
function meta(::Type{SavedFunction})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SavedFunction)
            __meta_SavedFunction[] = target = ProtoMeta(SavedFunction)
            allflds = Pair{Symbol,Union{Type,String}}[:concrete_functions => Base.Vector{AbstractString}, :function_spec => FunctionSpec]
            meta(target, SavedFunction, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SavedFunction[]
    end
end
function Base.getproperty(obj::SavedFunction, name::Symbol)
    if name === :concrete_functions
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :function_spec
        return (obj.__protobuf_jl_internal_values[name])::FunctionSpec
    else
        getfield(obj, name)
    end
end

mutable struct SavedBareConcreteFunction <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SavedBareConcreteFunction(; kwargs...)
        obj = new(meta(SavedBareConcreteFunction), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SavedBareConcreteFunction
const __meta_SavedBareConcreteFunction = Ref{ProtoMeta}()
function meta(::Type{SavedBareConcreteFunction})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SavedBareConcreteFunction)
            __meta_SavedBareConcreteFunction[] = target = ProtoMeta(SavedBareConcreteFunction)
            allflds = Pair{Symbol,Union{Type,String}}[:concrete_function_name => AbstractString, :argument_keywords => Base.Vector{AbstractString}, :allowed_positional_arguments => Int64, :function_spec => FunctionSpec]
            meta(target, SavedBareConcreteFunction, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SavedBareConcreteFunction[]
    end
end
function Base.getproperty(obj::SavedBareConcreteFunction, name::Symbol)
    if name === :concrete_function_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :argument_keywords
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :allowed_positional_arguments
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :function_spec
        return (obj.__protobuf_jl_internal_values[name])::FunctionSpec
    else
        getfield(obj, name)
    end
end

mutable struct SavedResource <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SavedResource(; kwargs...)
        obj = new(meta(SavedResource), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SavedResource
const __meta_SavedResource = Ref{ProtoMeta}()
function meta(::Type{SavedResource})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SavedResource)
            __meta_SavedResource[] = target = ProtoMeta(SavedResource)
            allflds = Pair{Symbol,Union{Type,String}}[:device => AbstractString]
            meta(target, SavedResource, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SavedResource[]
    end
end
function Base.getproperty(obj::SavedResource, name::Symbol)
    if name === :device
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct SaveableObject <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SaveableObject(; kwargs...)
        obj = new(meta(SaveableObject), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SaveableObject
const __meta_SaveableObject = Ref{ProtoMeta}()
function meta(::Type{SaveableObject})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SaveableObject)
            __meta_SaveableObject[] = target = ProtoMeta(SaveableObject)
            fnum = Int[2,3]
            allflds = Pair{Symbol,Union{Type,String}}[:save_function => Int32, :restore_function => Int32]
            meta(target, SaveableObject, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SaveableObject[]
    end
end
function Base.getproperty(obj::SaveableObject, name::Symbol)
    if name === :save_function
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :restore_function
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct SavedObject_SaveableObjectsEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SavedObject_SaveableObjectsEntry(; kwargs...)
        obj = new(meta(SavedObject_SaveableObjectsEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SavedObject_SaveableObjectsEntry (mapentry)
const __meta_SavedObject_SaveableObjectsEntry = Ref{ProtoMeta}()
function meta(::Type{SavedObject_SaveableObjectsEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SavedObject_SaveableObjectsEntry)
            __meta_SavedObject_SaveableObjectsEntry[] = target = ProtoMeta(SavedObject_SaveableObjectsEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => SaveableObject]
            meta(target, SavedObject_SaveableObjectsEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SavedObject_SaveableObjectsEntry[]
    end
end
function Base.getproperty(obj::SavedObject_SaveableObjectsEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::SaveableObject
    else
        getfield(obj, name)
    end
end

mutable struct SavedObject <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SavedObject(; kwargs...)
        obj = new(meta(SavedObject), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SavedObject
const __meta_SavedObject = Ref{ProtoMeta}()
function meta(::Type{SavedObject})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SavedObject)
            __meta_SavedObject[] = target = ProtoMeta(SavedObject)
            fnum = Int[1,3,4,5,6,7,8,9,10,11]
            allflds = Pair{Symbol,Union{Type,String}}[:children => Base.Vector{TrackableObjectGraph_TrackableObject_ObjectReference}, :slot_variables => Base.Vector{TrackableObjectGraph_TrackableObject_SlotVariableReference}, :user_object => SavedUserObject, :asset => SavedAsset, :_function => SavedFunction, :variable => SavedVariable, :bare_concrete_function => SavedBareConcreteFunction, :constant => SavedConstant, :resource => SavedResource, :saveable_objects => Base.Dict{AbstractString,SaveableObject}]
            oneofs = Int[0,0,1,1,1,1,1,1,1,0]
            oneof_names = Symbol[Symbol("kind")]
            meta(target, SavedObject, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, oneofs, oneof_names)
        end
        __meta_SavedObject[]
    end
end
function Base.getproperty(obj::SavedObject, name::Symbol)
    if name === :children
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{TrackableObjectGraph_TrackableObject_ObjectReference}
    elseif name === :slot_variables
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{TrackableObjectGraph_TrackableObject_SlotVariableReference}
    elseif name === :user_object
        return (obj.__protobuf_jl_internal_values[name])::SavedUserObject
    elseif name === :asset
        return (obj.__protobuf_jl_internal_values[name])::SavedAsset
    elseif name === :_function
        return (obj.__protobuf_jl_internal_values[name])::SavedFunction
    elseif name === :variable
        return (obj.__protobuf_jl_internal_values[name])::SavedVariable
    elseif name === :bare_concrete_function
        return (obj.__protobuf_jl_internal_values[name])::SavedBareConcreteFunction
    elseif name === :constant
        return (obj.__protobuf_jl_internal_values[name])::SavedConstant
    elseif name === :resource
        return (obj.__protobuf_jl_internal_values[name])::SavedResource
    elseif name === :saveable_objects
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{AbstractString,SaveableObject}
    else
        getfield(obj, name)
    end
end

mutable struct SavedObjectGraph <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SavedObjectGraph(; kwargs...)
        obj = new(meta(SavedObjectGraph), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SavedObjectGraph
const __meta_SavedObjectGraph = Ref{ProtoMeta}()
function meta(::Type{SavedObjectGraph})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SavedObjectGraph)
            __meta_SavedObjectGraph[] = target = ProtoMeta(SavedObjectGraph)
            allflds = Pair{Symbol,Union{Type,String}}[:nodes => Base.Vector{SavedObject}, :concrete_functions => Base.Dict{AbstractString,SavedConcreteFunction}]
            meta(target, SavedObjectGraph, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SavedObjectGraph[]
    end
end
function Base.getproperty(obj::SavedObjectGraph, name::Symbol)
    if name === :nodes
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{SavedObject}
    elseif name === :concrete_functions
        return (obj.__protobuf_jl_internal_values[name])::Base.Dict{AbstractString,SavedConcreteFunction}
    else
        getfield(obj, name)
    end
end

export SavedObjectGraph_ConcreteFunctionsEntry, SavedObjectGraph, SavedObject_SaveableObjectsEntry, SavedObject, SavedUserObject, SavedAsset, SavedFunction, SavedConcreteFunction, SavedBareConcreteFunction, SavedConstant, SavedVariable, FunctionSpec_ExperimentalCompile, FunctionSpec, SavedResource, SaveableObject
# mapentries: "SavedObject_SaveableObjectsEntry" => ("AbstractString", "SaveableObject"), "SavedObjectGraph_ConcreteFunctionsEntry" => ("AbstractString", "SavedConcreteFunction")

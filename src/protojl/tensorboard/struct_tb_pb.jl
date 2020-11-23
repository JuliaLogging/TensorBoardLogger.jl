# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct NoneValue <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function NoneValue(; kwargs...)
        obj = new(meta(NoneValue), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct NoneValue
const __meta_NoneValue = Ref{ProtoMeta}()
function meta(::Type{NoneValue})
    ProtoBuf.metalock() do
        if !isassigned(__meta_NoneValue)
            __meta_NoneValue[] = target = ProtoMeta(NoneValue)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, NoneValue, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_NoneValue[]
    end
end

mutable struct TensorSpecProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function TensorSpecProto(; kwargs...)
        obj = new(meta(TensorSpecProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct TensorSpecProto
const __meta_TensorSpecProto = Ref{ProtoMeta}()
function meta(::Type{TensorSpecProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_TensorSpecProto)
            __meta_TensorSpecProto[] = target = ProtoMeta(TensorSpecProto)
            allflds = Pair{Symbol,Union{Type,String}}[:name => AbstractString, :shape => TensorShapeProto, :dtype => Int32]
            meta(target, TensorSpecProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_TensorSpecProto[]
    end
end
function Base.getproperty(obj::TensorSpecProto, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :shape
        return (obj.__protobuf_jl_internal_values[name])::TensorShapeProto
    elseif name === :dtype
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct BoundedTensorSpecProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function BoundedTensorSpecProto(; kwargs...)
        obj = new(meta(BoundedTensorSpecProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct BoundedTensorSpecProto
const __meta_BoundedTensorSpecProto = Ref{ProtoMeta}()
function meta(::Type{BoundedTensorSpecProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_BoundedTensorSpecProto)
            __meta_BoundedTensorSpecProto[] = target = ProtoMeta(BoundedTensorSpecProto)
            allflds = Pair{Symbol,Union{Type,String}}[:name => AbstractString, :shape => TensorShapeProto, :dtype => Int32, :minimum => TensorProto, :maximum => TensorProto]
            meta(target, BoundedTensorSpecProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_BoundedTensorSpecProto[]
    end
end
function Base.getproperty(obj::BoundedTensorSpecProto, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :shape
        return (obj.__protobuf_jl_internal_values[name])::TensorShapeProto
    elseif name === :dtype
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :minimum
        return (obj.__protobuf_jl_internal_values[name])::TensorProto
    elseif name === :maximum
        return (obj.__protobuf_jl_internal_values[name])::TensorProto
    else
        getfield(obj, name)
    end
end

mutable struct StructuredValue <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function StructuredValue(; kwargs...)
        obj = new(meta(StructuredValue), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct StructuredValue (has cyclic type dependency)
const __meta_StructuredValue = Ref{ProtoMeta}()
function meta(::Type{StructuredValue})
    ProtoBuf.metalock() do
        if !isassigned(__meta_StructuredValue)
            __meta_StructuredValue[] = target = ProtoMeta(StructuredValue)
            fnum = Int[1,11,12,13,14,31,32,33,34,35,51,52,53,54]
            wtype = Dict(:int64_value => :sint64)
            allflds = Pair{Symbol,Union{Type,String}}[:none_value => NoneValue, :float64_value => Float64, :int64_value => Int64, :string_value => AbstractString, :bool_value => Bool, :tensor_shape_value => TensorShapeProto, :tensor_dtype_value => Int32, :tensor_spec_value => TensorSpecProto, :type_spec_value => "TypeSpecProto", :bounded_tensor_spec_value => BoundedTensorSpecProto, :list_value => "ListValue", :tuple_value => "TupleValue", :dict_value => "DictValue", :named_tuple_value => "NamedTupleValue"]
            oneofs = Int[1,1,1,1,1,1,1,1,1,1,1,1,1,1]
            oneof_names = Symbol[Symbol("kind")]
            meta(target, StructuredValue, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, wtype, oneofs, oneof_names)
        end
        __meta_StructuredValue[]
    end
end
function Base.getproperty(obj::StructuredValue, name::Symbol)
    if name === :none_value
        return (obj.__protobuf_jl_internal_values[name])::NoneValue
    elseif name === :float64_value
        return (obj.__protobuf_jl_internal_values[name])::Float64
    elseif name === :int64_value
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :string_value
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :bool_value
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :tensor_shape_value
        return (obj.__protobuf_jl_internal_values[name])::TensorShapeProto
    elseif name === :tensor_dtype_value
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :tensor_spec_value
        return (obj.__protobuf_jl_internal_values[name])::TensorSpecProto
    elseif name === :type_spec_value
        return (obj.__protobuf_jl_internal_values[name])::Any
    elseif name === :bounded_tensor_spec_value
        return (obj.__protobuf_jl_internal_values[name])::BoundedTensorSpecProto
    elseif name === :list_value
        return (obj.__protobuf_jl_internal_values[name])::Any
    elseif name === :tuple_value
        return (obj.__protobuf_jl_internal_values[name])::Any
    elseif name === :dict_value
        return (obj.__protobuf_jl_internal_values[name])::Any
    elseif name === :named_tuple_value
        return (obj.__protobuf_jl_internal_values[name])::Any
    else
        getfield(obj, name)
    end
end

mutable struct ListValue <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ListValue(; kwargs...)
        obj = new(meta(ListValue), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ListValue (has cyclic type dependency)
const __meta_ListValue = Ref{ProtoMeta}()
function meta(::Type{ListValue})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ListValue)
            __meta_ListValue[] = target = ProtoMeta(ListValue)
            allflds = Pair{Symbol,Union{Type,String}}[:values => Base.Vector{StructuredValue}]
            meta(target, ListValue, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ListValue[]
    end
end
function Base.getproperty(obj::ListValue, name::Symbol)
    if name === :values
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{StructuredValue}
    else
        getfield(obj, name)
    end
end

mutable struct TupleValue <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function TupleValue(; kwargs...)
        obj = new(meta(TupleValue), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct TupleValue (has cyclic type dependency)
const __meta_TupleValue = Ref{ProtoMeta}()
function meta(::Type{TupleValue})
    ProtoBuf.metalock() do
        if !isassigned(__meta_TupleValue)
            __meta_TupleValue[] = target = ProtoMeta(TupleValue)
            allflds = Pair{Symbol,Union{Type,String}}[:values => Base.Vector{StructuredValue}]
            meta(target, TupleValue, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_TupleValue[]
    end
end
function Base.getproperty(obj::TupleValue, name::Symbol)
    if name === :values
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{StructuredValue}
    else
        getfield(obj, name)
    end
end

mutable struct DictValue_FieldsEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function DictValue_FieldsEntry(; kwargs...)
        obj = new(meta(DictValue_FieldsEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct DictValue_FieldsEntry (mapentry) (has cyclic type dependency)
const __meta_DictValue_FieldsEntry = Ref{ProtoMeta}()
function meta(::Type{DictValue_FieldsEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DictValue_FieldsEntry)
            __meta_DictValue_FieldsEntry[] = target = ProtoMeta(DictValue_FieldsEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => StructuredValue]
            meta(target, DictValue_FieldsEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DictValue_FieldsEntry[]
    end
end
function Base.getproperty(obj::DictValue_FieldsEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::StructuredValue
    else
        getfield(obj, name)
    end
end

mutable struct DictValue <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function DictValue(; kwargs...)
        obj = new(meta(DictValue), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct DictValue (has cyclic type dependency)
const __meta_DictValue = Ref{ProtoMeta}()
function meta(::Type{DictValue})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DictValue)
            __meta_DictValue[] = target = ProtoMeta(DictValue)
            allflds = Pair{Symbol,Union{Type,String}}[:fields => "Base.Dict{AbstractString,StructuredValue}"]
            meta(target, DictValue, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DictValue[]
    end
end
function Base.getproperty(obj::DictValue, name::Symbol)
    if name === :fields
        return (obj.__protobuf_jl_internal_values[name])::Any
    else
        getfield(obj, name)
    end
end

mutable struct PairValue <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function PairValue(; kwargs...)
        obj = new(meta(PairValue), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct PairValue (has cyclic type dependency)
const __meta_PairValue = Ref{ProtoMeta}()
function meta(::Type{PairValue})
    ProtoBuf.metalock() do
        if !isassigned(__meta_PairValue)
            __meta_PairValue[] = target = ProtoMeta(PairValue)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => StructuredValue]
            meta(target, PairValue, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_PairValue[]
    end
end
function Base.getproperty(obj::PairValue, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::StructuredValue
    else
        getfield(obj, name)
    end
end

mutable struct NamedTupleValue <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function NamedTupleValue(; kwargs...)
        obj = new(meta(NamedTupleValue), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct NamedTupleValue (has cyclic type dependency)
const __meta_NamedTupleValue = Ref{ProtoMeta}()
function meta(::Type{NamedTupleValue})
    ProtoBuf.metalock() do
        if !isassigned(__meta_NamedTupleValue)
            __meta_NamedTupleValue[] = target = ProtoMeta(NamedTupleValue)
            allflds = Pair{Symbol,Union{Type,String}}[:name => AbstractString, :values => Base.Vector{PairValue}]
            meta(target, NamedTupleValue, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_NamedTupleValue[]
    end
end
function Base.getproperty(obj::NamedTupleValue, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :values
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{PairValue}
    else
        getfield(obj, name)
    end
end

const TypeSpecProto_TypeSpecClass = (;[
    Symbol("UNKNOWN") => Int32(0),
    Symbol("SPARSE_TENSOR_SPEC") => Int32(1),
    Symbol("INDEXED_SLICES_SPEC") => Int32(2),
    Symbol("RAGGED_TENSOR_SPEC") => Int32(3),
    Symbol("TENSOR_ARRAY_SPEC") => Int32(4),
    Symbol("DATA_DATASET_SPEC") => Int32(5),
    Symbol("DATA_ITERATOR_SPEC") => Int32(6),
    Symbol("OPTIONAL_SPEC") => Int32(7),
    Symbol("PER_REPLICA_SPEC") => Int32(8),
    Symbol("VARIABLE_SPEC") => Int32(9),
    Symbol("ROW_PARTITION_SPEC") => Int32(10),
    Symbol("NDARRAY_SPEC") => Int32(11),
]...)

mutable struct TypeSpecProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function TypeSpecProto(; kwargs...)
        obj = new(meta(TypeSpecProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct TypeSpecProto (has cyclic type dependency)
const __meta_TypeSpecProto = Ref{ProtoMeta}()
function meta(::Type{TypeSpecProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_TypeSpecProto)
            __meta_TypeSpecProto[] = target = ProtoMeta(TypeSpecProto)
            allflds = Pair{Symbol,Union{Type,String}}[:type_spec_class => Int32, :type_state => StructuredValue, :type_spec_class_name => AbstractString]
            meta(target, TypeSpecProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_TypeSpecProto[]
    end
end
function Base.getproperty(obj::TypeSpecProto, name::Symbol)
    if name === :type_spec_class
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :type_state
        return (obj.__protobuf_jl_internal_values[name])::StructuredValue
    elseif name === :type_spec_class_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

export StructuredValue, NoneValue, ListValue, TupleValue, DictValue_FieldsEntry, DictValue, PairValue, NamedTupleValue, TensorSpecProto, BoundedTensorSpecProto, TypeSpecProto_TypeSpecClass, TypeSpecProto, StructuredValue, ListValue, TupleValue, DictValue_FieldsEntry, DictValue, PairValue, NamedTupleValue, TypeSpecProto_TypeSpecClass, TypeSpecProto
# mapentries: "DictValue_FieldsEntry" => ("AbstractString", "StructuredValue")

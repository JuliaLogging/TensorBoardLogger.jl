# syntax: proto3
using ProtoBuf
import ProtoBuf.meta
import ProtoBuf.google.protobuf

mutable struct CollectionDef_NodeList <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function CollectionDef_NodeList(; kwargs...)
        obj = new(meta(CollectionDef_NodeList), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct CollectionDef_NodeList
const __meta_CollectionDef_NodeList = Ref{ProtoMeta}()
function meta(::Type{CollectionDef_NodeList})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CollectionDef_NodeList)
            __meta_CollectionDef_NodeList[] = target = ProtoMeta(CollectionDef_NodeList)
            allflds = Pair{Symbol,Union{Type,String}}[:value => Base.Vector{AbstractString}]
            meta(target, CollectionDef_NodeList, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CollectionDef_NodeList[]
    end
end
function Base.getproperty(obj::CollectionDef_NodeList, name::Symbol)
    if name === :value
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    else
        getfield(obj, name)
    end
end

mutable struct CollectionDef_BytesList <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function CollectionDef_BytesList(; kwargs...)
        obj = new(meta(CollectionDef_BytesList), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct CollectionDef_BytesList
const __meta_CollectionDef_BytesList = Ref{ProtoMeta}()
function meta(::Type{CollectionDef_BytesList})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CollectionDef_BytesList)
            __meta_CollectionDef_BytesList[] = target = ProtoMeta(CollectionDef_BytesList)
            allflds = Pair{Symbol,Union{Type,String}}[:value => Base.Vector{Vector{UInt8}}]
            meta(target, CollectionDef_BytesList, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CollectionDef_BytesList[]
    end
end
function Base.getproperty(obj::CollectionDef_BytesList, name::Symbol)
    if name === :value
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Vector{UInt8}}
    else
        getfield(obj, name)
    end
end

mutable struct CollectionDef_Int64List <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function CollectionDef_Int64List(; kwargs...)
        obj = new(meta(CollectionDef_Int64List), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct CollectionDef_Int64List
const __meta_CollectionDef_Int64List = Ref{ProtoMeta}()
function meta(::Type{CollectionDef_Int64List})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CollectionDef_Int64List)
            __meta_CollectionDef_Int64List[] = target = ProtoMeta(CollectionDef_Int64List)
            pack = Symbol[:value]
            allflds = Pair{Symbol,Union{Type,String}}[:value => Base.Vector{Int64}]
            meta(target, CollectionDef_Int64List, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, pack, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CollectionDef_Int64List[]
    end
end
function Base.getproperty(obj::CollectionDef_Int64List, name::Symbol)
    if name === :value
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int64}
    else
        getfield(obj, name)
    end
end

mutable struct CollectionDef_FloatList <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function CollectionDef_FloatList(; kwargs...)
        obj = new(meta(CollectionDef_FloatList), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct CollectionDef_FloatList
const __meta_CollectionDef_FloatList = Ref{ProtoMeta}()
function meta(::Type{CollectionDef_FloatList})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CollectionDef_FloatList)
            __meta_CollectionDef_FloatList[] = target = ProtoMeta(CollectionDef_FloatList)
            pack = Symbol[:value]
            allflds = Pair{Symbol,Union{Type,String}}[:value => Base.Vector{Float32}]
            meta(target, CollectionDef_FloatList, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, pack, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CollectionDef_FloatList[]
    end
end
function Base.getproperty(obj::CollectionDef_FloatList, name::Symbol)
    if name === :value
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Float32}
    else
        getfield(obj, name)
    end
end

mutable struct CollectionDef_AnyList <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function CollectionDef_AnyList(; kwargs...)
        obj = new(meta(CollectionDef_AnyList), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct CollectionDef_AnyList
const __meta_CollectionDef_AnyList = Ref{ProtoMeta}()
function meta(::Type{CollectionDef_AnyList})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CollectionDef_AnyList)
            __meta_CollectionDef_AnyList[] = target = ProtoMeta(CollectionDef_AnyList)
            allflds = Pair{Symbol,Union{Type,String}}[:value => Base.Vector{ProtoBuf.google.protobuf._Any}]
            meta(target, CollectionDef_AnyList, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CollectionDef_AnyList[]
    end
end
function Base.getproperty(obj::CollectionDef_AnyList, name::Symbol)
    if name === :value
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ProtoBuf.google.protobuf._Any}
    else
        getfield(obj, name)
    end
end

mutable struct CollectionDef <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function CollectionDef(; kwargs...)
        obj = new(meta(CollectionDef), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct CollectionDef
const __meta_CollectionDef = Ref{ProtoMeta}()
function meta(::Type{CollectionDef})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CollectionDef)
            __meta_CollectionDef[] = target = ProtoMeta(CollectionDef)
            allflds = Pair{Symbol,Union{Type,String}}[:node_list => CollectionDef_NodeList, :bytes_list => CollectionDef_BytesList, :int64_list => CollectionDef_Int64List, :float_list => CollectionDef_FloatList, :any_list => CollectionDef_AnyList]
            oneofs = Int[1,1,1,1,1]
            oneof_names = Symbol[Symbol("kind")]
            meta(target, CollectionDef, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, oneofs, oneof_names)
        end
        __meta_CollectionDef[]
    end
end
function Base.getproperty(obj::CollectionDef, name::Symbol)
    if name === :node_list
        return (obj.__protobuf_jl_internal_values[name])::CollectionDef_NodeList
    elseif name === :bytes_list
        return (obj.__protobuf_jl_internal_values[name])::CollectionDef_BytesList
    elseif name === :int64_list
        return (obj.__protobuf_jl_internal_values[name])::CollectionDef_Int64List
    elseif name === :float_list
        return (obj.__protobuf_jl_internal_values[name])::CollectionDef_FloatList
    elseif name === :any_list
        return (obj.__protobuf_jl_internal_values[name])::CollectionDef_AnyList
    else
        getfield(obj, name)
    end
end

mutable struct MetaGraphDef_CollectionDefEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function MetaGraphDef_CollectionDefEntry(; kwargs...)
        obj = new(meta(MetaGraphDef_CollectionDefEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct MetaGraphDef_CollectionDefEntry (mapentry)
const __meta_MetaGraphDef_CollectionDefEntry = Ref{ProtoMeta}()
function meta(::Type{MetaGraphDef_CollectionDefEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_MetaGraphDef_CollectionDefEntry)
            __meta_MetaGraphDef_CollectionDefEntry[] = target = ProtoMeta(MetaGraphDef_CollectionDefEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => CollectionDef]
            meta(target, MetaGraphDef_CollectionDefEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_MetaGraphDef_CollectionDefEntry[]
    end
end
function Base.getproperty(obj::MetaGraphDef_CollectionDefEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::CollectionDef
    else
        getfield(obj, name)
    end
end

mutable struct MetaGraphDef_SignatureDefEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function MetaGraphDef_SignatureDefEntry(; kwargs...)
        obj = new(meta(MetaGraphDef_SignatureDefEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct MetaGraphDef_SignatureDefEntry (mapentry) (has cyclic type dependency)
const __meta_MetaGraphDef_SignatureDefEntry = Ref{ProtoMeta}()
function meta(::Type{MetaGraphDef_SignatureDefEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_MetaGraphDef_SignatureDefEntry)
            __meta_MetaGraphDef_SignatureDefEntry[] = target = ProtoMeta(MetaGraphDef_SignatureDefEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => "SignatureDef"]
            meta(target, MetaGraphDef_SignatureDefEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_MetaGraphDef_SignatureDefEntry[]
    end
end
function Base.getproperty(obj::MetaGraphDef_SignatureDefEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::Any
    else
        getfield(obj, name)
    end
end

mutable struct MetaGraphDef <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function MetaGraphDef(; kwargs...)
        obj = new(meta(MetaGraphDef), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct MetaGraphDef (has cyclic type dependency)
const __meta_MetaGraphDef = Ref{ProtoMeta}()
function meta(::Type{MetaGraphDef})
    ProtoBuf.metalock() do
        if !isassigned(__meta_MetaGraphDef)
            __meta_MetaGraphDef[] = target = ProtoMeta(MetaGraphDef)
            allflds = Pair{Symbol,Union{Type,String}}[:meta_info_def => MetaGraphDef_MetaInfoDef, :graph_def => GraphDef, :saver_def => SaverDef, :collection_def => "Base.Dict{AbstractString,CollectionDef}", :signature_def => "Base.Dict{AbstractString,SignatureDef}", :asset_file_def => "Base.Vector{AssetFileDef}", :object_graph_def => SavedObjectGraph]
            meta(target, MetaGraphDef, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_MetaGraphDef[]
    end
end
function Base.getproperty(obj::MetaGraphDef, name::Symbol)
    if name === :meta_info_def
        return (obj.__protobuf_jl_internal_values[name])::MetaGraphDef_MetaInfoDef
    elseif name === :graph_def
        return (obj.__protobuf_jl_internal_values[name])::GraphDef
    elseif name === :saver_def
        return (obj.__protobuf_jl_internal_values[name])::SaverDef
    elseif name === :collection_def
        return (obj.__protobuf_jl_internal_values[name])::Any
    elseif name === :signature_def
        return (obj.__protobuf_jl_internal_values[name])::Any
    elseif name === :asset_file_def
        return (obj.__protobuf_jl_internal_values[name])::Any
    elseif name === :object_graph_def
        return (obj.__protobuf_jl_internal_values[name])::SavedObjectGraph
    else
        getfield(obj, name)
    end
end

mutable struct TensorInfo_CompositeTensor <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function TensorInfo_CompositeTensor(; kwargs...)
        obj = new(meta(TensorInfo_CompositeTensor), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct TensorInfo_CompositeTensor (has cyclic type dependency)
const __meta_TensorInfo_CompositeTensor = Ref{ProtoMeta}()
function meta(::Type{TensorInfo_CompositeTensor})
    ProtoBuf.metalock() do
        if !isassigned(__meta_TensorInfo_CompositeTensor)
            __meta_TensorInfo_CompositeTensor[] = target = ProtoMeta(TensorInfo_CompositeTensor)
            allflds = Pair{Symbol,Union{Type,String}}[:type_spec => TypeSpecProto, :components => "Base.Vector{TensorInfo}"]
            meta(target, TensorInfo_CompositeTensor, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_TensorInfo_CompositeTensor[]
    end
end
function Base.getproperty(obj::TensorInfo_CompositeTensor, name::Symbol)
    if name === :type_spec
        return (obj.__protobuf_jl_internal_values[name])::TypeSpecProto
    elseif name === :components
        return (obj.__protobuf_jl_internal_values[name])::Any
    else
        getfield(obj, name)
    end
end

mutable struct TensorInfo <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function TensorInfo(; kwargs...)
        obj = new(meta(TensorInfo), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct TensorInfo (has cyclic type dependency)
const __meta_TensorInfo = Ref{ProtoMeta}()
function meta(::Type{TensorInfo})
    ProtoBuf.metalock() do
        if !isassigned(__meta_TensorInfo)
            __meta_TensorInfo[] = target = ProtoMeta(TensorInfo)
            fnum = Int[1,4,5,2,3]
            allflds = Pair{Symbol,Union{Type,String}}[:name => AbstractString, :coo_sparse => TensorInfo_CooSparse, :composite_tensor => TensorInfo_CompositeTensor, :dtype => Int32, :tensor_shape => TensorShapeProto]
            oneofs = Int[1,1,1,0,0]
            oneof_names = Symbol[Symbol("encoding")]
            meta(target, TensorInfo, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, oneofs, oneof_names)
        end
        __meta_TensorInfo[]
    end
end
function Base.getproperty(obj::TensorInfo, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :coo_sparse
        return (obj.__protobuf_jl_internal_values[name])::TensorInfo_CooSparse
    elseif name === :composite_tensor
        return (obj.__protobuf_jl_internal_values[name])::TensorInfo_CompositeTensor
    elseif name === :dtype
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :tensor_shape
        return (obj.__protobuf_jl_internal_values[name])::TensorShapeProto
    else
        getfield(obj, name)
    end
end

mutable struct SignatureDef_InputsEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SignatureDef_InputsEntry(; kwargs...)
        obj = new(meta(SignatureDef_InputsEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SignatureDef_InputsEntry (mapentry) (has cyclic type dependency)
const __meta_SignatureDef_InputsEntry = Ref{ProtoMeta}()
function meta(::Type{SignatureDef_InputsEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SignatureDef_InputsEntry)
            __meta_SignatureDef_InputsEntry[] = target = ProtoMeta(SignatureDef_InputsEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => TensorInfo]
            meta(target, SignatureDef_InputsEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SignatureDef_InputsEntry[]
    end
end
function Base.getproperty(obj::SignatureDef_InputsEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::TensorInfo
    else
        getfield(obj, name)
    end
end

mutable struct SignatureDef_OutputsEntry <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SignatureDef_OutputsEntry(; kwargs...)
        obj = new(meta(SignatureDef_OutputsEntry), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SignatureDef_OutputsEntry (mapentry) (has cyclic type dependency)
const __meta_SignatureDef_OutputsEntry = Ref{ProtoMeta}()
function meta(::Type{SignatureDef_OutputsEntry})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SignatureDef_OutputsEntry)
            __meta_SignatureDef_OutputsEntry[] = target = ProtoMeta(SignatureDef_OutputsEntry)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => TensorInfo]
            meta(target, SignatureDef_OutputsEntry, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SignatureDef_OutputsEntry[]
    end
end
function Base.getproperty(obj::SignatureDef_OutputsEntry, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::TensorInfo
    else
        getfield(obj, name)
    end
end

mutable struct SignatureDef <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SignatureDef(; kwargs...)
        obj = new(meta(SignatureDef), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SignatureDef (has cyclic type dependency)
const __meta_SignatureDef = Ref{ProtoMeta}()
function meta(::Type{SignatureDef})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SignatureDef)
            __meta_SignatureDef[] = target = ProtoMeta(SignatureDef)
            allflds = Pair{Symbol,Union{Type,String}}[:inputs => "Base.Dict{AbstractString,TensorInfo}", :outputs => "Base.Dict{AbstractString,TensorInfo}", :method_name => AbstractString]
            meta(target, SignatureDef, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SignatureDef[]
    end
end
function Base.getproperty(obj::SignatureDef, name::Symbol)
    if name === :inputs
        return (obj.__protobuf_jl_internal_values[name])::Any
    elseif name === :outputs
        return (obj.__protobuf_jl_internal_values[name])::Any
    elseif name === :method_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct AssetFileDef <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function AssetFileDef(; kwargs...)
        obj = new(meta(AssetFileDef), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct AssetFileDef (has cyclic type dependency)
const __meta_AssetFileDef = Ref{ProtoMeta}()
function meta(::Type{AssetFileDef})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AssetFileDef)
            __meta_AssetFileDef[] = target = ProtoMeta(AssetFileDef)
            allflds = Pair{Symbol,Union{Type,String}}[:tensor_info => TensorInfo, :filename => AbstractString]
            meta(target, AssetFileDef, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_AssetFileDef[]
    end
end
function Base.getproperty(obj::AssetFileDef, name::Symbol)
    if name === :tensor_info
        return (obj.__protobuf_jl_internal_values[name])::TensorInfo
    elseif name === :filename
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

export MetaGraphDef_MetaInfoDef_FunctionAliasesEntry, MetaGraphDef_MetaInfoDef, MetaGraphDef_CollectionDefEntry, MetaGraphDef_SignatureDefEntry, MetaGraphDef, CollectionDef_NodeList, CollectionDef_BytesList, CollectionDef_Int64List, CollectionDef_FloatList, CollectionDef_AnyList, CollectionDef, TensorInfo_CooSparse, TensorInfo_CompositeTensor, TensorInfo, SignatureDef_InputsEntry, SignatureDef_OutputsEntry, SignatureDef, AssetFileDef, MetaGraphDef_SignatureDefEntry, MetaGraphDef, TensorInfo_CompositeTensor, TensorInfo, SignatureDef_InputsEntry, SignatureDef_OutputsEntry, SignatureDef, AssetFileDef
# mapentries: "MetaGraphDef_MetaInfoDef_FunctionAliasesEntry" => ("AbstractString", "AbstractString"), "MetaGraphDef_SignatureDefEntry" => ("AbstractString", "SignatureDef"), "MetaGraphDef_CollectionDefEntry" => ("AbstractString", "CollectionDef"), "SignatureDef_InputsEntry" => ("AbstractString", "TensorInfo"), "SignatureDef_OutputsEntry" => ("AbstractString", "TensorInfo")

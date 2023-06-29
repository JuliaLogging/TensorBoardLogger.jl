using .tensorboard: NodeDef, AttrValue, NameAttrList
using .tensorboard: var"AttrValue.ListValue" as AttrValue_ListValue

"""
    log_graph
"""
function log_graph(logger::TBLogger, g::AbstractGraph; step = nothing, nodelabel::Vector{String} = map(string, vertices(g)), nodeop::Vector{String} = map(string, vertices(g)), nodedevice::Vector{String} = fill("cpu", nv(g)), nodevalue::Vector{Any} = fill(nothing, nv(g)))
    nv(g) == length(nodelabel)  || throw(ArgumentError("length of nodelable must be same as number of vertices"))
    nv(g) == length(nodeop)  || throw(ArgumentError("length of nodeop must be same as number of vertices"))
    nv(g) == length(nodedevice)  || throw(ArgumentError("length of nodedevice must be same as number of vertices"))
    nv(g) == length(nodevalue)  || throw(ArgumentError("length of nodevalue must be same as number of vertices"))
    summ = SummaryCollection(graph_summary(g, nodelabel, nodeop, nodedevice, nodevalue))
    write_event(logger.file, make_event(logger, summ, step=step))
end

function graph_summary(g, nodelabel, nodeop, nodedevice, nodevalue)
    nodes = Vector{NodeDef}()
    for v in vertices(g)
        name = nodelabel[v]
        op = nodeop[v]
        input = [nodelabel[x] for x in inneighbors(g, v)]
        device = nodedevice[v]
        attr = Dict{String, AttrValue}()
        x = nodevalue[v]
        if isa(x, AbstractString)
            attr["value"] = AttrValue(OneOf(:s, Vector{UInt8}(x)))
            attr["dtype"] = AttrValue(OneOf(:_type,jltype2tf(typeof(x))))
        elseif isa(x, Integer)
            attr["value"] = AttrValue(OneOf(:i,Int64(x)))
            attr["dtype"] = AttrValue(OneOf(:_type, jltype2tf(typeof(x))))
        elseif isa(x, Real)
            attr["value"] = AttrValue(OneOf(:f, Float32(x)))
            attr["dtype"] = AttrValue(OneOf(:_type, jltype2tf(typeof(x))))
        elseif isa(x, Bool)
            attr["value"] = AttrValue(OneOf(:b, x))
            attr["dtype"] = AttrValue(OneOf(:_type, jltype2tf(typeof(x))))
        elseif isa(x, AbstractArray)
            shape = TensorShapeProto([TensorShapeProto_Dim(d, "") for d in (collect(size(x)))], false)
            t = TensorProto(dtype = jltype2tf(eltype(x)), tensor_shape = shape, tensor_content = serialize_proto(string(x)))
            attr["value"] = AttrValue(OneOf(:tensor, t))
            listvalue = AttrValue_ListValue(Vector{Vector{UInt8}}(),
                                            Vector{Int64}(),
                                            Vector{Float32}(),
                                            Vector{Bool}(),
                                            Vector{var"#DataType".T}(), 
                                            [shape],
                                            Vector{TensorProto}(), 
                                            Vector{NameAttrList}())
            attr["_output_shapes"] = AttrValue(OneOf(:list, listvalue))
        elseif isa(x, Tuple)
            listvalue = AttrValue_ListValue([Vector{UInt8}(repr(y)) for y in x],
                                            Vector{Int64}(),
                                            Vector{Float32}(),
                                            Vector{Bool}(),
                                            Vector{var"#DataType".T}(), 
                                            Vector{TensorShapeProto}(),
                                            Vector{TensorProto}(), 
                                            Vector{NameAttrList}())
            attr["value"] = AttrValue(OneOf(:list, listvalue))
            shape = TensorShapeProto([TensorShapeProto_Dim(length(x), "")], false)
            listvalue = AttrValue_ListValue(Vector{Vector{UInt8}}(),
                                            Vector{Int64}(),
                                            Vector{Float32}(),
                                            Vector{Bool}(),
                                            Vector{var"#DataType".T}(), 
                                            [shape],
                                            Vector{TensorProto}(), 
                                            Vector{NameAttrList}())
            attr["_output_shapes"] = AttrValue(OneOf(:list, listvalue))
        elseif isa(x, Function)
            attr["value"] = AttrValue(OneOf(:func, NameAttrList(name = repr(x))))
        else
            #donothing
        end
        node = NodeDef(name, op, input, device, attr, nothing, nothing)
        push!(nodes, node)
    end
    GraphDef(nodes, nothing, 0, nothing, nothing)
end

function jltype2tf(dtype::DataType)
    nodetype =
    dtype == UInt8				? _DataType.DT_UINT8 :
    dtype == UInt16				? _DataType.DT_UINT16 :
    dtype == UInt32				? _DataType.DT_UINT32 :
    dtype == UInt64				? _DataType.DT_UINT64 :
    dtype == Int8				? _DataType.DT_INT8 :
    dtype == Int16				? _DataType.DT_INT16 :
    dtype == Int32				? _DataType.DT_INT32 :
    dtype == Int64				? _DataType.DT_INT64 :
    dtype == Float16			? _DataType.DT_BFLOAT16 :
    dtype == Float32			? _DataType.DT_FLOAT :
    dtype == Float64			? _DataType.DT_DOUBLE :
    dtype <: AbstractString		? _DataType.DT_STRING :
    dtype == Bool				? _DataType.DT_BOOL :
    dtype ∈ [Complex{Float32},
            Complex{Float16},
            Complex{UInt8},
            Complex{UInt16},
            Complex{UInt32},
            Complex{Int8},
            Complex{Int16},
            Complex{Int32}]		? _DataType.DT_COMPLEX64 :
    dtype ∈ [Complex{Float64},
            Complex{UInt64},
            Complex{Int64}]		? _DataType.DT_COMPLEX128 :
    _DataType.DT_INVALID
end

"""
	log_graph
"""
function log_graph(logger::TBLogger, name::AbstractString, g::AbstractGraph; step = nothing, nodelabel = nothing, nodeop = nothing, nodedevice = nothing, nodevalue = nothing)
	summ = SummaryCollection(graph_summary(name, g, nodelabel, nodeop, nodedevice , nodevalue))
    write_event(logger.file, make_event(logger, summ, step=step))
end

function graph_summary(name, g, nodelabel, nodeop, nodedevice, nodevalue)
	@info "WIP"
	function getdtype(dtype)
		nodetype =
		dtype == nothing			? _DataType.DT_INVALID :
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
		@error "Unknown Datatype" dtype
	end
	nodes = Vector{NodeDef}()
	if nodelabel == nothing
		nodelabel = collect(vertices(g))
	end
	if nodeop == nothing
		nodeop = collect(1:nv(g));
	end
	if nodedevice == nothing
		nodedevice = fill("cpu", nv(g));
	end
	if nodevalue == nothing
		nodevalue = fill(nothing, nv(g));
	end
	for v in 1:nv(g)
		name = repr(nodelabel[v])
		op = repr(nodeop[v])
		input = [repr(nodelabel[x]) for x in inneighbors(g, v)]
		device = repr(nodedevice[v])
		attr = Dict{String, AttrValue}()
		x = nodevalue[v]
		if isa(x, AbstractString)
			attr["val"] = AttrValue(s = Vector{UInt8}(x))
			attr["dtype"] = AttrValue(_type = getdtype(typeof(x)))
		elseif isa(x, Integer)
			attr["val"] = AttrValue(i = Int64(x))
			attr["dtype"] = AttrValue(_type = getdtype(typeof(x)))
		elseif isa(x, Real)
			attr["val"] = AttrValue(f = Float32(x))
			attr["dtype"] = AttrValue(_type = getdtype(typeof(x)))
		elseif isa(x, Bool)
			attr["val"] = AttrValue(b = x)
			attr["dtype"] = AttrValue(_type = getdtype(typeof(x)))
		elseif isa(x, AbstractArray)
			shape = TensorShapeProto(dim = [TensorShapeProto_Dim(size = d) for d in (collect(size(x)))])
			t = TensorProto(dtype = getdtype(eltype(x)), tensor_shape = shape, tensor_content = serialize_proto(x))
			attr["tensor"] = AttrValue(tensor = t)
		end
		node = NodeDef(name = name, op = op, input = input, device = device, attr = attr)
		push!(nodes, node)
	end
	GraphDef(node = nodes)
end

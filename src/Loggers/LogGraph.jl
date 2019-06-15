"""
	log_graph
"""
function log_graph(logger::TBLogger, name::AbstractString, g::AbstractGraph; step = nothing, nodelabel::Vector{String} = map(string, vertices(g)), nodeop::Vector{String} = map(string, vertices(g)), nodedevice::Vector{String} = fill("cpu", nv(g)), nodevalue::Vector{Any} = fill(nothing, nv(g)))
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
	for v in vertices(g)
		name = nodelabel[v]
		op = nodeop[v]
		input = [nodelabel[x] for x in inneighbors(g, v)]
		device = nodedevice[v]
		attr = Dict{String, AttrValue}()
		x = nodevalue[v]
		if isa(x, AbstractString)
			attr["value"] = AttrValue(s = Vector{UInt8}(x))
			attr["dtype"] = AttrValue(_type = getdtype(typeof(x)))
		elseif isa(x, Integer)
			attr["value"] = AttrValue(i = Int64(x))
			attr["dtype"] = AttrValue(_type = getdtype(typeof(x)))
		elseif isa(x, Real)
			attr["value"] = AttrValue(f = Float32(x))
			attr["dtype"] = AttrValue(_type = getdtype(typeof(x)))
		elseif isa(x, Bool)
			attr["value"] = AttrValue(b = x)
			attr["dtype"] = AttrValue(_type = getdtype(typeof(x)))
		elseif isa(x, AbstractArray)
			shape = TensorShapeProto(dim = [TensorShapeProto_Dim(size = d) for d in (collect(size(x)))])
			t = TensorProto(dtype = getdtype(eltype(x)), tensor_shape = shape, tensor_content = serialize_proto(string(x)))
			attr["value"] = AttrValue(tensor = t)
			attr["_output_shapes"] = AttrValue(list = AttrValue_ListValue(shape = [shape]))
		elseif isa(x, Function)
			attr["value"] = AttrValue(func = NameAttrList(name = repr(x)))
		elseif x == nothing
			#donothing
		else
			@error "unhandled nodevalue type"
		end
		node = NodeDef(name = name, op = op, input = input, device = device, attr = attr)
		push!(nodes, node)
	end
	GraphDef(node = nodes)
end

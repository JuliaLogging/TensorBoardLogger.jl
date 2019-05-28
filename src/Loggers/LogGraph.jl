"""
    log_graph(logger::TBLogger, name::AbstractString, model::Chain, dummy)
logs a Chain variable with name `name`
- value: A model of datatype Chain
- dummy: dummy input data to the model
"""

function log_graph(logger::TBLogger, name::AbstractString, value::Chain, dummy; step = nothing)
	summ = SummaryCollection(graph_summary(name, value, dummy))
    write_event(logger.file, make_event(logger, summ, step=step))
end

function graph_summary(name::String, model::Chain, dummy)
	@info "WIP"
	#utility functions
	#function to get node attributes
	function getnodeattr(tarray)
		#determine type of tarray
		dtype = eltype(tarray.data)
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
		dtype == AbstractString		? _DataType.DT_STRING :
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
		throw("Unknown Datatype")

		nodeattr = Dict("_output_shapes" => AttrValue(list = AttrValue_ListValue(shape = [TensorShapeProto(dim = [TensorShapeProto_Dim(size = x) for x in (collect(size(tarray)))])])),
						"shape" => AttrValue(list = AttrValue_ListValue(shape = [TensorShapeProto(dim = [TensorShapeProto_Dim(size = x) for x in (collect(size(tarray)))])])),
						"dtype" => AttrValue(_type = nodetype))
	end
	#creates nodes using Tracked Arrays
	function operation(Tnode)
		function digdeeper(f) #dig deep into tracker to find input arrays
			if isa(f, Module) || isa(f, DataType) || isa(f, Nothing)
				return
			end
			for fname in fieldnames(typeof(f))
				field = getfield(f, fname)
				if isa(field, TrackedArray) || isa(field, TrackedMatrix) || isa(field, TrackedVector)
					push!(Tinputs, field) #identify and insert inputs to this node
				else
					digdeeper(field)
				end
			end
		end
		function getnodename(op)
			return String(methods(op).mt.name)
		end
		Tinputs = []
		#lookup if Tnode already exists
		if haskey(Tarrays, Tnode) #what will i do if it already exists?
			return Tarrays[Tnode].name
		else
			#create new node for this TrackedArray
			#First determine the node name which is the operation performed which resulted in this trackedarray
			#keep going deep inside tracker to precisely identify the operation and arguments
			op = Tnode.tracker.f.func
			#Todo: identify opname
			node_name = getnodename(op)
			if !isa(op, Nothing)#this is a not a leaf
				digdeeper(op)
			end
			node_op = node_name
			if haskey(namepool, node_name)
				namepool[node_name] += 1
			else
				namepool[node_name] = 0
			end
			node_name = join(prefix,"/")*"/" * node_name *"_"* string(namepool[node_name])
			node_attr = getnodeattr(Tnode)
			node_input = Vector([operation(X) for X in Tinputs])
			if isempty(Tinputs)
				new_node = NodeDef(name = node_name, op = node_op, attr = node_attr)
			else
				new_node = NodeDef(name = node_name, op = node_op, attr = node_attr, input = node_input)
			end
			push!(Nodes, new_node)
			Tarrays[Tnode] = new_node
			return node_name
		end
	end
	#propagates dummy through model and generates graph
	# creates prefix for subgraphs
	# recursively calls applychain if argument is another Chain
	# calls trackfunction on each layer
	function applychain(model)
		if haskey(namepool, "Chain") #Check if Chain is already there in nodes
			namepool["Chain"] += 1
		else
			namepool["Chain"] = 0
		end
		push!(prefix,"Chain_"*string(namepool["Chain"]))
		for layer in model.layers
			if isa(layer, Chain) #another subgraph inside this function
				applychain(layer)
			else #create new subgraph for this function
				layer_ast = Meta.parse(repr(layer))
				subgraphname = string(layer_ast.args[1]) #gets name of the function
				#Todo: get arguments too

				if haskey(namepool, subgraphname)
					namepool[subgraphname] += 1
				else
					namepool[subgraphname] = 0
				end
				subgraphname = subgraphname *"_"* string(namepool[subgraphname])
				push!(prefix, subgraphname)
				Output = layer(Input)#forward propagation through this layer
				input = operation(Output)#perform operation to get opnodes
				Input = Output
				pop!(prefix)
			end
		end
		pop!(prefix)
	end

	namepool = Dict{String, Integer}() #required to give unique name to each node
	prefix = Vector{String}() #to make subgraphs
	Nodes = Vector{NodeDef}() #all nodes to be plotted
	Tarrays = Dict{Any, NodeDef}() #keeping track of tracked arrays :P
	Input = dummy

	#Create input node using dummy
	init_node_name = "Input"
	init_node_op = "input"
	init_node_attr = getnodeattr(Input)
	init_node = NodeDef(name = init_node_name, op = init_node_op, attr = init_node_attr)
	push!(Nodes, init_node)
	namepool[init_node_name] = 0
	Tarrays[Input] = init_node
	input = ""

	applychain(model)

	#Create output node
	fin_node_name = "Output"
	fin_node_op = "output"
	fin_node_attr = getnodeattr(Input)
	fin_node_input = Vector([input])
	last_node = NodeDef(name = fin_node_name, op = fin_node_op, attr = fin_node_attr, input = fin_node_input)
	push!(Nodes, last_node)
	return GraphDef(node = Vector(Nodes))
end
"""
TODO
incorporate:
1) grads for TrackedArray and optimizer
2) loss (or accuracy or any metric functions)
3) gpu/cpu device
4) simple Arrays as opnodes along with trackedarray
5) names of ops and trackedarrays
"""

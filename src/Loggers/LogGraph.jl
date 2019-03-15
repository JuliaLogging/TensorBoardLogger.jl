"""
    log_graph(logger, name, model)
	currenly logs a Chain variable with name
"""

using Flux

function log_graph(logger::Logger, name::String, value::Chain, dummy)
    #summ    = SummaryCollection()
    #push!(summ.value, graph_summary(name, value))
    graph_def = graph_summary(name, value, dummy)
    iob = PipeBuffer()
    writeproto(iob, graph_def)
    serial_graph_def = iob.data
    write_event(logger.file, Event(graph_def = serial_graph_def))
end

"""
Sample input
]
activate .
import TensorBoardLogger
using .TensorBoardLogger
using Flux
model = Chain(Conv((3,3), 3=>9))
lgr = Logger("/home/shashi/TensorBoardLogger")
dummy = param(rand(9,9,3,1))
log_graph(lgr, "string",model, dummy)

"""
function graph_summary(name::String, model::Chain, dummy)
	@info "WIP"
	namepool = Dict{String, Integer}() #required to give unique name to each node
	prefixes = [] #to make subgraphs
	Nodes = [] #all nodes to be plotted
	Tarrays = Dict{Any, NodeDef}() #keeping track of tracked arrays :P
	Input = Float32.(dummy)
	#Create input node using dummy
	init_node_name = "Input"
	init_node_op = "input"
	init_node_attr = Dict("_output_shapes" => AttrValue(list = AttrValue_ListValue(shape = Vector([TensorShapeProto(dim = Vector([TensorShapeProto_Dim(size = x) for x in (collect(size(Input)))]))]))),
	"shape" => AttrValue(list = AttrValue_ListValue(shape = Vector([TensorShapeProto(dim = Vector([TensorShapeProto_Dim(size = x) for x in (collect(size(Input)))]))]))),
	"dtype" => AttrValue(s = Array{UInt8}(repr(typeof(Input)))))
	init_node = NodeDef(name = init_node_name, op = init_node_op, attr = init_node_attr)
	push!(Nodes, init_node)
	namepool[init_node_name] = 0
	Tarrays[Input] = init_node
	function operation(Tnode)
	"""
		creates nodes using Tracked Arrays
	"""
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
		#lookup if Tnode already exists
		Tinputs = []
		if haskey(Tarrays, Tnode) #what will i do if it already exists?
			return Tarrays[Tnode].name
		else
			#create new node for this TrackedArray
			#First determine the node name which is the operation performed which resulted in this trackedarray
			#keep going deep inside tracker to precisely identify the operation and arguments
			op = Tnode.tracker.f.func
			if !isa(op, Nothing)#this is a not a leaf
				digdeeper(op)
			end
			node_name = "op"
			if haskey(namepool, node_name)
				namepool[node_name] += 1
			else
				namepool[node_name] = 0
			end
			node_op = lowercase(node_name)
			node_name = join(prefixes,"/")*"/" * node_name *"_"* string(namepool[node_name])
			node_shape = Vector([TensorShapeProto(dim = Vector([TensorShapeProto_Dim(size = x) for x in (collect(size(Tnode)))]))])
			node_attr = Dict("_output_shapes" => AttrValue(list = AttrValue_ListValue(shape = node_shape)),
			"shape" => AttrValue(list = AttrValue_ListValue(shape = node_shape)),
			"dtype" => AttrValue(s = Array{UInt8}(repr(typeof(Tnode)))))
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
	function applychain(model)
	"""
		creates prefixes for subgraphs
		recursively calls applychain if argument is another Chain
		calls trackfunction on each layer
	"""
		if haskey(namepool, "Chain") #Check if Chain is already there in nodes
			namepool["Chain"] += 1
		else
			namepool["Chain"] = 0
		end
		push!(prefixes,"Chain_"*string(namepool["Chain"]))
		for layer in model.layers
			if isa(layer, Chain)
				#new subgraph for this function
				applychain(layer)
			else
				#create new subgraph for this function
				layer_ast = Meta.parse(repr(layer))
				prefix = string(layer_ast.args[1])
				if haskey(namepool, prefix)
					namepool[prefix] += 1
				else
					namepool[prefix] = 0
				end
				prefix = prefix *"_"* string(namepool[prefix])
				push!(prefixes, prefix)
				Output = layer(Input)
				input = operation(Output)
				Input = Output
				pop!(prefixes)
			end
		end
		pop!(prefixes)
	end
	if isa(model, Chain)
		applychain(model)
	else
		Output = model(Input)
		input = operation(Output)
		Input = Output
	end

	fin_node_name = "Output"
	fin_node_op = "output"
	fin_node_attr = Dict("_output_shapes" => AttrValue(list = AttrValue_ListValue(shape = Vector([TensorShapeProto(dim = Vector([TensorShapeProto_Dim(size = x) for x in (collect(size(Input)))]))]))),
	"shape" => AttrValue(list = AttrValue_ListValue(shape = Vector([TensorShapeProto(dim = Vector([TensorShapeProto_Dim(size = x) for x in (collect(size(Input)))]))]))),
	"dtype" => AttrValue(s = Array{UInt8}(repr(typeof(Input)))))
	fin_node_input = Vector([input])
	last_node = NodeDef(name = fin_node_name, op = fin_node_op, attr = fin_node_attr, input = fin_node_input)
	push!(Nodes, last_node)
	@info "Nodelist:"
	for node in Nodes
		@info node
	end
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

"""
    log_graph(logger, name, model)
	currenly logs a Chain variable with name
"""

using Flux

function log_graph(logger::Logger, name::String, value::Tuple)
    @info "WIP"
    #summ    = SummaryCollection()
    #push!(summ.value, graph_summary(name, value))
    graph_def = graph_summary(name, value)
    iob = PipeBuffer()
    writeproto(iob, graph_def)
    serial_graph_def = iob.data
    write_event(logger.file, Event(graph_def = serial_graph_def))
end
function log_graph(logger::Logger, name::String, value::Chain)
    @info "WIP"
    #summ    = SummaryCollection()
    #push!(summ.value, graph_summary(name, value))
    graph_def = graph_summary(name, value)
    iob = PipeBuffer()
    writeproto(iob, graph_def)
    serial_graph_def = iob.data
    write_event(logger.file, Event(graph_def = serial_graph_def))
end
function graph_summary(name::String, model::Chain)
	@info "WIP"
	function unravel(expr::Expr)
		@info expr
		dead_end = true #means cannot expand further
		if expr.head == :call
			push!(prefixes, string(expr.args[1]))
			for arg in expr.args[2:end]
				if typeof(arg) == Expr
					dead_end = false #can be further expanded
					unravel(arg)
				end
			end
			pop!(prefixes)
		end
		if dead_end == true
			name = join(prefixes,"/")*"/"*string(expr)
			push!(Nodes, NodeDef(name = name, op = name, input = Vector([prevnode]))) #insert inner nodes
			prevnode = name
		end
	end
	Nodes = []
	prevnode = "Init"
	push!(Nodes, NodeDef(name = prevnode, op = prevnode)) #insert init node
	prefixes = []
	model_ir = Meta.parse(string(model))
	unravel(model_ir)
	push!(Nodes, NodeDef(name = "Out", op = "Out", input = Vector([prevnode]))) #insert Out node
	GraphDef(node = Vector(Nodes))
end
function graph_summary(name::String, model::Tuple) #old method
	@info "WIP"
	"""
	GraphDef takes 4 arguments
	node : vector of type NodeDef
	versions : of type VersionDef (Producer, minconsumer, badconsumer)
	version : of type Int32 deprecated
	library : of type FunctionDefLibrary (experimental / remove)
	"""
	Node = []
	prevnode = "Init"
	push!(Node, NodeDef(name = prevnode, op = prevnode)) #insert init node
	for layer in model #Iterate over each layer
		name = "Chain/"*repr(typeof(layer).name) #Obtain name of the layer (The Datatype: Dense, Conv etc)
		push!(Node, NodeDef(name = name, op = name, input = Vector([prevnode])))
		prevnode = name
	end
	GraphDef(node = Vector(Node))
end

"""
import TensorBoardLogger
using .TensorBoardLogger
using Flux
model = Chain(Dense(20, 20, relu), x -> 2*x, softmax)
lgr = Logger("/home/shashi/TensorBoardLogger")
log_graph(lgr, "string", model)
"""

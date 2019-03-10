"""
    log_graph(logger, name, model)
	currenly logs a Chain variable with name
"""

using Flux

function log_graph(logger::Logger, name::String, value::Chain)
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
		#@info expr
		dead_end = true #means cannot expand further
		if expr.head == :call
			node_name = string(expr.args[1])
			org_name = node_name
			incr = 1
			for name in Names #this is to allow repeated nodes of same type by appending a number
				if name == node_name
					node_name = org_name*"_$incr"
					incr += 1
				end
			end
			push!(prefixes, node_name)
			push!(Names, node_name)
			for arg in expr.args[2:end]
				if typeof(arg) == Expr
					dead_end = false #can be further expanded
					unravel(arg)
				end
			end
			pop!(prefixes)
		end
		if dead_end == true
		    node_name = join(prefixes,"/")*"/"*string(expr)
			org_name = node_name
			incr = 1
			for name in Names #this is to allow repeated nodes of same type by appending a number
				if name == node_name
					node_name = org_name*"_$incr"
					incr += 1
				end
			end
			push!(Names, node_name)
			push!(Nodes, NodeDef(name = node_name, op = node_name, input = Vector([prevnode]))) #insert inner nodes
			prevnode = node_name
		end
	end
	Nodes = []
	Names = []
	prevnode = "Init"
	push!(Nodes, NodeDef(name = prevnode, op = prevnode)) #insert init node
	prefixes = []
	model_ir = Meta.parse(string(model))
	unravel(model_ir)
	push!(Nodes, NodeDef(name = "Out", op = "Out", input = Vector([prevnode]))) #insert Out node
	GraphDef(node = Vector(Nodes))
end

"""
import TensorBoardLogger
using .TensorBoardLogger
using Flux
using Metalhead
using JLD2, FileIO

#model = Chain(Dense(20, 20, relu), Dense(20, 20, leakyrelu), Dense(20, 20), Dense(20, 20), x -> 2*x, softmax)
model = @load "model.jld2" tinyResNet
lgr = Logger("/home/shashi/TensorBoardLogger")
log_graph(lgr, "string", model)
"""

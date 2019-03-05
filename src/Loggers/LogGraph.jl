"""
    log_graph(logger, name, model)

currenly logs a Chain variable with name
"""
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

function graph_summary(name::String, model::Tuple)
	@info "WIP"
	"""
	GraphDef takes 4 arguments
	node : vector of type NodeDef
	versions : of type VersionDef (Producer, minconsumer, badconsumer)
	version : of type Int32 deprecated
	library : of type FunctionDefLibrary (experimental / remove)
	"""
	Node = []
	prevnode = "X"
	for layer in model #Iterate over each layer
		name = repr(typeof(layer).name) #Obtain name of the layer (The Datatype: Dense, Conv etc)
		push!(Node, NodeDef(name = name, op = name, input = Vector([prevnode])))
		prevnode = name
	end
	GraphDef(node = Vector(Node))
end

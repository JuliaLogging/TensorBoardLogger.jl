"""
	log_graph
"""
function log_graph(logger::TBLogger, name::AbstractString, g::AbstractGraph; step = nothing)
	summ = SummaryCollection(graph_summary(name, g))
    write_event(logger.file, make_event(logger, summ, step=step))
end

function graph_summary(name::String, g::AbstractGraph)
	@info "WIP"
	nodes = Vector{NodeDef}()
	for v in 1:nv(g)
		node = NodeDef(name = repr(v), op = "vertex", input = [repr(x) for x in inneighbors(g, v)])
		push!(nodes, node)
	end
	GraphDef(node = nodes)
end

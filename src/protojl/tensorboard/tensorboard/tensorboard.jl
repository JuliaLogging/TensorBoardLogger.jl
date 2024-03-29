module tensorboard

include("../google/google.jl")

include("saver_pb.jl")
include("graph_debug_info_pb.jl")
include("tensor_shape_pb.jl")
include("trackable_object_graph_pb.jl")
include("allocation_description_pb.jl")
include("coordination_config_pb.jl")
include("debug_pb.jl")
include("rpc_options_pb.jl")
include("histogram_pb.jl")
include("types_pb.jl")
include("verifier_config_pb.jl")
include("versions_pb.jl")
include("variable_pb.jl")
include("full_type_pb.jl")
include("cluster_pb.jl")
include("tensor_description_pb.jl")
include("resource_handle_pb.jl")
include("cost_graph_pb.jl")
include("cpp_shape_inference_pb.jl")
include("step_stats_pb.jl")
include("tensor_pb.jl")
include("struct_tb_pb.jl")
include("attr_value_pb.jl")
include("summary_pb.jl")
include("saved_object_graph_pb.jl")
include("rewriter_config_pb.jl")
include("api_def_pb.jl")
include("node_def_pb.jl")
include("op_def_pb.jl")
include("tfprof_log_pb.jl")
include("event_pb.jl")
include("function_pb.jl")
include("graph_pb.jl")
include("meta_graph_pb.jl")
include("config_pb.jl")

end # module tensorboard

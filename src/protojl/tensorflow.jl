module tensorflow
  const _ProtoBuf_Top_ = @static isdefined(parentmodule(@__MODULE__), :_ProtoBuf_Top_) ? (parentmodule(@__MODULE__))._ProtoBuf_Top_ : parentmodule(@__MODULE__)
  include("resource_handle_pb.jl")
  include("tensor_shape_pb.jl")
  include("types_pb.jl")
  include("tensor_pb.jl")
  include("attr_value_pb.jl")
  include("node_def_pb.jl")
  include("op_def_pb.jl")
  include("function_pb.jl")
  include("versions_pb.jl")
  include("graph_pb.jl")
end

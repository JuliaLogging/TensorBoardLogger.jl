module tensorflow
  const _ProtoBuf_Top_ = @static isdefined(parentmodule(@__MODULE__), :_ProtoBuf_Top_) ? (parentmodule(@__MODULE__))._ProtoBuf_Top_ : parentmodule(@__MODULE__)
  include("resource_handle_pb.jl")
  include("tensor_shape_pb.jl")
  include("types_pb.jl")
  include("tensor_pb.jl")
  include("summary_pb.jl")
end

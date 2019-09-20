using TensorBoardLogger, Logging, Plots
using Test


@testset "Optional: Plots.jl" begin
logger = TBLogger("test_logs/Plots-jl", tb_overwrite)
p = plot(rand(5))
p2 = plot(rand(10))
with_logger(logger) do
    @info "dispatch" p
    @info "dispatch" twoplots=[p, p2]
end
log_image(logger, "explicit/p", p)

# test serialization
pb = PipeBuffer()
show(pb, MIME("image/png"), p)
data = TensorBoardLogger.preprocess("key", p, Vector())
@test length(data) == 1
@test first(data[1]) == "key"
@test last(data[1]) isa TensorBoardLogger.PNG
@test last(data[1]).data == pb.data

# test unpacking of array of plots
data = TensorBoardLogger.preprocess("key", [p, p], Vector())
@test length(data) == 2
@test first(data[1]) == "key/1"
@test first(data[2]) == "key/2"
@test last(data[1]) isa TensorBoardLogger.PNG
@test last(data[2]) isa TensorBoardLogger.PNG
end

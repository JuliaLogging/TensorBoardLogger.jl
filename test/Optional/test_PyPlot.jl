using TensorBoardLogger, Logging
using PyPlot
using Test


@testset "Optional: PyPlot.jl" begin
logger = TBLogger(test_log_dir*"PyPlots-jl", tb_overwrite)
p = plot(rand(5))[1].figure;
p2 = plot(rand(10))[1].figure;
with_logger(logger) do
    @info "dispatch" p
    @info "dispatch" twoplots=[p, p2]
end
log_image(logger, "explicit/p", p)
log_image(logger, "explicit/twoplots", [p,p2])

# test serialization
pb = PipeBuffer()
show(pb, MIME("image/png"), p)
data = TensorBoardLogger.preprocess("key", p, Vector())
@test length(data) == 1
@test first(data[1]) == "key"
@test last(data[1]) isa TensorBoardLogger.PngImage
@test last(data[1]).data == pb.data

# test unpacking of array of plots
data = TensorBoardLogger.preprocess("key", [p, p], Vector())
@test length(data) == 2
@test first(data[1]) == "key/1"
@test first(data[2]) == "key/2"
@test last(data[1]) isa TensorBoardLogger.PngImage
@test last(data[2]) isa TensorBoardLogger.PngImage
end

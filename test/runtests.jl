using TensorBoardLogger
using Test

@testset "Scalar Value Logger" begin
    logger = Logger("log/")
    @test isdir("log/")
    step = 1
    log_value(logger, "float32", 1.25f0, step=step)
    log_value(logger, "float64", 1.5, step=step)
    log_value(logger, "irr", pi, step=step)
    log_value(logger, "complex", 1.0 + 1.0im, step=step)

    log_value(logger, "float32", 1.25f0, step)
    log_value(logger, "float64", 1.5, step)
    log_value(logger, "irr", pi, step)
    log_value(logger, "complex", 1.0 + 1.0im, step)
end

@testset "Histogram Value Logger" begin
    logger = Logger("log/")
    @test isdir("log/")
    step = 1

    x0 = 0.5+step/30; s0 = 0.5/(step/20);
    edges = collect(-5:0.1:5)
    centers = collect(edges[1:end-1] .+0.05)
    histvals = [exp(-((c-x0)/s0)^2) for c=centers]
    data_tuple = (edges, histvals)

    log_histogram(logger, "hist/cust", data_tuple, step=step)
    log_histogram(logger, "hist/cust", rand(100), step=step)
end

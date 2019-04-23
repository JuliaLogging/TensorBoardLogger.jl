using TensorBoardLogger, Logging
using Test

@testset "Scalar Value Logger" begin
    logger = TBLogger("log/")
    @test isdir("log/")
    step = 1
    log_value(logger, "float32", 1.25f0, step=step)
    log_value(logger, "float64", 1.5, step=step)
    log_value(logger, "irr", pi, step=step)
    log_value(logger, "complex", 1.0 + 1.0im, step=step)
end

@testset "Histogram Value Logger" begin
    logger = TBLogger("log/")
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

@testset "LogInterface" begin
    logger = TBLogger("log/")
    @test isdir("log/")

    with_logger(logger) do
        for i=1:100
            x0 = 0.5+i/30; s0 = 0.5/(i/20);
            edges = collect(-5:0.1:5)
            centers = collect(edges[1:end-1] .+0.05)
            histvals = [exp(-((c-x0)/s0)^2) for c=centers]
            data_tuple = (edges, histvals)


            @info "test" i=i j=i^2 dd=rand(10).+0.1*i hh=data_tuple
            @info "test2" i=i j=2^i dd=rand(10).-0.1*i hh=data_tuple log_step_increment=0
        end
    end

    @test TensorBoardLogger.step(logger) == 100
end

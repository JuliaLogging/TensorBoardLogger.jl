using TensorBoardLogger, Logging
using TensorBoardLogger: preprocess, summary_impl
using Test

@testset "TBLogger" begin
    include("test_TBLogger.jl")
end

@testset "Scalar Value Logger" begin
    logger = TBLogger("test_logs/t", tb_overwrite)
    step = 1

    ss = TensorBoardLogger.scalar_summary("test", 12.0)
    @test isa(ss, TensorBoardLogger.Summary_Value)
    @test ss.simple_value == 12.0
    @test ss.tag == "test"

    log_value(logger, "float32", 1.25f0, step=step)
    log_value(logger, "float64", 1.5, step=step)
    log_value(logger, "irr", pi, step=step)
    log_value(logger, "complex", 1.0 + 1.0im, step=step)
end

@testset "Scalar Value processing interface" begin
    data = Vector{Pair{String,Any}}()
    @test data == preprocess("test1", 1.0, data)
    @test first(data[1])=="test1"
    @test last(data[1])==1.0

    data == preprocess("test2", 1.0+0.5im, data)
    @test first(data[2])=="test2/re"
    @test last(data[2])==1.0
    @test first(data[3])=="test2/im"
    @test last(data[3])==0.5
end

@testset "Histogram Value Logger" begin
    logger = TBLogger("test_logs/t", tb_overwrite)
    step = 1

    x0 = 0.5+step/30; s0 = 0.5/(step/20);
    edges = collect(-5:0.1:5)
    centers = collect(edges[1:end-1] .+0.05)
    histvals = [exp(-((c-x0)/s0)^2) for c=centers]
    data_tuple = (edges, histvals)

    ss = TensorBoardLogger.histogram_summary("test", edges, histvals)
    @test isa(ss, TensorBoardLogger.Summary_Value)
    @test ss.tag == "test"
    @test isa(ss.histo, TensorBoardLogger.HistogramProto)
    @test ss.histo.min == minimum(edges)
    @test ss.histo.max == maximum(edges)
    @test all(ss.histo.bucket_limit.== edges[2:end])
    @test all(ss.histo.bucket.== histvals)

    log_histogram(logger, "hist/cust", data_tuple, step=step)
    log_histogram(logger, "hist/cust", rand(100), step=step)
    log_histogram(logger, "hist/cust", rand(10,10), step=step)
    log_vector(logger, "hist/cust", rand(10), step=step)
end

@testset "Histogram processing interface" begin
    data = Vector{Pair{String,Any}}()
    vals = rand(10)
    @test data == preprocess("test1", vals, data)
    @test first(data[1]) == "test1"
    @test last(data[1])  == vals

    vals = rand(ComplexF32, 10)
    preprocess("test2", vals, data)
    @test first(data[2]) == "test2/re"
    @test last(data[2])  == real.(vals)
    @test first(data[3]) == "test2/im"
    @test last(data[3])  == imag.(vals)

    vals = rand(10, 10)
    preprocess("test2", vals, data)
    @test last(data[4]) == vec(vals)

end

@testset "Text Logger" begin
    logger = TBLogger("test_logs/t", tb_overwrite)
    step = 1

    ss = TensorBoardLogger.text_summary("test", "Hello World")
    @test isa(ss, TensorBoardLogger.Summary_Value)
    @test ss.tag == "test"

    log_text(logger, "phrase", "Hello World", step = step)
    log_text(logger, "sentence", "A quick brown fox jumped over a lazy dog.\n", step = step)
    log_text(logger, "multilines", "Is this the real life?\nIs this just fantacy?", step = step)
    log_text(logger, "markdown", "**This** is the *power*  of >>>markdown", step = step)
    log_text(logger, "html", "<p> HTML is a programming language</p>", step = step)
    log_text(logger, "docstring", """This should work too""", step = step)
end

@testset "Text processing interface" begin
    data = Vector{Pair{String,Any}}()
    @test data == preprocess("test1", "helloworld", data)
    @test first(data[1])=="test1"
    @test last(data[1])=="helloworld"

    data == preprocess("test2", """helloworld""", data)
    @test first(data[2])=="test2"
    @test last(data[2])=="""helloworld"""
end

@testset "LogInterface" begin
    logger = TBLogger("log/")

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

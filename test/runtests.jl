using TensorBoardLogger, Logging
using TensorBoardLogger: preprocess, summary_impl
using Test
using Flux.Data.MNIST
using TestImages
using ImageCore
using ColorTypes
using FileIO


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
    log_text(logger, "Array", collect(1:10), step = step)
    log_text(logger, "Matrix", rand(4, 4), step = step)
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

@testset "Image Logger" begin
    logger = TBLogger("test_logs/t", tb_overwrite)
    step = 1

    ss = TensorBoardLogger.image_summary("test", colorview(Gray, rand(16, 16)))
    @test isa(ss, TensorBoardLogger.Summary_Value)
    @test ss.tag == "test"

    #testing number Arrays
    log_image(logger, "rand/auto", colorview(Gray, rand(10)), step = step)
    log_image(logger, "rand/L", rand(10), L, step = step)
    log_image(logger, "rand/LN", rand(10, 3) ,LN, step = step)
    log_image(logger, "rand/NL", rand(3, 10), NL, step = step)
    log_image(logger, "rand/CL", rand(3, 10), CL, step = step)
    log_image(logger, "rand/LC", rand(10, 3), LC, step = step)
    log_image(logger, "rand/NCL", rand(2, 3, 10), NCL, step = step)
    log_image(logger, "rand/NLC", rand(2, 10, 3), NLC, step = step)
    log_image(logger, "rand/CLN", rand(3, 10, 2), CLN, step = step)
    log_image(logger, "rand/LCN", rand(10, 3, 2), LCN, step = step)

    sample = MNIST.images()[1:3]
    sample = hcat(sample...)
    sample = reshape(sample, (28, 28, 3))
    log_image(logger, "mnist/HWN", sample, HWN, step = step)
    sample = permutedims(sample, (2, 1, 3))
    log_image(logger, "mnist/WHN", sample, WHN, step = step)
    sample = permutedims(sample, (3, 2, 1))
    log_image(logger, "mnist/NHW", sample, NHW, step = step)
    sample = permutedims(sample, (1, 3, 2))
    log_image(logger, "mnist/NWH", sample, NWH, step = step)
    sample = testimage("toucan")
    log_image(logger, "toucan/auto", sample, step = step)
    sample = [sample, sample, sample]
    log_images(logger, "toucans/auto", sample, step = step)
    log_images(logger, "toucans", sample, CHW, step = step)
    sample = hcat(sample...)
    sample = reshape(sample, (150, 162, 3))
    log_image(logger, "toucan/CHWN", sample, CHWN, step = step)
    sample = permutedims(sample, (2, 1, 3))
    log_image(logger, "toucan/CWHN", sample, CWHN, step = step)
    sample = channelview(sample) #CWHN
    sample = permutedims(sample, (4, 1, 2, 3))
    log_image(logger, "toucan/NCWH", sample, NCWH, step = step)
    sample = permutedims(sample, (1, 2, 4, 3))
    log_image(logger, "toucan/NCHW", sample, NCHW, step = step)
    sample = permutedims(sample, (1, 4, 3, 2))
    log_image(logger, "toucan/NWHC", sample, NWHC, step = step)
    sample = permutedims(sample, (1, 3, 2, 4))
    log_image(logger, "toucan/NHWC", sample, NHWC, step = step)
    sample = permutedims(sample, (2, 3, 4, 1))
    log_image(logger, "toucan/HWCN", sample, HWCN, step = step)
    sample = permutedims(sample, (2, 1, 3, 4))
    log_image(logger, "toucan/WHCN", sample, WHCN, step = step)

end

@testset "Image processing interface" begin
    data = Vector{Pair{String,Any}}()
    #2-d image
    lighthouse = testimage("lighthouse")
    @test data == preprocess("test1", lighthouse, data)
    @test first(data[1])=="test1"
    @test last(data[1])==lighthouse
    #3-d MRI image
    mri = testimage("mri-stack")
    @test data == preprocess("test2", mri, data)
    @test first(data[2])=="test2"
    @test last(data[2])==mri[:, :, 1]
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
            @info "test1" simpletext = "simple text" woman = testimage("woman_blonde") mriimg = testimage("mri")
            @info "test2" i=i j=i^2 dd=rand(10).+0.1*i hh=data_tuple
            @info "test3" i=i j=2^i dd=rand(10).-0.1*i hh=data_tuple log_step_increment=0
        end
    end

    @test TensorBoardLogger.step(logger) == 200
end

@testset "Audio Logger" begin
    logger = TBLogger("test_logs/t", tb_overwrite)
    step = 1

    ss = TensorBoardLogger.audio_summary("test", rand(800), 800)
    @test isa(ss, TensorBoardLogger.Summary_Value)
    @test ss.tag == "test"

    clip = (cos.(440*pi*collect(1:100)/44100), 44100)
    fs = clip[2]
    sample = clip[1]
    samples = [sample, sample, sample]
    log_audios(logger, "audiosample", samples, fs, step = step)
end

@testset "Logger dispatch overrides" begin
    include("test_logger_dispatch_overrides.jl")
end

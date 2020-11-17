using TensorBoardLogger, Logging
using TensorBoardLogger: preprocess, summary_impl
using Test
using TestImages
using ImageCore
using ColorTypes
using FileIO
using LightGraphs

test_log_dir = "test_logs/"
ENV["DATADEPS_ALWAYS_ACCEPT"] = true
ENV["GKSwstype"] = "100"

ENV["DATADEPS_ALWAYS_ACCEPT"] = true

@testset "TBLogger" begin
    include("test_TBLogger.jl")
end

@testset "Scalar Value Logger" begin
    logger = TBLogger(test_log_dir*"t", tb_overwrite)
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
    logger = TBLogger(test_log_dir*"t", tb_overwrite)
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
    @test last(data[4]) == vals

end

@testset "Text Logger" begin
    logger = TBLogger(test_log_dir*"t", tb_overwrite)
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
    logger = TBLogger(test_log_dir*"t", tb_overwrite)
    step = 1

    # The following tests are akin to @test_nothrow, which does not exist.
    # https://github.com/JuliaLang/julia/issues/18780

    # testing number Arrays
    @test π != log_image(logger, "rand/auto", colorview(Gray, rand(10)), step = step)
    @test π != log_image(logger, "rand/L", rand(10), L, step = step)
    @test π != log_image(logger, "rand/LN", rand(10, 3) ,LN, step = step)
    @test π != log_image(logger, "rand/NL", rand(3, 10), NL, step = step)
    @test π != log_image(logger, "rand/CL", rand(3, 10), CL, step = step)
    @test π != log_image(logger, "rand/LC", rand(10, 3), LC, step = step)
    @test π != log_image(logger, "rand/NCL", rand(2, 3, 10), NCL, step = step)
    @test π != log_image(logger, "rand/NLC", rand(2, 10, 3), NLC, step = step)
    @test π != log_image(logger, "rand/CLN", rand(3, 10, 2), CLN, step = step)
    @test π != log_image(logger, "rand/LCN", rand(10, 3, 2), LCN, step = step)

    if VERSION >= v"1.3.0"
        using MLDatasets: MNIST 

        sample = MNIST.traintensor(1:3)
        @test  π != log_image(logger, "mnist/HWN", sample, HWN, step = step)
        @test  π != log_image(logger, "mnist2/HWN", Gray.(sample), step = step)
        sample = permutedims(sample, (2, 1, 3))
        @test  π != log_image(logger, "mnist/WHN", sample, WHN, step = step)
        @test  π != log_image(logger, "mnist2/WHN", Gray.(sample), WHN, step = step)
        sample = permutedims(sample, (3, 2, 1))
        @test  π != log_image(logger, "mnist/NHW", sample, NHW, step = step)
        @test  π != log_image(logger, "mnist2/NHW", Gray.(sample), NHW, step = step)
        sample = permutedims(sample, (1, 3, 2))
        @test  π != log_image(logger, "mnist/NWH", sample, NWH, step = step)
        @test  π != log_image(logger, "mnist2/NWH", Gray.(sample), NWH, step = step)
        sample = testimage("toucan")
        @test  π != log_image(logger, "toucan/auto", sample, step = step)
        sample = [sample, sample, sample]
        @test  π != log_images(logger, "toucans/auto", sample, step = step)
        @test  π != log_images(logger, "toucans", sample, CHW, step = step)

        sample = hcat(sample...)
        sample = reshape(sample, (150, 162, 3))
        @test  π != log_image(logger, "toucan/CHWN", sample, CHWN, step = step)
        sample = permutedims(sample, (2, 1, 3))
        @test  π != log_image(logger, "toucan/CWHN", sample, CWHN, step = step)
        sample = channelview(sample) #CWHN
        sample = permutedims(sample, (4, 1, 2, 3))
        @test  π != log_image(logger, "toucan/NCWH", sample, NCWH, step = step)
        sample = permutedims(sample, (1, 2, 4, 3))
        @test  π != log_image(logger, "toucan/NCHW", sample, NCHW, step = step)
        sample = permutedims(sample, (1, 4, 3, 2))
        @test  π != log_image(logger, "toucan/NWHC", sample, NWHC, step = step)
        sample = permutedims(sample, (1, 3, 2, 4))
        @test  π != log_image(logger, "toucan/NHWC", sample, NHWC, step = step)
        sample = permutedims(sample, (2, 3, 4, 1))
        @test  π != log_image(logger, "toucan/HWCN", sample, HWCN, step = step)
        sample = permutedims(sample, (2, 1, 3, 4))
        @test  π != log_image(logger, "toucan/WHCN", sample, WHCN, step = step)
    end
end

@testset "Image processing interface" begin
    #2-d image
    data = Vector{Pair{String,Any}}()
    lighthouse = testimage("lighthouse")
    @test data == preprocess("test1", lighthouse, data)
    @test first(data[1])=="test1"
    @test last(data[1]) isa TensorBoardLogger.PngImage
    #3-d MRI image
    data = Vector{Pair{String,Any}}()
    mri = testimage("mri-stack")
    @test data == preprocess("test2", mri, data)
    @test length(data) == size(mri, 3)
    # check that all slices have been logged with same tag
    isok = true
    for (tag,val)=data
        tag == "test2" && continue
        isok = false
    end
    @test isok
    # check that all slices have been converted to PngImage
    isok = true
    for (tag,val)=data
        val isa TensorBoardLogger.PngImage && continue
        isok = false
    end
    @test isok
end

@testset "LogInterface" begin
    logger = TBLogger(test_log_dir*"t", tb_overwrite)
    woman = testimage("woman_blonde")
    mri = testimage("mri")
    with_logger(logger) do
        for i=1:5
            x0 = 0.5+i/30; s0 = 0.5/(i/20);
            edges = collect(-5:0.1:5)
            centers = collect(edges[1:end-1] .+0.05)
            histvals = [exp(-((c-x0)/s0)^2) for c=centers]
            data_tuple = (edges, histvals)
            @info "test1" simpletext = "simple text" woman = woman mriimg = mri
            @info "test2" i=i j=i^2 dd=rand(10).+0.1*i hh=data_tuple
            @info "test3" i=i j=2^i dd=rand(10).-0.1*i hh=data_tuple log_step_increment=0
        end
    end
    @test TensorBoardLogger.step(logger) == 10
end

@testset "Audio Logger" begin
    logger = TBLogger(test_log_dir*"t", tb_overwrite)
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

@testset "Graph Logger" begin
    logger = TBLogger(test_log_dir*"t", tb_overwrite)
    step = 1
    ss = TensorBoardLogger.graph_summary(DiGraph(1), ["1"], ["1"], ["cpu"], [nothing])
    @test isa(ss, TensorBoardLogger.GraphDef)
    g = DiGraph(7)
    add_edge!(g, 1, 2)
    add_edge!(g, 2, 3)
    add_edge!(g, 3, 6)
    add_edge!(g, 4, 6)
    add_edge!(g, 5, 6)
    add_edge!(g, 5, 7)
    log_graph(logger, g, step = step, nodedevice = ["cpu", "cpu", "gpu", "gpu", "gpu", "gpu", "cpu"], nodevalue = [1, "tf", 3.14, [1.0 2.0; 3.0 4.0], true, +, (10, "julia", 12.4)])
end

@testset "Embedding Logger" begin
    logger = TBLogger(test_log_dir*"t", tb_overwrite)
    step = 1
    mat = rand(4, 4)
    metadata = rand(4, 10)
    metadata_header = Array(collect(1:10))
    imgs = TBImages(rand(8, 8, 3, 4), HWCN)
    @test π != log_embeddings(logger, "random1", mat, metadata = metadata, metadata_header = metadata_header, img_labels = imgs, step = step)
    @test π != log_embeddings(logger, "random2", mat, step = step+1)
end

@testset "Logger dispatch overrides" begin
    include("test_logger_dispatch_overrides.jl")
end

@testset "Optional dependency tests" begin
    include("Optional/test_Plots.jl")
    # Don't run PyPlot tests until I figure a way to install the dependencies
    #include("Optional/test_PyPlot.jl")
    if VERSION >= v"1.5.0"
        include("Optional/test_Tracker.jl")
    end
end

@testset "Logger dispatch overrides" begin
    include("deserialization.jl")
end

#cleanup
rm(test_log_dir, force=true, recursive=true)

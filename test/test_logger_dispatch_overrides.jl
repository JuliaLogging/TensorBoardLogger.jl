using TensorBoardLogger, Test
using TensorBoardLogger: preprocess, content
using TestImages
using ImageCore
@testset "TBText" begin
    data = Vector{Pair{String,Any}}()
    preprocess("test", TBText(Complex(1.0,3.0)), data)
    @test first(data) == ("test"=>TBText(Complex(1.0,3.0)))
end

@testset "TBHistogram" begin
    data = Vector{Pair{String,Any}}()
    arr = rand(ComplexF64, 5)
    preprocess("test", TBHistogram(arr), data)
    @test !(first(data) == ("test"=>TBHistogram(arr)))
    k,v = pop!(data)
    @test k == "test/im"
    @test content(v) == imag(arr) && typeof(v)<:TBHistogram
    k,v = pop!(data)
    @test k == "test/re"
    @test v.data == real(arr) && typeof(v)<:TBHistogram
end

@testset "TBVector" begin
    data = Vector{Pair{String,Any}}()
    arr = rand(ComplexF64, 5)
    preprocess("test", TBVector(arr), data)
    @test !(first(data) == ("test"=>TBVector(arr)))
    k,v = pop!(data)
    @test k == "test/im"
    @test content(v) == imag(arr) && typeof(v)<:TBVector
    k,v = pop!(data)
    @test k == "test/re"
    @test v.data == real(arr) && typeof(v)<:TBVector
end

@testset "TBImage" begin
    data = Vector{Pair{String,Any}}()
    testdata = [
    (rand(10).*100, L), (rand(10, 2), LN), (rand(2, 10), NL), (rand(10, 3), LC), (rand(3, 10), CL),
    (rand(10, 3, 2), LCN), (rand(3, 10, 2), CLN), (rand(2, 10, 3), NLC), (rand(2, 3, 10), NCL),
    (rand(4, 5), HW), (rand(5, 4), WH),
    (rand(5, 4, 2), WHN), (rand(4, 5, 2), HWN), (rand(2, 4, 5), NHW), (rand(2, 5, 4), NWH),
    (rand(5, 4, 3), WHC), (rand(4, 5, 3), HWC), (rand(3, 4, 5), CHW), (rand(3, 5, 4), CWH),
    (rand(5, 4, 3, 2), WHCN), (rand(4, 5, 3, 2), HWCN), (rand(2, 3, 4, 5), NCHW), (rand(2, 3, 5, 4), NCWH),
    (rand(3, 5, 4, 2), CWHN), (rand(3, 4, 5, 2), CHWN), (rand(2, 4, 5, 3), NHWC), (rand(2, 5, 4, 3), NWHC),
    ]
    preprocess("randTBImages", TBImages([rand(3, 3), rand(3,3)], HW), data)
    for testtuple in testdata
        preprocess("randTBImage/$(last(testtuple))", TBImage(first(testtuple), last(testtuple)), data)
    end
    @test size(data, 1) == 47
end

@testset "TBAudio" begin
    data = Vector{Pair{String,Any}}()
    sample_rate = 44100
    x = collect(1:sample_rate*2)
    y = cos.(440*pi*x/sample_rate)
    preprocess("test", TBAudios([y, y], sample_rate), data)
    @test first(data) == ("test/1"=>TBAudio(y, sample_rate))
    @test last(data) == ("test/2"=>TBAudio(y, sample_rate))
end

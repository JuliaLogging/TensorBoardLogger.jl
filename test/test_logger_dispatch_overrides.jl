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

    img = rand(10)
    preprocess("test", TBImage(img, L), data)
    @test (first(data) == ("test"=>TBImage(img, L)))
    k,v = pop!(data)
    @test k == "test"
    @test content(v) == img

    img = rand(10,3)
    preprocess("test", TBImage(img, LC), data)
    @test (first(data) == ("test"=>TBImage(img, LC)))
    k,v = pop!(data)
    @test k == "test"
    @test content(v) == img

    img = transpose(img)
    preprocess("test", TBImage(img, CL), data)
    @test (first(data) == ("test"=>TBImage(img, CL)))
    k,v = pop!(data)
    @test k == "test"
    @test content(v) == img

    img = channelview(testimage("pirate"))
    preprocess("test", TBImage(img, HW), data)
    @test (first(data) == ("test"=>TBImage(img, HW)))
    k,v = pop!(data)
    @test k == "test"
    @test content(v) == img

    img = transpose(img)
    preprocess("test", TBImage(img, WH), data)
    @test (first(data) == ("test"=>TBImage(img, WH)))
    k,v = pop!(data)
    @test k == "test"
    @test content(v) == img

    img = channelview(testimage("mandrill"))
    preprocess("test", TBImage(img, CHW), data)
    @test (first(data) == ("test"=>TBImage(img, CHW)))
    k,v = pop!(data)
    @test k == "test"
    @test content(v) == img

    img = permutedims(img, (1, 3, 2))
    preprocess("test", TBImage(img, CWH), data)
    @test (first(data) == ("test"=>TBImage(img, CWH)))
    k,v = pop!(data)
    @test k == "test"
    @test content(v) == img

    img = permutedims(img, (3, 2, 1))
    preprocess("test", TBImage(img, HWC), data)
    @test (first(data) == ("test"=>TBImage(img, HWC)))
    k,v = pop!(data)
    @test k == "test"
    @test content(v) == img

    img = permutedims(img, (2, 1, 3))
    preprocess("test", TBImage(img, WHC), data)
    @test (first(data) == ("test"=>TBImage(img, WHC)))
    k,v = pop!(data)
    @test k == "test"
    @test content(v) == img

end

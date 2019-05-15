using TensorBoardLogger, Test
using TensorBoardLogger: preprocess, content

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

using TensorBoardLogger
using Test

@testset "Scalar Value Logger" begin
    logger = Logger("log/")
    @test isdir("log/")
    step = 1
    log_value(logger, "float32", 1.25f0, step)
    log_value(logger, "float64", 1.5, step)
    log_value(logger, "irr", pi, step)
    log_value(logger, "complex", 1.0 + 1.0im, step)
end
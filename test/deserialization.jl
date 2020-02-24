using TensorBoardLogger, Logging
using Test
using TestImages
using ValueHistories

test_log_dir = "test_logs/"
ENV["GKSwstype"] = "100"

@testset "Deserialization_simple" begin
    logger = TBLogger(test_log_dir*"d", tb_overwrite)

    mri = testimage("mri")
    with_logger(logger) do
        for i=1:5
            @info "test" val=i-0.5*i*im b=i*2 mat=i.*ones(3) mat2=10 .*i.*ones(3,2)
            @info "test2" mri
        end
    end

    tgs = TensorBoardLogger.tags(logger)
    @test "test/val" ∈ tgs
    @test "test/b" ∈ tgs
    @test "test/mat" ∈ tgs
    @test "test/mat2" ∈ tgs
    @test "test2/mri" ∈ tgs

    hist = convert(MVHistory, logger)
    is = collect(1:5)
    @test all(hist["test/val"].values .== (1-0.5*im).* is)
    @test all(hist["test/b"].values == is .* 2)
    @test all([v == mri for v=hist["test2/mri"].values])
end

using TensorBoardLogger, Logging
using Tracker
using Test

@testset "Optional: PyPlot.jl" begin
    logger = TBLogger("test_logs/Tracker-jl", tb_overwrite)
    v = Tracker.TrackedReal(1)
    with_logger(logger) do
        @info "dispatch" v=v
    end
end
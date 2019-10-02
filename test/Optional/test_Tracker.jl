using TensorBoardLogger, Logging
using Tracker
using Test

@testset "Optional: Tracker.jl" begin
    logger = TBLogger("test_logs/Tracker-jl", tb_overwrite)
    tr = Tracker.TrackedReal(1)
    ta = Tracker.TrackedArray(ones(10))
    with_logger(logger) do
        @info "dispatch" tr=tr
        @info "dispatch" ta=ta
    end
end
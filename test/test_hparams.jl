using TensorBoardLogger, Logging
using Test

test_hparams_log_dir = "test_hparams_logs/"

@testset "Write Hparams" begin
    isdir(test_hparams_log_dir) && rm(test_hparams_log_dir, force=true, recursive=true)

    # Create a new logger
    for (i, trial_id) in enumerate(["run1", "run2", "run3"])
        logger = TBLogger(test_hparams_log_dir*trial_id, tb_append)

        # Add in the a dummy loss metric
        with_logger(logger) do
            for x in 1:20
                @info "scalar" loss = i*sqrt(x)
            end
        end

        # Setup example hyperparameters
        # hparams_config = Dict{String, Any}(
        #     "alpha"=>0.5,
        #     "id"=>Float64(i),
        #     "is_testing"=>(i%2==0)
        # )
        hparams_config = Dict{String, Any}(
            "id"=>Float64(i),
        )
        metrics = ["scalar/loss"]
        
        @test typeof(write_hparams!(logger, hparams_config, metrics)) === Nothing

        # # Check that a new event file has been created
        # @test length(logger.all_files) == 2
    end
end
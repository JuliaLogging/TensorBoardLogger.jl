using TensorBoardLogger, Logging
using TensorBoardLogger: preprocess, summary_impl
using Test

test_hparams_log_dir = "test_hparams_logs/"

@testset "Initialialise Hparams (default domains, no metrics)" begin
    isdir(test_hparams_log_dir) && rm(test_hparams_log_dir, force=true, recursive=true)

    # Create a new logger
    logger = TBLogger(test_hparams_log_dir*"hparams")
    
    alpha_config = HParamConfig(; name="alpha", datatype=Float64)
    beta_config = HParamConfig(; name="beta", datatype=String)
    gamma_config = HParamConfig(; name="gamma", datatype=Bool)

    hparams_config = [alpha_config, beta_config, gamma_config]
    metric_config = [MetricConfig(; name="loss")]

    @test typeof(init_hparams!(logger, hparams_config, metric_config)) === Nothing

    # Check that the init didn't create a new file
    @test length(logger.all_files) == 1

    # close all event files
    close.(values(logger.all_files))
end
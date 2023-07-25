using TensorBoardLogger, Logging
using Test
import ProtoBuf as PB

test_hparams_log_dir = "test_hparams_logs/"

@testset "Write Hparams" begin
    isdir(test_hparams_log_dir) && rm(test_hparams_log_dir, force=true, recursive=true)

    # Create a new logger
    for (i, trial_id) in enumerate(["run$k" for k in 1:20])
        logger = TBLogger(test_hparams_log_dir*trial_id, tb_append)

        # Add in the a dummy loss metric
        with_logger(logger) do
            for x in 1:20
                @info "scalar" loss = i*sqrt(x)
            end
        end

        # Setup example hyperparameters
        hparams_config = Dict{String, Any}(
            "id"=>Float64(i),
            "alpha"=>0.5,
            "p1"=>rand(),
            "p2"=>sqrt(rand()),
            "p3"=>rand()^5,
            "optimisations"=>(i%2==0),
            "method"=>rand(("MC", "SGD"))
        )
        metrics = ["scalar/loss"]
        
        @test typeof(write_hparams!(logger, hparams_config, metrics)) === Nothing

        # # Check that a new event file has been created
        # @test length(logger.all_files) == 2
    end
end

const hparams_metadata_encoded_bytes = UInt8[0x1a, 0x5b, 0x0a, 0x0e, 0x0a, 0x06, 0x6d, 0x65, 0x74, 0x68, 0x6f, 0x64, 0x12, 0x04, 0x1a, 0x02, 0x4d, 0x43, 0x0a, 0x12, 0x0a, 0x05, 0x61, 0x6c, 0x70, 0x68, 0x61, 0x12, 0x09, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xe0, 0x3f, 0x0a, 0x0f, 0x0a, 0x02, 0x69, 0x64, 0x12, 0x09, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf0, 0x3f, 0x0a, 0x13, 0x0a, 0x0d, 0x6f, 0x70, 0x74, 0x69, 0x6d, 0x69, 0x73, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x12, 0x02, 0x20, 0x00, 0x0a, 0x0f, 0x0a, 0x02, 0x70, 0x31, 0x12, 0x09, 0x11, 0x9a, 0x99, 0x99, 0x99, 0x99, 0x99, 0xb9, 0x3f]

@testset "Encoding hparams metadata" begin
    hparams_config = Dict{String, Any}(
           "id"=>Float64(1),
           "alpha"=>0.5,
           "p1"=>0.1,
           "optimisations"=>false,
           "method"=>"MC"
    )
    metrics = ["scalar/loss"]

    PLUGIN_NAME = "hparams"
    PLUGIN_DATA_VERSION = 0

    EXPERIMENT_TAG = "_hparams_/experiment"
    SESSION_START_INFO_TAG = "_hparams_/session_start_info"
    SESSION_END_INFO_TAG = "_hparams_/session_end_info"

    hparam_infos = [TensorBoardLogger.hparam_info(TensorBoardLogger.HParamConfig(; name=k, datatype=typeof(v))) for (k, v) in hparams_config]
    metric_infos = [TensorBoardLogger.metric_info(TensorBoardLogger.MetricConfig(; name=metric)) for metric in metrics]


    hparams_dict = Dict(k => TensorBoardLogger._convert_value(v) for (k, v) in hparams_config)

    session_start_info = TensorBoardLogger.HP.SessionStartInfo(hparams_dict, "", "", "", zero(Float64))
    session_start_content = TensorBoardLogger.HP.HParamsPluginData(PLUGIN_DATA_VERSION, TensorBoardLogger.OneOf(:session_start_info, session_start_info))
    
    @test TensorBoardLogger.serialize_proto(session_start_content) == hparams_metadata_encoded_bytes
end


@testset "Decoding hparams metadata" begin
    expected_hparams_config = Dict{String, Any}(
           "id"=>Float64(1),
           "alpha"=>0.5,
           "p1"=>0.1,
           "optimisations"=>false,
           "method"=>"MC"
    )
    
    d = TensorBoardLogger.ProtoDecoder(IOBuffer(deepcopy(hparams_metadata_encoded_bytes)))
    decoded_content = PB.Codecs.decode(d, TensorBoardLogger.HP.HParamsPluginData)
    decoded_session_info = decoded_content.data.value

    @test all(haskey(decoded_session_info.hparams, k) for k in keys(expected_hparams_config))

    for (k, hv) in decoded_session_info.hparams
        decoded_v = hv.kind.value
        @test expected_hparams_config[k] == decoded_v
    end
end
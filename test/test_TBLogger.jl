using TensorBoardLogger, Logging
using TensorBoardLogger: preprocess, summary_impl
using Test

test_log_dir = "test_logs/"

@testset "Initialization" begin
    isdir(test_log_dir) && rm(test_log_dir, force=true, recursive=true)

    # Check tb_append
    TBLogger(test_log_dir*"run")
    @test isdir(test_log_dir*"run")
    TBLogger(test_log_dir*"run") #tb_append by default
    @test isdir(test_log_dir*"run_1")
    TBLogger(test_log_dir*"run", tb_increment)
    @test isdir(test_log_dir*"run_2")

    # check tb_overwrite
    close(open(test_log_dir*"run_2/testfile", "w"))
    TBLogger(test_log_dir*"run_2", tb_overwrite)
    @test !isfile(test_log_dir*"run_2/testfile")
end

@testset "create log directory" begin
    import TensorBoardLogger.init_logdir
    rm(test_log_dir, recursive=true, force=true)

    # Check tb_append
    init_logdir(test_log_dir*"run")
    @test isdir(test_log_dir*"run")
    init_logdir(test_log_dir*"run") #tb_append by default
    @test isdir(test_log_dir*"run_1")
    init_logdir(test_log_dir*"run", tb_increment)
    @test isdir(test_log_dir*"run_2")

    # check tb_overwrite
    close(open(test_log_dir*"run_2/testfile", "w"))
    init_logdir(test_log_dir*"run_2", tb_overwrite)
    @test !isfile(test_log_dir*"run_2/testfile")
end

@testset "create event file" begin
    import TensorBoardLogger.init_logdir, TensorBoardLogger.create_eventfile
    rm(test_log_dir, recursive=true, force=true)
    logdir = init_logdir(test_log_dir*"run")

    fname, file = create_eventfile(logdir)
    @test isfile(joinpath(logdir, fname))

    fname, file = create_eventfile(logdir, prepend="test/")
    @test isfile(joinpath(logdir, fname))
end

@testset "stepping" begin
    # workaround step being already exported in julia 1.0
    #import TensorBoardLogger.step
    tb_step = TensorBoardLogger.step

    tbl = TBLogger(test_log_dir*"run", tb_overwrite)
    @test tb_step(tbl) == 0

    tbl = TBLogger(test_log_dir*"run", purge_step=12)
    @test tb_step(tbl) == 12

    @test increment_step!(tbl, 1) == 13
    @test tb_step(tbl) == 13

    @test set_step!(tbl, 1) == 1
    @test tb_step(tbl) == 1
end

@testset "resetting" begin
    tbl = TBLogger(test_log_dir*"run", tb_overwrite)
    TensorBoardLogger.add_eventfile(tbl, "pp")
    set_step!(tbl, 100)

    reset!(tbl)
    @test TensorBoardLogger.step(tbl) == 0
    @test length(tbl.all_files) == 1

end

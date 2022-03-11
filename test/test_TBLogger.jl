using TensorBoardLogger, Logging
using TensorBoardLogger: preprocess, summary_impl
using Test

test_log_dir = "test_logs/"

@testset "Initialization" begin
    isdir(test_log_dir) && rm(test_log_dir, force=true, recursive=true)

    # Check tb_append
    tbl1 = TBLogger(test_log_dir*"run")
    @test isdir(test_log_dir*"run")
    tbl2 = TBLogger(test_log_dir*"run") #tb_append by default
    @test isdir(test_log_dir*"run_1")
    tbl3 = TBLogger(test_log_dir*"run", tb_increment)
    @test isdir(test_log_dir*"run_2")

    # check tb_overwrite
    close.(values(tbl3.all_files))
    tbl4 = TBLogger(test_log_dir*"run_2", tb_overwrite)
    @test !isfile(test_log_dir*"run_2/testfile")
    
    # check custom file prefix
    tbl5 = TBLogger(test_log_dir*"run_3"; time = 0, prefix = "test.")
    @test isfile(test_log_dir*"run_3/test.events.out.tfevents.0.$(gethostname())")

    # close all event files
    close.(values(tbl1.all_files))
    close.(values(tbl2.all_files))
    close.(values(tbl4.all_files))
    close.(values(tbl5.all_files))
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
    close(file)

    fname, file = create_eventfile(logdir, prepend="test/")
    @test isfile(joinpath(logdir, fname))
    close(file)
end

@testset "stepping" begin
    # workaround step being already exported in julia 1.0
    #import TensorBoardLogger.step
    tb_step = TensorBoardLogger.step

    tbl = TBLogger(test_log_dir*"run", tb_overwrite)
    @test tb_step(tbl) == 0

    close.(values(tbl.all_files))

    tbl = TBLogger(test_log_dir*"run", purge_step=12)
    @test tb_step(tbl) == 12

    @test increment_step!(tbl, 1) == 13
    @test tb_step(tbl) == 13

    @test set_step!(tbl, 1) == 1
    @test tb_step(tbl) == 1

    @test set_step_increment!(tbl, 10) == 10
    # changing the increment should not affect the step
    @test tb_step(tbl) == 1

    close.(values(tbl.all_files))
end

@testset "closing" begin
    tbl = TBLogger(test_log_dir*"run", tb_overwrite)
    TensorBoardLogger.add_eventfile(tbl, "pp")
    files = keys(tbl.all_files)

    close(tbl)
    @test begin
        foreach(f -> rm(joinpath(test_log_dir*"run", f)), files)
        # rm will error if the file is still open
        true
    end

    tbl = TBLogger(test_log_dir*"run", tb_overwrite)
    TensorBoardLogger.add_eventfile(tbl, "pp")
    files = keys(tbl.all_files)

    tbl = nothing
    Base.finalize(tbl)
    @test begin
        foreach(f -> rm(joinpath(test_log_dir*"run", f)), files)
        # rm will error if the file is still open
        true
    end
end

@testset "resetting" begin
    tbl = TBLogger(test_log_dir*"run", tb_overwrite)
    TensorBoardLogger.add_eventfile(tbl, "pp")
    set_step!(tbl, 100)

    reset!(tbl)
    @test TensorBoardLogger.step(tbl) == 0
    @test length(tbl.all_files) == 1

end

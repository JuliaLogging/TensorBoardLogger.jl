using TensorBoardLogger, Logging
using TensorBoardLogger: preprocess, summary_impl
using Test

@testset "Initialization" begin
    isdir("test_logs/") && rm("test_logs", force=true, recursive=true)

    # Check tb_append
    TBLogger("test_logs/run")
    @test isdir("test_logs/run")
    TBLogger("test_logs/run") #tb_append by default
    @test isdir("test_logs/run_1")
    TBLogger("test_logs/run", tb_increment)
    @test isdir("test_logs/run_2")

    # check tb_overwrite
    close(open("test_logs/run_2/testfile", "w"))
    TBLogger("test_logs/run_2", tb_overwrite)
    @test !isfile("test_logs/run_2/testfile")
end

@testset "create log directory" begin
    import TensorBoardLogger.init_logdir
    rm("test_logs/", recursive=true, force=true)

    # Check tb_append
    init_logdir("test_logs/run")
    @test isdir("test_logs/run")
    init_logdir("test_logs/run") #tb_append by default
    @test isdir("test_logs/run_1")
    init_logdir("test_logs/run", tb_increment)
    @test isdir("test_logs/run_2")

    # check tb_overwrite
    close(open("test_logs/run_2/testfile", "w"))
    init_logdir("test_logs/run_2", tb_overwrite)
    @test !isfile("test_logs/run_2/testfile")
end

@testset "create event file" begin
    import TensorBoardLogger.init_logdir, TensorBoardLogger.create_eventfile
    rm("test_logs/", recursive=true, force=true)
    logdir = init_logdir("test_logs/run")

    fname, file = create_eventfile(logdir)
    @test isfile(joinpath(logdir, fname))

    fname, file = create_eventfile(logdir, prepend="test/")
    @test isfile(joinpath(logdir, fname))
end

@testset "stepping" begin
    # workaround step being already exported in julia 1.0
    #import TensorBoardLogger.step
    tb_step = TensorBoardLogger.step
    
    tbl = TBLogger("test_logs/run", tb_overwrite)
    @test tb_step(tbl) == 0

    tbl = TBLogger("test_logs/run", purge_step=12)
    @test tb_step(tbl) == 12

    @test increment_step!(tbl, 1) == 13
    @test tb_step(tbl) == 13

    @test set_step!(tbl, 1) == 1
    @test tb_step(tbl) == 1
end

@testset "resetting" begin
    tbl = TBLogger("test_logs/run", tb_overwrite)
    TensorBoardLogger.add_eventfile(tbl, "pp")
    set_step!(tbl, 100)

    reset!(tbl)
    @test TensorBoardLogger.step(tbl) == 0
    @test length(tbl.all_files) == 1

end

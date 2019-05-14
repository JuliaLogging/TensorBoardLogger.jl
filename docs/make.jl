using Documenter, TensorBoardLogger

makedocs(
    modules   = [TensorBoardLogger],
    format    = Documenter.HTML(),
    sitename  = "TensorBoardLogger.jl",
    authors   = "Filippo Vicentini",
    pages     = [
            "Home"          => "index.md",
            #"Manual"        => Any[
                "Basics"        => "basics.md",
                "Extending"    => "custom_behaviour.md"
            #]
    ]
)

deploydocs(
    repo   = "github.com/PhilipVinc/TensorBoardLogger.jl.git",
    target = "build",
    deps   = nothing,
    make   = nothing
)

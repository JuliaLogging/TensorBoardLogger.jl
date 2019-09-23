using Documenter, TensorBoardLogger

makedocs(
    modules   = [TensorBoardLogger],
    format    = Documenter.HTML(),
    sitename  = "TensorBoardLogger.jl",
    authors   = "Filippo Vicentini",
    pages     = [
            "Home"          => "index.md",
            "Manual"        => Any[
                "Backends"     =>  "custom_behaviour.md",
                "Extending"    =>  "extending_behaviour.md",
                "Explicit Interface" => "explicit_interface.md"
            ],
            "Examples"      => Any[
                "Optim.jl"  => "examples/optim.md"
            ]
    ]
)

deploydocs(
    repo   = "github.com/PhilipVinc/TensorBoardLogger.jl.git",
    target = "build",
    deps   = nothing,
    make   = nothing
)

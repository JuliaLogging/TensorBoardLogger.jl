using Documenter, TensorBoardLogger

makedocs(
    modules   = [TensorBoardLogger],
    sitename  = "TensorBoardLogger.jl",
    authors   = "Filippo Vicentini",
    pages     = [
            "Home"          => "index.md",
            "Manual"        => Any[
                "Backends"     =>  "custom_behaviour.md",
                "Reading back data" => "deserialization.md",
                "Extending"    =>  "extending_behaviour.md",
                "Explicit Interface" => "explicit_interface.md",
                "Hyperparameter logging" => "hyperparameters.md"
            ],
            "Examples"      => Any[
                "Flux.jl"  => "examples/flux.md"
                "Optim.jl"  => "examples/optim.md"
                "Hyperparameter tuning"  => "examples/hyperparameter_tuning.md"
            ]
    ],
    format    = Documenter.HTML(
                prettyurls = haskey(ENV, "CI"))
)

deploydocs(
    repo   = "github.com/JuliaLogging/TensorBoardLogger.jl.git",
    target = "build")

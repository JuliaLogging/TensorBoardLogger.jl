# TensorBoardLogger
[![Build Status](https://travis-ci.org/PhilipVinc/TensorBoardLogger.jl.svg?branch=master)](https://travis-ci.org/PhilipVinc/TensorBoardLogger.jl) [![codecov](https://codecov.io/gh/PhilipVinc/TensorBoardLogger.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/PhilipVinc/TensorBoardLogger.jl)
[![](https://img.shields.io/badge/docs-dev-blue.svg)](https://philipvinc.github.io/TensorBoardLogger.jl/dev/)

**TensorBoardLogger.jl** is a native library for logging arbitrary data to
[Tensorboard](https://www.tensorflow.org/guide/summaries_and_tensorboard), extending Julia's standard Logging framework.

Many ideas are taken from [UniversalTensorBoard](https://github.com/oxinabox/UniversalTensorBoard.jl)
and from [TensorBoardX](https://tensorboardx.readthedocs.io/en/latest/). It is based on
[ProtoBuf.jl](https://github.com/JuliaIO/ProtoBuf.jl).

## Installation

To install run the following command in the julia REPL:
```
] add TensorBoardLogger
```

If you need to log Images, you must also install `ImageMagick`
(on MacOS, you will also need `QuartzImageIO`).
```
] add ImageMagick
```

## Usage
The fundamental type defined in this package is a `TBLogger`, which behaves like
other standard loggers in Julia such as `ConsoleLogger` or `TextLogger`. You can
create one by passing it the path to the folder where you want to store the data.
You can also pass an optional second argument to specify the behaviour in case
there already exhist a document at the given path.

Once you have created a `TBLogger`, you can use it as you would use any other
logger in Julia:
    - You can set it to be your global logger with the function [`global_logger`](https://docs.julialang.org/en/v1/stdlib/Logging/index.html#Base.CoreLogging.global_logger)
    - You can set it to be the current logger in a scope with the function [`with_logger`](https://docs.julialang.org/en/v1/stdlib/Logging/index.html#Base.CoreLogging.with_logger)
    - You can combine it with other Loggers using [LoggingExtras.jl](https://github.com/oxinabox/LoggingExtras.jl), so that messages are logged to TensorBoard and to other backends at the same time.

You can log to TensorBoard any type. Numeric types will be logged as scalar,
arrays will be binned into histograms, images and audio will be logged as such,
and we even support [Plots](https://github.com/JuliaPlots/Plots.jl) and
[PyPlot](https://github.com/JuliaPlots/Plots.jl) figures!

For details about how types are logged by default, or how to customize this behaviour for your custom types,
refer to the documentation or the examples folder.

```julia
using TensorBoardLogger, Logging, Random

lg=TBLogger("tensorboard_logs/run", min_level=Logging.Info)

struct sample_struct first_field; other_field; end

with_logger(lg) do
    for i=1:100
        x0          = 0.5+i/30; s0 = 0.5/(i/20);
        edges       = collect(-5:0.1:5)
        centers     = collect(edges[1:end-1] .+0.05)
        histvals    = [exp(-((c-x0)/s0)^2) for c=centers]
        data_tuple  = (edges, histvals)
        data_struct = sample_struct(i^2, i^1.5-0.3*i)


        @info "test" i=i j=i^2 dd=rand(10).+0.1*i hh=data_tuple
        @info "test_2" i=i j=2^i hh=data_tuple log_step_increment=0
        @info "" my_weird_struct=data_struct   log_step_increment=0
        @debug "debug_msg" this_wont_show_up=i
    end
end
```

## Integration with third party packages
We also support native logging of the types defined by a few third-party packages, such as `Plots` and `PyPlot` plots.
If there are other libraries that you think we should include in the list, please open an issue.

## Roadmap
Support for Computational Graphs is currently planned and partly implemented.

Contributions are welcome! You can get in touch by opening an issue, sending me an email or on slack (@PhilipVinc).

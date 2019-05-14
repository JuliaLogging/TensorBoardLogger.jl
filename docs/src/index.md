
# TensorBoardLogger.jl

*Log data to TensorBoard from Julia*

[TensorBoard](https://www.ten
sorflow.org/guide/summaries_and_tensorboard) is an interactive
dashboard that can be used to visualize data generated from your programs. 
**TensorBoardLogger** is a [Julia](https://julialang.org) package that allows
you to log data to TensorBoard through the standard Julia Logging system.

## Installation

To install this Julia package run the following command in the julia REPL:
```
] add TensorBoardLogger
```

!!! note 
    *TensorBoardLogger* only contains code to serialize data to TensorBoard. 
    To run the TensorBoard interface, you should install it and run it. 
    The easiest way to install it is to [install TensorFlow](https://www.tensorflow.org/install). 
    Instructions for running TensorBoard can be found [on the GitHub page](https://github.com/tensorflow/tensorboard).

## Basic Usage
```@meta
CurrentModule = TensorBoardLogger
```

The fundamental type defined in this package is a `TBLogger`, which behaves like
other standard loggers in Julia such as `ConsoleLogger` or `TextLogger`. You can 
create one by passing it the path to the folder where you want to store the data.
You can also pass an optional second argument to specify the behaviour in case 
there already exhist something at the given path.

Once you have created a `TBLogger`, you can use it as you would use any other 
logger in Julia: 
    - You can set it to be your global logger with the function `with_logger`
    - You can set it to be the current logger in a scope with the function `with_logger() do.... end`
    - You can combine it with other Loggers using [LoggingExtras.jl](https://github.com/oxinabox/LoggingExtras.jl), so that messages are logged to TensorBoard and to other backends at the same time.

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
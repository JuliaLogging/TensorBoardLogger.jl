# TensorBoardLogger
[![Build Status](https://travis-ci.org/PhilipVinc/TensorBoardLogger.jl.svg?branch=master)](https://travis-ci.org/PhilipVinc/TensorBoardLogger.jl) [![codecov](https://codecov.io/gh/PhilipVinc/TensorBoardLogger.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/PhilipVinc/TensorBoardLogger.jl)

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

## Usage

The package defines a new type of logger, `TBLogger`. Messages can be logged 
either through Julia's standard logging framework by setting it as the current logger, or 
by calling one of the various `log_****` methods. 

To create a `TBLogger` you must supply it a path. A folder will be created there and data 
will be logged to it (if a file or a folder already exhist at the given path, an 
increasing number will be appended).

### Using the standard Logging interface

`TBLogger` can be used like any other logger because it implements the [`AbstractLogger`](https://docs.julialang.org/en/v1/stdlib/Logging/index.html#AbstractLogger-interface-1) interface. It can also be composed with other
loggers using [LoggingExtras.jl](https://github.com/oxinabox/LoggingExtras.jl).
To set `TBLogger` as the current logger you must first load the `Logging` package and then use the
command `global_logger`:
```
using TensorBoardLogger, Logging
my_logger = TBLogger("example")

global_logger(my_logger)
```

You can also set `TBLogger` to be the current logger in a limited scope with the `with_logger` function:
```
with_logger(my_logger) do
  # compute things
  @info .... # logged to TBLogger
end
```

when you log messages this way, structs and types are broken down into more fundamental
types that can be serialized to one of the supported formats. 

## Type Processing

At the moment, we can serialize to the following TensorBoard backends (plugins):

  - *Scalar*        for real-valued data  (`log_value`)  
  - *Histograms*    for real-value histograms (`log_histogram` and `log_vector`)
  - *Text*          for markdown (`log_text`)
  - *Image*         for images (`log_image`). Note: you will need either ImageMagick.jl or QuartzImageIO.jl installed in the current enviroment for Image logging to function.

When you use the Logging interface we break down structures in order to obtain types that 
can be serialized to one of those backends. In particoular, the behaviour is the following:

  - Structures and tuples are broken down: and each field is logged individually by appending it's name to the `tag`
  under which it will be logged. This is done recursively
  - Complex Numbers are logged as their real and complex part by appending `/re` and `/im` to the
  `tag` 
  - Arrays of Complex Numbers are logged as their real and complex part by appending `/re` and `/im`
  to the `tag` 

Ultimately, everything should be reduced to one of the following types:
  - `<:Real`s are logged to the `Scalar` backend
  - `Arrays{<:Real}` are logged as histograms, after binning, to the `Histogram` backend.
  - Any other type will be converted to markdown and logged to the `Text` backend.

For example, the following code
```
struct Test a; b; end
data = Test(Complex(1,2), rand(10,10))
with_logger(TBLogger("example")) do
  @info "ex" data
end
```
will log the following tags:
```
"ex/data/a/re" --> 1
"ex/data/a/im" --> 2
"ex/data/b"    --> histogram
```

If you want to change the default behaviour of how a type is logged, (for example you want to ignore some
fields in a structure) you should define the following function:
```
TensorBoardLogger.preprocess(tag, val::YourType, data)
```
where `tag` is the current tag for the object `val`. This function should call `preprocess` with a new `tag`
on all values that you want to log to TensorBoard (for example, all fields in a struct). If you want to force
those values to be logged with a certain type, bypassing the default choice, you should convert them
to that type and push the key-value pair to data. For instance, in the example above we could only log the field
`a` of the type `Test` by defining
```
TensorBoardLogger.preprocess(tag, val::Test, data) = preprocess(tag*"/a", val.a, data)
```

### Step information

The step value under which messages are logged starts from 0 and is increased by 1 before logging a message (so
that thefirst logged message will be at step 1). You can change by how much this increases with the special
keyword `log_step_increment`. The default behaviour is equivalent to setting it to 1:

```
@info "msg" data log_step_increment=1 # default behaviour
@info "msg" data log_step_increment=0 # same step as before
```

## Using the explicit interface

To explicitly log to one of the supported backed, you can use one of the `log_****(logger, tag, value; step=step)` 
functions. In TensorBoard data will be shown under the `tag` tag at the `step` provided. If you
don't provide the `step` keyword, the last used step (starting at zero) will be used. 


## Example
```
using TensorBoardLogger, Logging, Random

lg=TBLogger()

with_logger(lg) do
    for i=1:100
        x0 = 0.5+i/30; s0 = 0.5/(i/20);
        edges = collect(-5:0.1:5)
        centers = collect(edges[1:end-1] .+0.05)
        histvals = [exp(-((c-x0)/s0)^2) for c=centers]
        data_tuple = (edges, histvals)


        @info "test" i=i j=i^2 dd=rand(10).+0.1*i hh=data_tuple
        @info "test_2" i=i j=2^i hh=data_tuple log_step_increment=0
    end
end
```

## Roadmap
Support for other data types, such as images and audio clip will be added soon.

Contributions are welcome! You can get in touch by opening an issue, sending
me an email or by saying hi on slack (@PhilipVinc).


# TensorBoardLogger
[![Build Status](https://travis-ci.org/PhilipVinc/TensorBoardLogger.jl.svg?branch=master)](https://travis-ci.org/PhilipVinc/TensorBoardLogger.jl)

**TensorBoardLogger.jl** is an experimental library for logging arbitrary data
to [Tensorboard](https://www.tensorflow.org/guide/summaries_and_tensorboard)
with no dependencies other than [ProtoBuf.jl](https://github.com/JuliaIO/ProtoBuf.jl).

Many ideas are taken from [UniversalTensorBoard](https://github.com/oxinabox/UniversalTensorBoard.jl)
and from [TensorBoardX](https://tensorboardx.readthedocs.io/en/latest/).

## Usage

To use the library you must create a `Logger` object and then log data to it.

  - `TBLogger(dir_path)` creates a logger saving data to the folder `dir_path`
  - `log_value(logger, name, val)` logs to `logger` the value `val` under the tag `name`

## Supported values

At the moment, you can log the following values:

  - `Real` scalar data
  - `Complex` scalar data, which will show up as two real quantities `name/re` and `name/im`
  - `Histograms` passed as an array which will be automatically binned or passed as a tuple of bins/heights of pre-binned data.

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

## Wishlist
I would really like to enable logging of more types of data and expand this
package. For now I plan on adding `log_image` and `log_scalars` very soon.

I would also like to find a way to log whole curves at each timestep.

Contributions are welcome! You can get in touch by opening an issue, sending
me an email or by saying hi on slack (@PhilipVinc).

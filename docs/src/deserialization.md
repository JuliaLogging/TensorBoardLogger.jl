# Reading back TensorBoard data

!!! warning
    The functionality described in this page is still experimental, and the interface might change without warning in future releases.


TensorBoardLogger allows you to read data that has been serialized to TensorBoard, either from Julia or from other applications (e.g. Python).

The simplest way to collect all data from TensorBoard is to use the high-level conversion to `MVHistory` from [`ValueHistories.jl`](https://github.com/JuliaML/ValueHistories.jl) package.

```julia
using TensorBoardLogger, ValueHistories

tb_logger = TBLogger("testlog", tb_overwrite)

with_logger(tb_logger) do
    for i=1:5
        @info "test" val=i b=i*2 mat=i.*ones(3) mat2=10 .*i.*ones(3,2)
    end
end

hist = convert(MVHistory, tb_logger)
```

If you want to read data that have been saved previously, you can also construct a read-only object [`TBReader`](@ref) by passing it the path of the folder containing the data to be deserialized.

Alternatively, you can use the method [`map_summaries`](@ref) to iterate a function of your choice among the data contained in a logger. This function
takes two arguments: a function and the path/`TBLogger` to the data.

The function is mapped across all logged summaries. Its signature should be
`fun(tag, iteration, value)`, where tag is a `String` with the tag used to serialize the data, `iteration` is an `Int` corresponding to the iteration at which the data was serialized, and `value` is the serialized value.

An attempt is made to reconstruct as much as possible the original data, but in the serialization process data is usually converted to lower precision and compressed, so sometimes it's not the case.

```julia
hist = MVHistory

TensorBoardLogger.map_summaries(tb_logger) do tag, iter, val
    push!(hist, Symbol(tag), iter, val)
end
```

All those functions also take as optional keywork arguments a collection of iterations or tags, and will only map over summaries with the desired tags/iterations.

## Reference

```@docs
TBReader
TensorBoardLogger.tags
TensorBoardLogger.steps
map_summaries
TensorBoardLogger.map_events
```

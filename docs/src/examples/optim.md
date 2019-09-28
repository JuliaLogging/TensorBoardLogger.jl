# Using TensorBoard with `Optim.jl`

```julia
using TensorBoardLogger
using Optim
using Logging

# Returns a closure over a logger, that takes a Optim trace as input
function make_tensorboardlogger_callback(dir="logs")
    logger = TBLogger(dir)

    function callback(opt_state:: Optim.OptimizationState)
        with_logger(logger) do
            @info "" opt_step = opt_state.iteration  function_value=opt_state.value gradient_norm=opt_state.g_norm
        end
        return false  # do not terminate optimisation
    end
    callback(trace::Optim.OptimizationTrace) = callback(last(trace))
    return callback
end


rosenbrock(x) =  (1.0 - x[1])^2 + 100.0 * (x[2] - x[1]^2)^2
result = optimize(rosenbrock, zeros(2), BFGS(), Optim.Options(callback=make_tensorboardlogger_callback()))
```

![optim_plot](optim.png)

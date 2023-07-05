using TensorBoardLogger #import the TensorBoardLogger package
using Logging #import Logging package

logger = TBLogger("scalarlogs", tb_append) #create tensorboard logger

################log scalars example: y = x²################
#using logger interface
with_logger(logger) do
    for x in 1:20
        @info "scalar/loggerinterface" y = x*x
    end
end
#using explicit function interface
for x in 1:20
    log_value(logger, "scalar/explicitinterface", x*x, step = x)
end


################log scalar example: y = x-xi################
with_logger(logger) do
    for x in 1:10
        z = x-x*im
        @info "scalar/complex" y = z
    end
end


################control step increments with context################
with_logger(logger) do
    for epoch in 1:10
        for i=1:100
            # increments global_step by default
            with_TBLogger_hold_step() do
                # all of these are logged at the same global_step
                # and the logger global_step is only then increased
                @info "train1/scalar" val=i
                @info "train2/scalar" val2=i/2
                @info "train3/scalar" val3=100-i
            end
        end
        # step increment at end can be disabled for easy train/test sync
        with_TBLogger_hold_step(;step_at_end=false) do
            # all of these are logged at the same global_step
            # and the logger global_step is only then increased
            @info "test1/scalar" epoch=epoch
            @info "test2/scalar" epoch2=epoch^2
            @info "test3/scalar" epoch3=epoch^3
        end
    end
end

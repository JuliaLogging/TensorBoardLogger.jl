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

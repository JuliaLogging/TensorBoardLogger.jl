using TensorBoardLogger #import the TensorBoardLogger package
using Logging #import Logging package
using Gadfly, Cairo, Fontconfig

logger = TBLogger("Gadflylogs", tb_append) #create tensorboard logger

################log scalars example: y = x²################
#using logger interface
x = rand(100)
y = rand(100)
p = plot(x=x, y=y, Geom.point);
with_logger(logger) do
    @info "gadfly" plot=p
end
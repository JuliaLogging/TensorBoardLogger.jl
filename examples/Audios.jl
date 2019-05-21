using TensorBoardLogger #import the TensorBoardLogger package
using Logging #import Logging package

logger = TBLogger("audiologs", tb_append) #create tensorboard logger

################log audio example: cos wave ################
samplerate = 44100
x = collect(1:samplerate*2)
x = cos.(440*pi*x/samplerate)
#using logger interface
with_logger(logger) do
    @info "cos/loggerinterface" x = TBAudio(x, samplerate)
end
#using explicit function interface
log_audio(logger, "cos/explicitinterface", x, samplerate, step = 0)


################log scalar example: sin+cos wave################
y = collect(1:samplerate*2)
y = sin.(440*pi*y/samplerate)
z = x+y
#using logger interface
with_logger(logger) do
    @info "sin+cos/loggerinterface" z = TBAudio(z, samplerate)
end
#using explicit function interface
log_audio(logger, "sin+cos/explicitinterface", z, samplerate, step = 0)

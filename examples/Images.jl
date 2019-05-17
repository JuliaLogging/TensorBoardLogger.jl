using TensorBoardLogger #import the TensorBoardLogger package
using Logging #import Logging package
using TestImages
using Flux: Data
using Random
logger = TBLogger("imagelogs", tb_append) #create tensorboard logger

################log images example: mri################
mri = testimage("mri")

#using logger interface
with_logger(logger) do
    @info "image/mri/loggerinterface" mri
end
#using explicit function interface
log_image(logger, "image/mri/explicitinterface", mri, step = 0)


################log images example: MNIST data################
images = shuffle(Data.MNIST.images())[1:5]

#using logger interface
with_logger(logger) do
    @info "image/mnist/loggerinterface" images = TBImages(images, HW)
end
#using explicit function interface
log_images(logger, "image/mnist/explicitinterface", images, step = 0)


################log images example: random arrays################
noise = rand(16, 16, 3, 4) #Format is HWCN

#using logger interface
with_logger(logger) do
    @info "image/noise/loggerinterface" random = TBImage(noise, HWCN)
end
#using explicit function interface
log_image(logger, "image/noise/explicitinterface", noise, HWCN, step = 0)

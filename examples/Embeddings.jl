using TensorBoardLogger #import the TensorBoardLogger package
using Logging #import Logging package
using TestImages
using Flux, Flux.Data.MNIST

logger = TBLogger("embeddinglogs", tb_append) #create tensorboard logger

################log embeddings example: MNIST data################
mat = MNIST.images()[1:100]
mat = hcat(mat...)
mat = reshape(mat, (28, 28, 100))
mat = permutedims(mat, (3, 1, 2))
mat = reshape(mat, 100, 28*28)
metadata = MNIST.labels()[1:100]

#using explicit function interface
log_embeddings(logger, "mnist", mat, metadata = metadata, step = 0)

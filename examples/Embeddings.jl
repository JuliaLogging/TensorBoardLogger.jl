using TensorBoardLogger #import the TensorBoardLogger package
using Logging #import Logging package
using TestImages
using Flux, Flux.Data.MNIST

logger = TBLogger("embeddinglogs", tb_append) #create tensorboard logger

################log embeddings example: MNIST data################
mat = MNIST.images()[1:100]
n = size(mat, 1)
mat = hcat(mat...)
mat = reshape(mat, (28, 28, n))
imgs = mat
mat = permutedims(mat, (3, 1, 2))
mat = reshape(mat, n, 28*28)
metadata = MNIST.labels()[1:n]

#using explicit function interface
log_embeddings(logger, "mnist", mat, metadata = metadata, img_labels = TBImages(imgs, HWN), step = 0)

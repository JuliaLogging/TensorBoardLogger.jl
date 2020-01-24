using TensorBoardLogger #import the TensorBoardLogger package
using Logging #import Logging package
using TestImages
using Flux, Flux.Data.MNIST
using LinearAlgebra

logger = TBLogger("embeddinglogs", tb_append) #create tensorboard logger

################log embeddings example: MNIST data################
n_samples = 100
features = 100
data = MNIST.images()[1:n_samples]
n = size(data, 1)
data = hcat(data...)
data = reshape(data, (28, 28, n))
imgs = data
data = permutedims(data, (3, 1, 2))
data = reshape(data, n, 28*28)
data = convert(Array{Float64,2}, data)
svd_data = svd(data)
u = svd_data.U
s = Array(Diagonal(svd_data.S))[:, 1:features]
vt = svd_data.Vt[1:features, :]
data = u*s
metadata = MNIST.labels()[1:n]

#using explicit function interface
log_embeddings(logger, "embedding/mnist/explicitinterface", data, metadata = metadata, img_labels = TBImages(imgs, HWN), step = 1)

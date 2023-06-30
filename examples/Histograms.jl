using TensorBoardLogger #import the TensorBoardLogger package
using Logging #import Logging package

logger = TBLogger("histogramlogs", tb_append) #create tensorboard logger

################log histogram example:################
#using logger interface
with_logger(logger) do
    for i in 1:100
        x0 = 0.5+i/30; s0 = 0.5/(i/20);
        edges = collect(-5:0.1:5)
        centers = collect(edges[1:end-1] .+0.05)
        histvals = s0 * randn(length(centers)) .+ x0
        data_tuple = (edges, histvals)
        @info "histogram/loggerinterface" autobin=s0 .* randn(100) .+ x0
        @info "histogram/loggerinterface" manualbin=data_tuple
    end
end

#using explicit function interface
for i in 1:100
    x0 = 0.5+i/30; s0 = 0.5/(i/20);
    edges = collect(-5:0.1:5)
    centers = collect(edges[1:end-1] .+0.05)
    histvals = s0 * randn(length(centers)) .+ x0
    data_tuple = (edges, histvals)
    log_histogram(logger, "histogram/explicitinterface/autobin", s0 .* randn(100) .+ x0, step = i) #automatic bins
    log_histogram(logger, "histogram/explicitinterface/manualbin", data_tuple, step = i) #manual bins
end

using TensorBoardLogger #import the TensorBoardLogger package
using Logging #import Logging package
using Random # Exports randn

# Run 10 experiments to see a plot
for j in 1:10
    logger = TBLogger("random_walks/run$j", tb_append)

    sigma = 0.05
    epochs = 50
    bias = (rand()*2 - 1) # create a random bias
    use_seed = false
    # Add in the a dummy loss metric
    with_logger(logger) do
        x = 0.0
        for i in 1:epochs
            x += sigma * randn() + bias
            @info "scalar" loss = x
        end
    end

    # Hyperparameter is a dictionary of parameter names to their values. This 
    # supports numerical types, bools and strings. Non-bool numerical types 
    # are converted to Float64 to be displayed.
    hparams_config = Dict{String, Any}(
        "sigma"=>sigma,
        "epochs"=>epochs,
        "bias"=>bias,
        "use_seed"=>use_seed,
        "method"=>"MC"
    )
    # Specify a list of tags that you want to show up in the hyperparameter 
    # comparison
    metrics = ["scalar/loss"]
    
    # Write the hyperparameters and metrics config to the logger.
    write_hparams!(logger, hparams_config, metrics)
end
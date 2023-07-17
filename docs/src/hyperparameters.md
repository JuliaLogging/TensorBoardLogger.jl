# Hyperparameter logging

In additition to logging the experiments, you may wish to also visualise the effect of hyperparameters on some plotted metrics. This can be done by logging the hyperparameters via the `write_hparams!` function, which takes a dictionary mapping hyperparameter names to their values (currently limited to `Real`, `Bool` or `String` types), along with the names of any metrics that you want to view the effects of. 

You can see how the HParams dashboard in Tensorboard can be used to tune hyperparameters on the [tensorboard website](https://www.tensorflow.org/tensorboard/hyperparameter_tuning_with_hparams).

## API
```@docs
write_hparams!
```

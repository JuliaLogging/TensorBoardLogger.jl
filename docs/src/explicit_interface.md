# Explicit interface

in addition to the standard logging interface, it is possible to log
data to TensorBoard using the functions documented below.
All the functions take as first argument a `TBLogger` object
and as the second argument a `String` as the tag under which the
data will be logged.

## Scalar backend
```@docs
log_value
```

## Distributions backend
```@docs
log_histogram
log_vector
```

## Text backend
```@docs
log_text
```

## Images backend
```@docs
log_image
log_images
```

## Audio backend
```@docs
log_audio
log_audios
```

## Embeddings backend
```@docs
log_embeddings
```

## Custom Scalars plugin
See [TensorBoard Custom Scalar page](https://github.com/tensorflow/tensorboard/tree/master/tensorboard/plugins/custom_scalar).

For example, to combine in the same plot panel the two curves logged under tags `"Curve/1"` and `"Curve/2"` you can run once the command:
```julia
layout = Dict("Cat" => Dict("Curve" => ("Multiline", ["Curve/1", "Curve/2"])))

log_custom_scalar(lg, layout)

```

See also the documentation below
```@docs
log_custom_scalar
```

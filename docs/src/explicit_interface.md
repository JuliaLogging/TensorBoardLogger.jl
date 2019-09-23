# Explicit interface

in addition to the standard logging interface, it is possible to log
data to TensorBoard using the functions documented below.
All the functions accept take as first argument a `TBLogger` object
and as the second argument a `String` as the tag under which the
data will be logged.

# Scalar backend
```@docs
log_value
```

# Distributions backend
```@docs
log_histogram
log_vector
```

# Text backend
```@docs
log_text
```

# Images backend
```@docs
log_image
log_images
```

# Audio backend
```@docs
log_audio
log_audios
```

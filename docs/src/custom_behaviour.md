# Specifying a backend

By default TensorBoardLogger follows those rules to chose what backend a certain
value is sent to:

  - `::AbstractVector{<:Real}` -> [Histogram backend](https://www.tensorflow.org/guide/tensorboard_histograms) as a vector
  - `::Tuple{AbstractVector,AbstractVector}` [Histogram backend](https://www.tensorflow.org/guide/tensorboard_histograms) as an histogram
  - `::Real` -> Scalar backend
  - `::AbstractArray{<:Colorant}` -> [Image backend](https://www.tensorflow.org/tensorboard/r2/image_summaries)
  - `::Any` -> Text Backend

In addition, `struct`ures are not logged to text, but rather all their fields are
(recursively) dispatched according to the rules above.

If you want to override those defaults, or you wish to specify some additional
details, you can wrap any object into one of the following wrappers:

- `TBText`   -> sends data to Text backend
- `TBAudio`, `TBAudios` -> sends data to audio backend
- `TBHistogram`, `TBVector` -> sends data to the Distributions backend, either as an histogram or as a vector
- `TBImage`, `TBImages` -> Sends data to the images backend

To use those overrides, you simply wrap your type. Some overrides require additional
parameters. For example, to log a vector as text you can do the following:
```
@info "mytag" TBText([1,2,3])
```


```@docs
TBText
TBHistogram
TBVector
TBAudio
TBAudios
TBImage
TBImages
```

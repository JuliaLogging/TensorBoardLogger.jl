# Extending TensorBoardLogger

It is possible to change `TensorBoardLogger`'s behaviour when logging specific
types. Internally, when an object `o::T` is logged to TensorBoard with the
tag `name`, the function `preprocess(name, val, objects)` is called, with `objects`
being an iterable collection of `Pair{String,Any}`.

The `preprocess` function is responsible for converting `o` to or more objects
of simpler types, and pushing them with their tag to the `objects` collection.

At the end of this step, every pair in `objects` will be logged to a specific
backend, according to the following rules:

  - `::AbstractVector{<:Real}` -> [Histogram backend](https://www.tensorflow.org/guide/tensorboard_histograms) as a vector
  - `::Tuple{AbstractVector,AbstractVector}` [Histogram backend](https://www.tensorflow.org/guide/tensorboard_histograms) as an histogram
  - `::Real` -> Scalar backend
  - `::AbstractArray{<:Colorant}` -> [Image backend](https://www.tensorflow.org/tensorboard/r2/image_summaries)
  - `::Any` -> Text Backend

To achieve that, `preprocess(name, o::T, obj)` calls recursively into itself
with simpler types. For example, complex numbers are converted to the real and
imaginary part by the following function:

```
preprocess(name, val::Complex, data) = push!(data, name*"/re"=>real(val), name*"/im"=>imag(val))
```

To give an example, consider the following structure representing a quantity
```
struct LinkedQuantities
  name_1::String
  val_1
  name_2::String
  val_2
end

cost_fun = LinkedQuantities("Loss", 0.5+0.1im, "Loss_Variance", 0.01+0.02im)
```

and consider that you want to log objects of this type so that it logs `val_1` with
the tag `name_1` and `val_2` with tag `name_2`. To achieve that, one defines

```
function preprocess(name, val::LinkedQuantities, data)
  preprocess(val.name_1, val.val_1, data)
  preprocess(val.name_2, val.val_2, data)
end
```

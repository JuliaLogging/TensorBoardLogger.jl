## Overridden behaviours
"""
    WrapperLogType

Abstract wrapper type to override the default backend to which a type would be
logged in TensorBoard.

Every concrete implementation should implement the method `content` for the
concrete type, returning the content.
"""
abstract type WrapperLogType end

"""
    content(x::WrapperLogType)

Returns the wrapped data inside of `x`.
"""
content(x::WrapperLogType) = @error "You should define `content($(typeof(x)))`"

# When we hit a wrapped type, we dispatch based on it's type.
preprocess(name, val::WrapperLogType, data) = push!(data, name=>val)

# When logging to text or console, unwrap the LogType to fix formatting.
Base.show(io::IO, mime::AbstractString, x::WrapperLogType) =
    Base.show(io, mime, content(x))

########## For things going to LogAudio ##############################
"""
    TBAudios(data, samplerate)

Forces elements of Array `data` to be serialized as Audio to TensorBoard.
"""
struct TBAudios <:WrapperLogType
    data::AbstractArray
    samplerate::Real
end
content(x::TBAudios) = x.data
function preprocess(name, val::TBAudios, data)
    for (n, audio) in enumerate(val.data)
        preprocess(name*"/$n", TBAudio(audio, val.samplerate), data)
    end
end

"""
    TBAudio(data, samplerate)

Forces `data` to be serialized as Audio to TensorBoard.
"""
struct TBAudio <: WrapperLogType
    data::AbstractArray
    samplerate::Real
end
content(x::TBAudio) = x.data
preprocess(name, val::TBAudio, data) = push!(data, name=>val)
summary_impl(name, val::TBAudio) = audio_summary(name, val.data, val.samplerate)

########## For things going to LogImage ########################
"""
    TBImages(data, format)

Forces elements of Array `data` to be serialized as an Image to TensorBoard.
"""
struct TBImages <:WrapperLogType
    data::AbstractArray
    format::ImageFormat
end
content(x::TBImages) = x.data
function preprocess(name, val::TBImages, data)
    for (n, img) in enumerate(val.data)
        preprocess(name*"/$n", TBImage(img, val.format), data)
    end
end

"""
    TBImage(data, format)

Forces `data` to be serialized as an Image to TensorBoard.
"""
struct TBImage <: WrapperLogType
    data::AbstractArray
    format::ImageFormat
end
content(x::TBImage) = x.data
function preprocess(name, val::TBImage, data)
    imgArray = val.data
    format = val.format
    imgArray = channelview(imgArray)
    dims = ndims(imgArray)
    @assert dims == expected_ndims(format)
    obsdim = obs_dim(format)
    if iszero(obsdim)
        push!(data, name=>val)
    else
        format = strip_obs[format]
        index = collect("[:"* ",:"^(dims-1) *"]")
        index[2*obsdim] = 'g'
        index = join(index)
        global gimgArray = imgArray
        nth_img = Meta.parse("gimgArray$(index)")
        for n in 1:size(imgArray, obsdim)
            global g = n
            push!(data, name*"/$n"=>TBImage(eval(nth_img), format))
        end
    end
    data
end
summary_impl(name, val::TBImage) = image_summary(name, val.data, val.format)

########## For things going to LogText ##############################
"""
    TBText(data)

Forces `data` to be serialized as text to TensorBoard.
"""
struct TBText <: WrapperLogType data; end
content(x::TBText) = x.data
summary_impl(name, val::TBText) = text_summary(name, val.data)

"""
    RealArrayWrapperLogType{T,N} <: WrapperLogType

A wrapper type that accepts only arrays and converts complex-valued arrays
into two real value ones
"""
abstract type RealArrayWrapperLogType{T,N} <: WrapperLogType end

########## For things going to LogHistograms ########################
"""
    TBHistogram(data)

Forces `data` to be serialized as an histogram to TensorBoard.
"""
struct TBHistogram{T,N} <: RealArrayWrapperLogType{T,N} data::AbstractArray{T,N}; end
content(x::TBHistogram) = x.data
preprocess(name, val::TBHistogram{T,N}, data) where {T<:Complex,N} =
    push!(data, name*"/re"=>TBHistogram(real.(content(val))), name*"/im"=>TBHistogram(imag.(content(val))))
function summary_impl(name, val::TBHistogram)
    hvals = fit(Histogram, val.data)
    return histogram_summary(name, collect(hvals.edges[1]), hvals.weights)
end

"""
    TBVector(data)

Forces `data` to be serialized as a vector in the histogram backend of
TensorBoard.
"""
struct TBVector{T,N} <: RealArrayWrapperLogType{T,N} data::AbstractArray{T,N}; end
content(x::TBVector) = x.data
preprocess(name, val::TBVector{T,N}, data) where {T<:Complex,N} =
    push!(data, name*"/re"=>TBVector(real.(content(val))), name*"/im"=>TBVector(imag.(content(val))))
summary_impl(name, val::TBVector) = histogram_summary(name, collect(0:length(val.data)),
                                                            val.data)

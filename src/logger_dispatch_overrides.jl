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

########## For things going to LogImage ########################
"""
    TBImage(data, format)

Forces `data` to be serialized as an Image to TensorBoard.
"""
struct TBImages <:WrapperLogType
    data::AbstractArray
    format::ImageFormat
end
content(x::TBImages) = x.data
function preprocess(name, val::TBImages, data)
    n = 1
    for img in val.data
        preprocess(name*"/$n", TBImage(img, val.format), data)
    end
end

struct TBImage <: WrapperLogType
    data::AbstractArray
    format::ImageFormat
end
content(x::TBImage) = x.data
function preprocess(name, val::TBImage, data)
    imgArray = val.data
    #formatdict asserts size & format and pushes object into `data`
    #if format contains `N` then push `N` objects into `data`
    formatdict = Dict(
    L => function(imgArray)
        @assert ndims(imgArray) == 1
        push!(data, name=>TBImage(imgArray, val.format))
    end,
    LN => function(imgArray)
        @assert ndims(imgArray) == 2
        N = size(imgArray, 2)
        for n in 1:N
            push!(data, name*"/n"=>TBImage(imgArray[:, n], L))
        end
    end,
    NL => function(imgArray)
        @assert ndims(imgArray) == 2
        N = size(imgArray, 1)
        for n in 1:N
            push!(data, name*"/n"=>TBImage(imgArray[n, :], L))
        end
    end,
    CL => function(imgArray)
        @assert ndims(imgArray) == 2
        push!(data, name=>TBImage(imgArray, val.format))
    end,
    LC => function(imgArray)
        @assert ndims(imgArray) == 2
        push!(data, name=>TBImage(imgArray, val.format))
    end,
    CLN => function(imgArray)
        @assert ndims(imgArray) == 3
        N = size(imgArray, 3)
        for n in 1:N
            push!(data, name*"/n"=>TBImage(imgArray[:, :, N], CL))
        end
    end,
    LCN => function(imgArray)
        @assert ndims(imgArray) == 3
        N = size(imgArray, 3)
        for n in 1:N
            push!(data, name*"/n"=>TBImage(imgArray[:, :, N], LC))
        end
    end,
    NCL => function(imgArray)
        @assert ndims(imgArray) == 3
        N = size(imgArray, 1)
        for n in 1:N
            push!(data, name*"/n"=>TBImage(imgArray[N, :, :], CL))
        end
    end,
    NLC => function(imgArray)
        @assert ndims(imgArray) == 3
        N = size(imgArray, 1)
        for n in 1:N
            push!(data, name*"/n"=>TBImage(imgArray[N, :, :], LC))
        end
    end,
    HW => function(imgArray)
        @assert ndims(imgArray) == 2
        push!(data, name=>TBImage(imgArray, val.format))
    end,
    WH => function(imgArray)
        @assert ndims(imgArray) == 2
        push!(data, name=>TBImage(imgArray, val.format))
    end,
    HWC => function(imgArray)
        @assert ndims(imgArray) == 3
        push!(data, name=>TBImage(imgArray, val.format))
    end,
    WHC => function(imgArray)
        @assert ndims(imgArray) == 3
        push!(data, name=>TBImage(imgArray, val.format))
    end,
    CHW => function(imgArray)
        @assert ndims(imgArray) == 3
        push!(data, name=>TBImage(imgArray, val.format))
    end,
    CWH => function(imgArray)
        @assert ndims(imgArray) == 3
        push!(data, name=>TBImage(imgArray, val.format))
    end,
    HWN => function(imgArray)
        @assert ndims(imgArray) == 3
        N = size(imgArray, 3)
        for n in 1:N
            push!(data, name*"/n"=>TBImage(imgArray[:, :, n], HW))
        end
    end,
    WHN => function(imgArray)
        @assert ndims(imgArray) == 3
        N = size(imgArray, 3)
        for n in 1:N
            push!(data, name*"/n"=>TBImage(imgArray[:, :, n], WH))
        end
    end,
    NHW => function(imgArray)
        @assert ndims(imgArray) == 3
        N = size(imgArray, 1)
        for n in 1:N
            push!(data, name*"/n"=>TBImage(imgArray[n, :, :], HW))
        end
    end,
    NWH => function(imgArray)
        @assert ndims(imgArray) == 3
        N = size(imgArray, 1)
        for n in 1:N
            push!(data, name*"/n"=>TBImage(imgArray[n, :, :], WH))
        end
    end,
    HWCN => function(imgArray)
        @assert ndims(imgArray) == 4
        N = size(imgArray, 4)
        for n in 1:N
            push!(data, name*"/n"=>TBImage(imgArray[:, :, :, n], HWC))
        end
    end,
    WHCN => function(imgArray)
        @assert ndims(imgArray) == 4
        N = size(imgArray, 4)
        for n in 1:N
            push!(data, name*"/n"=>TBImage(imgArray[:, :, :, n], WHC))
        end
    end,
    CHWN => function(imgArray)
        @assert ndims(imgArray) == 4
        N = size(imgArray, 4)
        for n in 1:N
            push!(data, name*"/n"=>TBImage(imgArray[:, :, :, n], CHW))
        end
    end,
    CWHN => function(imgArray)
        @assert ndims(imgArray) == 4
        N = size(imgArray, 4)
        for n in 1:N
            push!(data, name*"/n"=>TBImage(imgArray[:, :, :, n], CWH))
        end
    end,
    NHWC => function(imgArray)
        @assert ndims(imgArray) == 4
        N = size(imgArray, 1)
        for n in 1:N
            push!(data, name*"/n"=>TBImage(imgArray[n, :, :, :], HWC))
        end
    end,
    NWHC => function(imgArray)
        @assert ndims(imgArray) == 4
        N = size(imgArray, 1)
        for n in 1:N
            push!(data, name*"/n"=>TBImage(imgArray[n, :, :, :], WHC))
        end
    end,
    NCHW => function(imgArray)
        @assert ndims(imgArray) == 4
        N = size(imgArray, 1)
        for n in 1:N
            push!(data, name*"/n"=>TBImage(imgArray[n, :, :, :], CHW))
        end
    end,
    NCWH => function(imgArray)
        @assert ndims(imgArray) == 4
        N = size(imgArray, 1)
        for n in 1:N
            push!(data, name*"/n"=>TBImage(imgArray[n, :, :, :], CWH))
        end
    end
    )
    formatdict[val.format](val.data)
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

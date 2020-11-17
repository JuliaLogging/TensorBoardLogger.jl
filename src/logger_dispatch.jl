# This file describes how we decide which logger (e.g. LogText vs LogValue vs LogHistograms)
# to use for what data, and any preprocessing

"""
    preprocess(name, val, data)

This method takes a tag `name` and the value `val::T` pair. If type `T` can be
serialized to TensorBoard then the pair is pushed to `data`, otherwise it should
call `preprocess` recursively with some simpler types, until a serializable
type is finally hit.

For a struct, it calls preprocess on every field.
"""
function preprocess(name, val::T, data) where T
    if isstructtype(T)
        fn = logable_propertynames(val)
        for f=fn
            prop = getfield(val, f)
            preprocess(name*"/$f", prop, data)
        end
    else
        # If we do not know how to serialize a type, then
        # it will be simply logged as text
        push!(data, name=>val)
    end
    data
end

"""
    logable_propertynames(val::Any)

Returns a tuple with the name of the fields of the structure `val` that
should be logged to TensorBoard. This function should be overridden when
you want TensorBoard to ignore some fields in a structure when logging
it. The default behaviour is to return the  same result as `propertynames`.

See also: [`Base.propertynames`](@ref)
"""
logable_propertynames(val::Any) = propertynames(val)

## Default unpacking of key-value dictionaries
function preprocess(name, dict::AbstractDict, data)
    for (key, val) in dict
        # convert any key into a string, via interpolating it
        preprocess("$name/$key", val, data)
    end
    return data
end

## Default behaviours

########## For things going to LogImage ##############################
function preprocess(name, img::AbstractArray{<:Colorant}, data)
    # If it has three dimensions (and we don't have 3D monitors) we log several
    # 2D slices under the same tag so that TB shows a slider along the z direction.
    dimensions = ndims(img)
    if dimensions == 3
        #3rd is channel dim as observed in testimages
        channels = size(img, 3)
        for c in 1:channels
            preprocess(name, convert(PngImage, img[:, :, c]), data)
        end
    else
        preprocess(name, convert(PngImage, img), data)
    end
    return data
end
preprocess(name, val::PngImage, data) = push!(data, name=>val)
summary_impl(name, value::PngImage) = image_summary(name, value)


########## For things going to LogText ##############################
preprocess(name, val::AbstractString, data) where T<:String = push!(data, name=>val)
summary_impl(name, value::Any) = text_summary(name, value)


########## For things going to LogHistograms ########################
# Only consider 1D histograms for histogram plotting
preprocess(name, hist::Histogram{T,1}, data) where T = push!(data, name=>hist)
summary_impl(name, hist::Histogram) = histogram_summary(name, hist)

# TODO: maybe deprecate? tuple means histogram (only if bins/weights match)
function preprocess(name,   (bins,weights)::Tuple{AbstractVector,AbstractVector}, data)
    # if ... this is an histogram
    if length(bins) == length(weights)+1
        return preprocess(name, Histogram(bins,weights), data)
    end
    preprocess(name*"/1", bins, data)
    preprocess(name*"/2", weights, data)
end

preprocess(name, val::AbstractArray{<:Real}, data) = push!(data, name=>val)
summary_impl(name, val::AbstractArray{<:Real}) = histogram_arr_summary(name, val)

# Split complex numbers into real/complex pairs
preprocess(name, val::AbstractArray{<:Complex}, data) = push!(data, name*"/re"=>real.(val), name*"/im"=>imag.(val))


########## For things going to LogValue #############################
preprocess(name, val::Real, data) = push!(data, name=>val)
summary_impl(name, value::Real) = scalar_summary(name, value)

# Split complex numbers into real/complex pairs
preprocess(name, val::Complex, data) = push!(data, name*"/re"=>real(val), name*"/im"=>imag(val))

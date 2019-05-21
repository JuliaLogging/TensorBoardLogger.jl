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
logable_propertynames(val::Type) = propertynames(val)

## Default behaviours

########## For things going to LogImage ##############################
function preprocess(name,   img::AbstractArray{<:Colorant}, data)
    dimensions = ndims(img)
    #if it has 3 dimensions, eg MRI image, log each channel vth same name
    #so that one can slide through channels
    if dimensions == 3
        #3rd is channel dim as observed in testimages
        channels = size(img, 3)
        for c in 1:channels
            push!(data, name=>img[:, :, c])
        end
    else
        push!(data, name=>img)
    end
    data
end
summary_impl(name, img::AbstractArray{<:Colorant}) = image_summary(name, img)


########## For things going to LogText ##############################
preprocess(name, val::AbstractString, data) where T<:String = push!(data, name=>val)
summary_impl(name, value::Any) = text_summary(name, value)


########## For things going to LogHistograms ########################
preprocess(name,   val::AbstractVector{<:Real}, data) = push!(data, name=>val)
summary_impl(name, val::AbstractVector{<:Real}) = histogram_summary(name, collect(0:length(val)),val)

preprocess(name,   (bins,weights)::Tuple{AbstractVector,AbstractVector}, data) = push!(data, name=>(bins, weights))
summary_impl(name, (bins,weights)::Tuple{AbstractVector,AbstractVector}) = histogram_summary(name, bins, weights)

# Split complex numbers into real/complex pairs
preprocess(name, val::AbstractVector{<:Complex}, data) = push!(data, name*"/re"=>real.(val), name*"/im"=>imag.(val))
preprocess(name, val::AbstractArray, data) = push!(data, name=>vec(val))


########## For things going to LogValue #############################
preprocess(name, val::Real, data) = push!(data, name=>val)
summary_impl(name, value::Real) = scalar_summary(name, value)

# Split complex numbers into real/complex pairs
preprocess(name, val::Complex, data) = push!(data, name*"/re"=>real(val), name*"/im"=>imag(val))

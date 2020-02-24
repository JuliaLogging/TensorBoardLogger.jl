function deserialize_image_summary(summary)
    img = summary.image

    value = _deserialize_png(img.encoded_image_string)

    return value
end

function lookahead_deserialize_image_summary(old_tag, old_val, evs::Summary,
                                                 state_old)
    # prepare the default output (when no action is taken)
    result = old_tag, old_val, state_old
    combined_imgs = [old_val]

    state = state_old + 1
    iter_result = iterate(evs, state)
    while iter_result !== nothing
        ((tag, summary), state) = iter_result
        # iteration body
        typ = summary_type(summary)
        typ !== :image && break
        tag != old_tag && break

        push!(combined_imgs, deserialize_image_summary(summary))

        # end iterate
        iter_result = iterate(evs, state)
    end

    if length(combined_imgs) > 1
        new_val = similar(old_val, size(old_val)..., length(combined_imgs))
        for (i, img)=enumerate(combined_imgs)
            new_val[:, :, i] .= img
        end
        result =  old_tag, new_val, state_old + length(combined_imgs)
    end

    return result
end


# Ugly-ugly hack to work around
# https://github.com/JuliaIO/FileIO.jl/issues/174
# Essentially, ImageMagick.load() cannot handle an in-memory stream
# but only files. Instead, ImageMagick.readblob() should be used.
# On MacOs it's not a problem thanks to QuartzImageIO
if !Sys.isapple()
    did_patch_imagemagick = false

    function _deserialize_png(data)
        if !did_patch_imagemagick
            global did_patch_imagemagick = true

            # First load ImageMagick
            FileIO.checked_import(:ImageMagick)
        end
        # attempt to mimick ImageMagick type reconstruction
        attributes = PNGImage.read_info(data)
        T = PNGImage.png_color_T(attributes)

        # This errors becase we are loading ImageMagick after defining func.
        # data = FileIO.ImageMagick.readblob(data)
        # ERROR: MethodError: no method matching readblob(::Array{UInt8,1})
        # The applicable method may be too new
        _data = Base.invokelatest(FileIO.ImageMagick.readblob, data)
        return reinterpret(T, _data)
    end
else
    _deserialize_png(data) = load(Stream(format"PNG", IOBuffer(data)))
end

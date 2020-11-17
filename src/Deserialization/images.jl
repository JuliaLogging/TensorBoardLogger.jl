function deserialize_image_summary(summary)
    img = summary.image

    value = load(Stream(format"PNG", IOBuffer(img.encoded_image_string)))

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

function deserialize_image_summary(summary)
    img = summary.image

    #attributes = read_info(img.encoded_image_string)
    value = load(Stream(format"PNG", PipeBuffer(img.encoded_image_string)))

    return value
end

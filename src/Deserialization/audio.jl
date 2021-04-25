function deserialize_audio_summary(summary)
    audio = summary.audio

    if audio.content_type == "audio/wav"
        value = load(_format_stream(format"WAV", PipeBuffer(audio.encoded_audio_string)))
    else
        value = nothing
        @warn "unknown audio format $(audio.content_type)"
    end

    return value
end

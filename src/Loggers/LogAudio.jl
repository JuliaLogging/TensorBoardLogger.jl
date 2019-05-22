"""
    log_audios(logger::TBLogger, name::AbstractString, samples::AbstractArray, samplerate::Real, step)

Logs multiple audio clips at step `step`
- samples:
    Array of audio clips which are Arrays of samples N*C where N = number of samples and C = number of channel
- samplerate: Sampling rate or Sampling frequency: a Real value same for all clips
"""
function log_audios(logger::TBLogger, name::AbstractString, samplesArray::AbstractArray, samplerate::Real; step=nothing)
    for (n, sample) in enumerate(samplesArray)
        log_audio(logger, name*"/$n", sample, samplerate, step = step)
    end
end
"""
    log_audio(logger::TBLogger, name::AbstractString, samples::AbstractArray, samplerate::Real, step)

Logs an audio clip with name `name` at step `step`
- samples: Array of samples N*C where N = number of samples and C = number of channels
- samplerate: Sampling rate or Sampling frequency: a Real value
"""
function log_audio(logger::TBLogger, name::AbstractString, samples::AbstractArray, samplerate::Real; step=nothing)
    summ = SummaryCollection(audio_summary(name, samples, samplerate))
    write_event(logger.file, make_event(logger, summ, step=step))
end

function audio_summary(name::AbstractString, samples::AbstractArray, samplerate::Real)
    @assert ndims(samples) <= 2
    samples = samples./max(maximum(samples), 1)
    samples = Int16.(floor.(samples.*32767))
    io = IOBuffer()
    save(Stream(format"WAV", io), samples)
    eas = io.data
    audio = Summary_Audio(sample_rate = samplerate, num_channels = ndims(samples), length_frames = size(samples, 1), encoded_audio_string = eas, content_type = "audio/wav")
    Summary_Value(tag=name, audio=audio)
end

using FileIO: FileIO

# Required for compatibility with pre 1.6 and post 1.6
# drop in the future if the minimum requirement is bumped
if isdefined(FileIO, :action)
    # FileIO >= 1.6
    _format_stream(format, io) = FileIO.Stream{format}(io)
else
    _format_stream(format, io) = FileIO.Stream(format, io)
end
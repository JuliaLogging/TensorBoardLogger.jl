struct TBReader
    logdir::String
end

TBReadable = Union{TBLogger, TBReader}

logdir(reader::TBReader) = reader.logdir

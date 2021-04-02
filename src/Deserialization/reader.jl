"""
    TBReader(logdir)

Creates a TBReader object that can be used to deserialize data but cannot be used to
write. 
"""
struct TBReader
    logdir::String
end

"""
An Union of types that can be deserialized with TensorBoardLogger.Deserialization
"""
TBReadable = Union{TBLogger, TBReader}

logdir(reader::TBReader) = reader.logdir

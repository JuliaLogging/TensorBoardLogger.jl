"""

"""
function log_embeddings(logger::TBLogger, name::AbstractString, mat::AbstractMatrix; metadata=nothing, labels=nothing, metadata_header=nothing, step=nothing)
    ndims(mat) == 2 || throw(DimensionMismatch("Embedding matrix must be 2-Dimensional. ("*string(ndims(mat))*" ≠ 2)"))
    matrix_path = joinpath(logger.logdir, string(step), name)
    mkpath(matrix_path)
    if metadata != nothing
        length(metadata) == size(mat, 1) || throw(ErrorException("#labels must be equal to #samples. ("*string(length(metadata))*" ≠ "*string(size(mat, 1))*")"))
        if metadata_header == nothing
            metadata_header = [string(x) for x in metadata]
        else
            length(metadata_header) == size(metadata, 2) || throw(ErrorException("length of header must be equal to the number of columns in metadata. ("*string(length(metadata_header))*" ≠ "*string(size(metadata, 2))*")"))
            metadata = [join(metadata_header, '\t'); [join(metadata[i, :], '\t') for i in 1:size(metadata, 1)]]
        end
        write_metadata(metadata, matrix_path, metadata_header)
    end
    if labels != nothing
        labels = convert_to_NCHW()
    end
    write_matrix(mat, matrix_path)
    write_pbtext(name, logger.logdir, matrix_path, metadata, step)
end

function write_matrix(mat::AbstractMatrix, matrix_path::AbstractString)
    matrix_path = joinpath(matrix_path, "tensor.tsv")
    mat = convert(Array{Float64,2}, mat)
    open(matrix_path, "w") do file
        for i in 1:size(mat, 1)
            write(file, join(mat[i, :], '\t'))
            write(file, '\n')
        end
    end
end

function write_metadata(metadata::AbstractArray, matrix_path::AbstractString, metadata_header::AbstractArray)
    matrix_path = joinpath(matrix_path, "metadata.tsv")
    open(matrix_path, "w") do file
        for x in metadata
            write(file, string(x)*'\n')
        end
    end
end

function write_pbtext(name::AbstractString, path::AbstractString, matrix_path::AbstractString, metadata, step)
    metadata_path = joinpath(matrix_path, "metadata.tsv")
    matrix_path = joinpath(matrix_path, "tensor.tsv")
    path = joinpath(path, "projector_config.pbtxt")
    open(path, "w") do file
        write(file, "embeddings {\n")
        write(file, "tensor_name: \""*name*":"*string(step)*"\"\n")
        write(file, "tensor_path: \""*matrix_path*"\"\n")
        if metadata != nothing
            write(file, "metadata_path: \""*metadata_path*"\"\n")
        end
        write(file, "}\n")
    end
end

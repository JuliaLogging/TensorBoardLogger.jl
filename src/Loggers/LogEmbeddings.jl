"""

"""
function log_embeddings(logger::TBLogger, name::AbstractString, mat::AbstractArray; metadata=nothing, labels=nothing, metadata_header=nothing, step=nothing)
    @assert ndims(mat) == 2 "Embedding matrix must be 2-D"
    matrix_path = joinpath(logger.logdir, string(step), name)
    mkpath(matrix_path)
    if metadata != nothing
        @assert length(metadata) == size(mat, 1) "#labels must be equal to #samples"
        if metadata_header == nothing
            metadata_header = [string(x) for x in metadata]
        else
            @assert length(metadata_header) == size(metadata, 2) "length of header must be equal to the number of columns in metadata"
            metadata = vcat([join(metadata_header, '\t')], [join(x, '\t') for x in metadata])
        end
        write_metadata(metadata, matrix_path, metadata_header)
    end
    write_matrix(mat, matrix_path)
    write_pbtext(name, logger.logdir, matrix_path, metadata, step)
end

function write_matrix(mat::AbstractArray, matrix_path::AbstractString)
    matrix_path = joinpath(matrix_path, "tensor.tsv")
    file = open(matrix_path, "w")
    mat = convert(Array{Float64,2}, mat)
    for i in 1:size(mat, 1)
        write(file, join(mat[i, :], '\t'))
        write(file, '\n')
    end
    flush(file)
    close(file)
end

function write_metadata(metadata::AbstractArray, matrix_path::AbstractString, metadata_header::AbstractArray)
    matrix_path = joinpath(matrix_path, "metadata.tsv")
    file = open(matrix_path, "w")
    for x in metadata
        write(file, string(x)*'\n')
    end
    flush(file)
    close(file)
end

function write_pbtext(name::AbstractString, path::AbstractString, matrix_path::AbstractString, metadata, step)
    metadata_path = joinpath(matrix_path, "metadata.tsv")
    matrix_path = joinpath(matrix_path, "tensor.tsv")
    path = joinpath(path, "projector_config.pbtxt")
    file = open(path, "w")
    write(file, "embeddings {\n")
    write(file, "tensor_name: \""*name*":"*string(step)*"\"\n")
    write(file, "tensor_path: \""*matrix_path*"\"\n")
    if metadata != nothing
        write(file, "metadata_path: \""*metadata_path*"\"\n")
    end
    write(file, "}\n")
    flush(file)
    close(file)
end

"""
    log_embeddings(logger::TBLogger, name::AbstractString, mat::AbstractMatrix; metadata, metadata_header, img_labels, step=step(logger))

Log embedding data to tensorboard and visualize in 3-D or 2-D with PCA, t-SNE or UMAP.
- mat: 2-D `Matrix` of data, with rows representing the samples and columns representing the features
- metadata: Array of labels for each sample. Each element across 1st dimenstion will be converted to `string`
- metadata_header: 1-D Array. Useful when samples have multiple labels. size should be same as size of each row in `metadata`
- img_labels: TBImages object representing image labels for each sample.
    - each number of images (N) must be equal to number of samples in `mat`
    - each image must be a square (H == W)
    - the value √N * W must be less than or equal to 8192 because of tensorboard restrictions.
"""
function log_embeddings(logger::TBLogger, name::AbstractString, mat::AbstractMatrix; metadata=nothing, metadata_header=nothing, img_labels=nothing, step=nothing)
    ndims(mat) == 2 || throw(DimensionMismatch("Embedding matrix must be 2-Dimensional. ("*string(ndims(mat))*" ≠ 2)"))
    matrix_path = joinpath(logger.logdir, repr(step), name)
    mkpath(matrix_path)
    if metadata != nothing
        size(metadata, 1) == size(mat, 1) || throw(ErrorException("#labels must be equal to #samples. ("*string(length(metadata))*" ≠ "*string(size(mat, 1))*")"))
        if metadata_header == nothing
            metadata = [string(x) for x in metadata]
        else
            length(metadata_header) == size(metadata, 2) || throw(ErrorException("length of header must be equal to the number of columns in metadata. ("*string(length(metadata_header))*" ≠ "*string(size(metadata, 2))*")"))
            metadata = [join(metadata_header, '\t'); [join(metadata[i, :], '\t') for i in 1:size(metadata, 1)]]
        end
        write_metadata(metadata, matrix_path)
    end
    if img_labels != nothing
        img_labels = convert_to_NCHW(content(img_labels), img_labels.format)
        size(img_labels, 1) == size(mat, 1) || throw(ErrorException("#label images must be equal to #samples. ("*string(size(img_labels, 1))*" ≠ "*string(size(mat, 1))*")"))
        size(img_labels, 3) == size(img_labels, 4) || throw(ErrorException("#label images must be square"))
        write_sprite(img_labels, matrix_path)
    end
    write_matrix(mat, matrix_path)
    write_pbtext(name, logger.logdir, matrix_path, metadata, img_labels, step)
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

function write_metadata(metadata::AbstractArray, matrix_path::AbstractString)
    matrix_path = joinpath(matrix_path, "metadata.tsv")
    open(matrix_path, "w") do file
        for x in metadata
            write(file, string(x)*'\n')
        end
    end
end

function write_sprite(img_labels::AbstractArray, matrix_path::AbstractString)
    n, _, _, w = size(img_labels)
    sqrt(n)*w <= 8192 || throw(ErrorException("the value √N * W must be less than or equal to 8192 because of tensorboard restrictions"))
    total_pixels = size(img_labels, 1)*size(img_labels, 3)*size(img_labels, 4)
    pixels_one_side = sqrt(total_pixels)
    number_of_images_per_row = Integer(ceil(pixels_one_side/size(img_labels, 4)))
    arranged_img_CHW = make_grid_of_images(img_labels, number_of_images_per_row)
    sprite_size = size(arranged_img_CHW, 3)
    arranged_augment_square_CHW = zeros((3, sprite_size, sprite_size))
    arranged_augment_square_CHW[:, 1:size(arranged_img_CHW, 2), :] = arranged_img_CHW
    sprite_path = joinpath(matrix_path, "sprite.png")
    save(sprite_path, colorview(RGB, arranged_augment_square_CHW))
end

function make_grid_of_images(img_labels::AbstractArray, ncols::Integer)
    if size(img_labels, 2) == 1
        img_labels = cat(img_labels, img_labels, img_labels, dims = 2)
    end
    n, c, h, w = size(img_labels)
    ncols = min(ncols, n)
    nrows = Integer(ceil(n/ncols))
    grid = zeros(c, h*nrows, w*ncols)
    i = 0
    for y in 1:nrows
        for x in 1:ncols
            if i >= n
                break
            end
            grid[:, (y-1)*h+1:y*h, (x-1)*w+1:x*w] = img_labels[i+1, :, :, :]
            i = i+1
        end
    end
    grid
end

function write_pbtext(name::AbstractString, path::AbstractString, matrix_path::AbstractString, metadata, img_labels, step)
    metadata_path = joinpath(matrix_path, "metadata.tsv")
    img_labels_path = joinpath(matrix_path, "sprite.png")
    matrix_path = joinpath(matrix_path, "tensor.tsv")
    path = joinpath(path, "projector_config.pbtxt")
    open(path, "w") do file
        write(file, "embeddings {\n")
        write(file, "tensor_name: \""*name*":"*string(step)*"\"\n")
        write(file, "tensor_path: \""*matrix_path*"\"\n")
        if metadata != nothing
            write(file, "metadata_path: \""*metadata_path*"\"\n")
        end
        if img_labels != nothing
            write(file, "sprite {\n")
            write(file, "image_path: \""*img_labels_path*"\"\n")
            write(file, "single_image_dim: "*string(size(img_labels, 4))*"\n")
            write(file, "single_image_dim: "*string(size(img_labels, 3))*"\n")
            write(file, "}\n")
        end
        write(file, "}\n")
    end
end

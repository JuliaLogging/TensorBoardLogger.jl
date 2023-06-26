## Note: this file is supposed to be run from the TensorBoardLogger/gen folder as
## $ cd .../TensorBoardLogger/gen
## $ julia --project=. compile_proto.jl

# The proto folder is generated by the following script
# and then manually cleaning the output from useless stuff
#
# mkdir -p tmp/proto && cd tmp
# git clone --recurse-submodules git@github.com:tensorflow/tensorboard.git
# git clone --recurse-submodules git@github.com:tensorflow/tensorflow.git
# rsync -zarvm --include="*/" --include="*.proto" --exclude="*" tensorboard proto
# rsync -zarvm --include="*/" --include="*.proto" --exclude="*" tensorflow proto

using ProtoBuf
using Glob 
using FilePaths; using FilePathsBase: /

pbpath =dirname(dirname(PosixPath(pathof(ProtoBuf))))/p"gen"

## Setup input and output paths
cur_path = cwd()
TBL_root = dirname(cur_path)

# src_dir = cur_path/"proto"
src_dir = PosixPath(".")/"proto"
out_dir = cur_path/"protojl"

## Clean the output directory
rm(out_dir, force=true, recursive=true)

## First module
function process_module(cur_module::AbstractString; base_module::AbstractString=cur_module, input_path=cur_module)

    # Output folder
    module_out_dir = out_dir/cur_module

    # Input files
    infiles = split.(string.(glob("*.proto", src_dir/input_path)), '/') .|> (a -> a[3:end]) .|> a -> joinpath(a...)

    mkpath(module_out_dir)
    relative_paths = string.(infiles)
    search_directories = joinpath(@__DIR__, "proto")
    output_directory = string(module_out_dir)
    # println("relative_paths=$relative_paths")
    # println("search_directories=$search_directories")
    # println("output_directory=$output_directory")
    ProtoBuf.protojl(relative_paths ,search_directories ,output_directory)
    files_to_include = [string(module_out_dir/basename(file)) for file in infiles]
    return files_to_include
end

#process_module("tensorflow", input_path="tensorflow/core/protobuf")

files_to_include = process_module("tensorboard", input_path="tensorboard/compat/proto")

#plugins = ["audio", "custom_scalar", "hparams", "histogram", "image", "scalar", "text"]
plugins = ["custom_scalar", "hparams", "text"]

append!(files_to_include, (process_module("tensorboard/plugins/$plugin", base_module="tensorboard") for plugin in plugins)...)

# files_to_include contains all the proto files, can be used for printing and inspection
println("generated code for \n$files_to_include")

# Finally move the output directory to the src folder
mv(out_dir, TBL_root/"src"/"protojl")

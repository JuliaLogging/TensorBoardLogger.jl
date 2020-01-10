# Note: we use the 100s place of the enum to represent the number of dimensions
# And the 10s place to represent which dimension is the observation (N), 0 for no observation dimension
@enum ImageFormat begin
    PNG=0;
    L=100;
    CL=200; LC; HW; WH; NL=210; LN=220;
    HWC=300; WHC; CHW; CWH; NCL=310; NHW; NWH; NLC; CLN=330; LCN; HWN; WHN;
    NHWC=410; NWHC; NCHW; NCWH; HWCN=440; WHCN; CHWN; CWHN;
end

expected_ndims(x::ImageFormat) = Int(x) ÷ 100 # get the 100's digit
obs_dim(x::ImageFormat) = (Int(x) % 100) ÷ 10 # get the 10's digit
const strip_obs = Dict(
    NL=>L, LN=>L, NCL=>CL, CLN=>CL, NLC=>LC, LCN=>LC,
    NHW=>HW, HWN=>HW, NWH=>WH, WHN=>WH,
    NHWC=>HWC, NWHC=>WHC, NCHW=>CHW, NCWH=>CWH, HWCN=>HWC, WHCN=>WHC, CHWN=>CHW, CWHN=>CWH
)

function convert_to_CHW(imgArray::AbstractArray, format)
    converted =
        format == L   ? reshape(imgArray, (1, 1, size(imgArray, 1))) :
        format == CL  ? reshape(imgArray, (size(imgArray, 1), 1, size(imgArray, 2))) :
        format == LC  ? reshape(transpose(imgArray), (size(imgArray, 2), 1, size(imgArray, 1))) :
        format == HW  ? reshape(imgArray, (1, size(imgArray, 1), size(imgArray, 2))) :
        format == WH  ? reshape(transpose(imgArray), (1, size(imgArray, 2), size(imgArray, 1))) :
        format == HWC ? permutedims(imgArray, (3, 1, 2)) :
        format == WHC ? permutedims(imgArray, (3, 2, 1)) :
        format == CHW ? imgArray :
        format == CWH ? permutedims(imgArray, (1, 3, 2)) :
        #== else ==# throw("Invalid format")
    return converted
end

function convert_to_NCHW(labels::TBImages)
    data = content(labels)
    format = labels.format
    obs_dim(format) > 0 || throw(ErrorException("Expected format with observation dimension (N)"))
    n = obs_dim(format)
    e_ndims = expected_ndims(format)
    stripped_format = strip_obs[format]
    imgsArray =
        e_ndims == 2 && n == 1 ? [data[i, :] for i in 1:size(data, n)] :
        e_ndims == 2 && n == 2 ? [data[:, i] for i in 1:size(data, n)] :
        e_ndims == 3 && n == 1 ? [data[i, :, :] for i in 1:size(data, n)] :
        e_ndims == 3 && n == 2 ? [data[:, i, :] for i in 1:size(data, n)] :
        e_ndims == 3 && n == 3 ? [data[:, :, i] for i in 1:size(data, n)] :
        e_ndims == 4 && n == 1 ? [data[i, :, :, :] for i in 1:size(data, n)] :
        e_ndims == 4 && n == 2 ? [data[:, i, :, :] for i in 1:size(data, n)] :
        e_ndims == 4 && n == 3 ? [data[:, :, i, :] for i in 1:size(data, n)] :
        e_ndims == 4 && n == 4 ? [data[:, :, :, i] for i in 1:size(data, n)] :
        #== else ==# throw("Invalid format")
    transformed = map(x -> convert_to_CHW(x, stripped_format), imgsArray)
    transformed = map(x -> reshape(x, (1, size(x)...)), transformed)
    converted = vcat(transformed...)
end
function ColorType_from_nchannels(channels)
    color =
        channels == 1 ? Gray :
        channels == 2 ? GrayA :
        channels == 3 ? RGB :
        channels == 4 ? RGBA :
        #== else ==# throw("Too many channels")
    return color
end

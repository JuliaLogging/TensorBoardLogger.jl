# Note: we use the 100s place of the enum to represent the number of dimensions
# And the 10s place to represent which dimension is the observation (N), 0 for no observation dimension
@enum ImageFormat begin
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

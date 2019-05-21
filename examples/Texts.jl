using TensorBoardLogger #import the TensorBoardLogger package
using Logging #import Logging package

logger = TBLogger("textlogs", tb_append) #create tensorboard logger

################log scalars example: String################
#using logger interface
with_logger(logger) do
    @info "string/loggerinterface" str = "A computer once beat me at chess, but it was no match for me at kick boxing. *— Emo Philips*"
end
#using explicit function interface
str =
"
All parts should go together without forcing.
You must remember that the parts you are reassembling were disassembled by you.
Therefore, if you can’t get them together again, there must be a reason.
By all means, do not use a hammer.”
*— IBM Manual, 1925*
"
log_text(logger, "string/explicitinterface", str, step = 0)


################log scalar example: y = matrix################
squares =
[["Number" "Square"];
[1 1]; [2 4]; [3 9]; [4 16]; [5 25]; [6 36]; [7 49]; [8 64]; [9 81]; [10 100]]

#using explicit function interface
log_text(logger, "table", squares, step = 0)

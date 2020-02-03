import .ValueHistories: MVHistory

function Base.convert(::Type{MVHistory}, tbl::TBLogger; kwargs...)
    hist = MVHistory()

    map_summaries(tbl; kwargs...) do tag, iter, val
        push!(hist, Symbol(tag), iter, val)
    end

    return hist
end

ValueHistories.MVHistory(tbl::TBLogger; kwargs...) = convert(MVHistory, tbl; kwargs...)

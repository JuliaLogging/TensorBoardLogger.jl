
function log_keyval(lg::TBLogger, key, val, step)
    # Preprocess the as if it was a key=>value pair
    data = Vector{Pair{String,Any}}()
    preprocess("$key", val, data)

    summ    = SummaryCollection()
    for (name,val) in data
        push!(summ.value, summary_impl(name, val))
    end

    # Serialize to file
    write_event(lg.file, make_event(lg, summ, step=step))
end

"""
    log_value(logger, name, value, step)

Logs a Floating-point variable with name `name` at step `step`
"""
function log_value(logger::Logger, name::String, value::Real; step=nothing)
    summ    = SummaryCollection()
    push!(summ.value, scalar_summary(name, value))
    write_event(logger.file, make_event(logger, summ, step=step))
end

function log_value(logger::Logger, name::String, value::Complex; step=nothing)
    log_value(logger, name*"/re", real(value), step)
    log_value(logger, name*"/im", imag(value), step)
end

function scalar_summary(name::String, value::Real)
    Summary_Value(tag=name, simple_value=value)
end

## Backward compatibility
log_value(logger, name, value, step) =
    log_value(logger, name, value, step=step)

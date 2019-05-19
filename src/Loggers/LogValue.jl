"""
    log_value(logger, name, value, step)

Logs a Floating-point variable with name `name` at step `step`
"""
function log_value(logger::TBLogger, name::AbstractString, value::Real; step=nothing)
    summ = SummaryCollection(scalar_summary(name, value))
    write_event(logger.file, make_event(logger, summ, step=step))
end

function log_value(logger::TBLogger, name::AbstractString, value::Complex; step=nothing)
    log_value(logger, name*"/re", real(value), step=step)
    log_value(logger, name*"/im", imag(value), step=step)
end

function scalar_summary(name::AbstractString, value::Real)
    Summary_Value(tag=name, simple_value=value)
end

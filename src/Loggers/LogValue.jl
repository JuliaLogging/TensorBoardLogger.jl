"""
    log_value(logger, name, value, step)

Logs a Floating-point variable with name `name` at step `step`
"""
function log_value(logger::TBLogger, name::String, value::Real; step=nothing)
    summ    = SummaryCollection()
    push!(summ.value, scalar_summary(name, value))
    write_event(logger.file, make_event(logger, summ, step=step))
end

function log_value(logger::TBLogger, name::String, value::Complex; step=nothing)
    log_value(logger, name*"/re", real(value), step)
    log_value(logger, name*"/im", imag(value), step)
end

function scalar_summary(name::String, value::Real)
    Summary_Value(tag=name, simple_value=value)
end


## Logger Interface

# Define the type(s) that can be serialized to TensorBoard
preprocess(name, val::Real, data) where T<:Real = push!(data, name=>val)
summary_impl(name, value::Real) = scalar_summary(name, value)

# Split complex numbers into real/complex pairs
preprocess(name, val::Complex, data) = push!(data, name*"/re"=>real(val), name*"/im"=>imag(val))

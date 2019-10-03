import .Tracker

preprocess(name, x::T, data) where {T<:Union{Tracker.TrackedReal,Tracker.TrackedArray}}= push!(data, name => Tracker.data(x))

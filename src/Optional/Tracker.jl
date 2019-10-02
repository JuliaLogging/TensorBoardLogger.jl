import .Tracker

preprocess(name, x::Tracker.TrackedReal, data) = push!(data, name => Tracker.data(x))

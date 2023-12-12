prob(v::Array) = abs2.(normalize(vec(v)))

prob2dict(v::Vector{<: Real}; pad = 9, rev = false) = Dict((rev ? reverse : identity)(string(i - 1; base = 2, pad = pad)) => v[i] for i in 1:length(v))
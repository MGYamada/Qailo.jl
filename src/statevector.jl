product_state(psi::Vector{T}, ::Val{N}) where {T, N} = reshape(kron(ntuple(x -> psi, Val(N))...), ntuple(x -> 2, Val(N)))
zero_state(::Val{N}, T = ComplexF64) where N = product_state([one(T), zero(T)], Val(N))
one_state(::Val{N}, T = ComplexF64) where N = product_state([zero(T), one(T)], Val(N))

macro zero(n, T = ComplexF64)
    :(zero_state(Val($n), $T))
end

macro one(n, T = ComplexF64)
    :(one_state(Val($n), $T))
end
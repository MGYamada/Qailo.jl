function apply(sv::Array{T, N}, g::Gate{t, m, n}) where {T, N, t, m, n}
    p = vcat([g.ind...], filter(i -> i ∉ g.ind, 1:N))
    d = 1 << n
    permutedims(reshape(reshape(g.op, d, d) * reshape(permutedims(sv, p), d, :), ntuple(x -> 2, Val(N))), invperm(p))
end

apply(sv::Array, c::Circuit) = reduce(apply, (sv, c...))
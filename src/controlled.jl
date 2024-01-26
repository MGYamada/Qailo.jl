controlled(g::Gate{T, M, N}, i) where {T, M, N} = Gate(permutedims(reshape(kron(vec(Matrix{T}(I, 2 ^ N, 2 ^ N)), [one(T), zero(T), zero(T), zero(T)]) .+ kron(vec(g.op), [zero(T), zero(T), zero(T), one(T)]), 2, 2, size(g.op)...), [1, 3:(N + 2)..., 2, (N + 3):(2N + 2)...]), " C" * g.symbol, i, g.ind...)

CX(i, j, T = Float64) = controlled(X(j, T), i)
CY(i, j, T = ComplexF64) = controlled(Y(j, T), i)
CZ(i, j, T = Float64) = controlled(Z(j, T), i)
CP(phi::T, i, j, S = Float64) where T <: Real = controlled(P(phi, j), i)

CCX(i, j, k, T = Float64) = controlled(CX(j, k, T), i)
CCY(i, j, k, T = ComplexF64) = controlled(CY(j, k, T), i)
CCZ(i, j, k, T = Float64) = controlled(CZ(j, k, T), i)
CCP(phi::T, i, j, k, S = Float64) where T <: Real = controlled(CP(phi, j, k, S), i)
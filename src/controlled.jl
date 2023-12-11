function controlled(u::Matrix{T}) where T
    i, j = size(u)
    permutedims(reshape(cat(Matrix{T}(I, i, j), u; dims = (1, 2)), i, 2, j, 2), [2, 1, 4, 3])
end

CX(i, j, T = Float64) = Gate(controlled(PauliX(T)), i, j)
CY(i, j, T = ComplexF64) = Gate(controlled(PauliY(T)), i, j)
CZ(i, j, T = Float64) = Gate(controlled(PauliZ(T)), i, j)
CP(phi::T, i, j, S = ComplexF64) where T <: Real = Gate(controlled(PhaseP(convert(S, phi))), i, j)

CCX(i, j, k, T = Float64) = Gate(reshape(controlled(reshape(controlled(PauliX(T)), 4, 4)), 2, 2, 2, 2, 2, 2), i, j, k) # fix later
CX(i, j, T = ComplexF64) = Gate(reshape(cat(Matrix{T}(I, 2, 2), PauliX(T); dims = (1, 2)), 2, 2, 2, 2), i, j)
CY(i, j, T = ComplexF64) = Gate(reshape(cat(Matrix{T}(I, 2, 2), PauliY(T); dims = (1, 2)), 2, 2, 2, 2), i, j)
CZ(i, j, T = ComplexF64) = Gate(reshape(cat(Matrix{T}(I, 2, 2), PauliZ(T); dims = (1, 2)), 2, 2, 2, 2), i, j)
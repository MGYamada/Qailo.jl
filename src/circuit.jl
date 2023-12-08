struct Gate{T, M, N}
    op::Array{T, M}
    ind::NTuple{N, Int}
    function Gate(op::Array{T, M}, ind...) where {T, M}
        N = length(ind)
        @assert M == 2N
        new{T, M, N}(op, ind)
    end
end

PauliX(T) = [zero(T) one(T); one(T) zero(T)]
PauliY(T::Type{<: Real}) = [zero(Complex{T}) -im * one(T); im * one(T) zero(Complex{T})]
PauliY(T::Type{<: Complex}) = [zero(T) -im * one(T); im * one(T) zero(T)]
PauliZ(T) = [one(T) zero(T); zero(T) -one(T)]

X(i, T = ComplexF64) = Gate(PauliX(T), i)
Y(i, T = ComplexF64) = Gate(PauliY(T), i)
Z(i, T = ComplexF64) = Gate(PauliZ(T), i)

CX(i, j, T = ComplexF64) = Gate(reshape(cat(Matrix{T}(I, 2, 2), PauliX(T); dims = (1, 2)), 2, 2, 2, 2), i, j) # fix later
CY(i, j, T = ComplexF64) = Gate(reshape(cat(Matrix{T}(I, 2, 2), PauliY(T); dims = (1, 2)), 2, 2, 2, 2), i, j)
CZ(i, j, T = ComplexF64) = Gate(reshape(cat(Matrix{T}(I, 2, 2), PauliZ(T); dims = (1, 2)), 2, 2, 2, 2), i, j)

const Circuit{D} = NTuple{D, Gate}
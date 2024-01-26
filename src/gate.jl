PauliX(T) = [zero(T) one(T); one(T) zero(T)]
PauliY(T::Type{<: Real}) = [zero(Complex{T}) -im * one(T); im * one(T) zero(Complex{T})]
PauliY(T::Type{<: Complex}) = [zero(T) -im * one(T); im * one(T) zero(T)]
PauliZ(T) = [one(T) zero(T); zero(T) -one(T)]

X(i, T = Float64) = Gate(PauliX(T), " X", i)
Y(i, T = ComplexF64) = Gate(PauliY(T), " Y", i)
Z(i, T = Float64) = Gate(PauliZ(T), " Z", i)

PhaseP(phi::T) where T <: Real = [one(Complex{T}) zero(Complex{T}); zero(Complex{T}) cis(phi)]
PhaseS(T::Type{<: Real}) = [one(Complex{T}) zero(Complex{T}); zero(Complex{T}) im * one(T)]
PhaseS(T::Type{<: Complex}) = [one(T) zero(T); zero(T) im * one(T)]

H(i, T = Float64) = Gate([one(T) one(T); one(T) -one(T)] ./ sqrt(2), " H", i)
S(i, T = ComplexF64) = Gate(PhaseS(T), " S", i)
T(i, S = Float64) = Gate(PhaseP(convert(S, π) / 4), " T", i)
P(phi::T, i, S = Float64) where T <: Real = Gate(PhaseP(convert(S, phi)), " P", i)

# Two-qubit gates

SWAP(i, j, T = Float64) = Gate(permutedims(reshape(Matrix{T}(I, 4, 4), 2, 2, 2, 2), [2, 1, 3, 4]), "SWAP", i, j)
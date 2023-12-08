PauliX(T) = [zero(T) one(T); one(T) zero(T)]
PauliY(T::Type{<: Real}) = [zero(Complex{T}) -im * one(T); im * one(T) zero(Complex{T})]
PauliY(T::Type{<: Complex}) = [zero(T) -im * one(T); im * one(T) zero(T)]
PauliZ(T) = [one(T) zero(T); zero(T) -one(T)]

X(i, T = ComplexF64) = Gate(PauliX(T), i)
Y(i, T = ComplexF64) = Gate(PauliY(T), i)
Z(i, T = ComplexF64) = Gate(PauliZ(T), i)

PhaseP(phi::T) where T <: Real = [one(Complex{T}) zero(Complex{T}); zero(Complex{T}) exp(im * phi)]
PhaseS(T::Type{<: Real}) = [one(Complex{T}) zero(Complex{T}); zero(Complex{T}) im * one(T)]
PhaseS(T::Type{<: Complex}) = [one(T) zero(T); zero(T) im * one(T)]

H(i, T = ComplexF64) = Gate([one(T) one(T); one(T) -one(T)] ./ sqrt(2), i)
S(i, T = ComplexF64) = Gate(PhaseS(T), i)
T(i, S = Float64) = Gate(PhaseP(convert(S, π) / 4), i)
P(i, phi::T) where T <: Real = Gate(PhaseP(phi), i)

CX(i, j, T = ComplexF64) = Gate(reshape(cat(Matrix{T}(I, 2, 2), PauliX(T); dims = (1, 2)), 2, 2, 2, 2), i, j) # fix later
CY(i, j, T = ComplexF64) = Gate(reshape(cat(Matrix{T}(I, 2, 2), PauliY(T); dims = (1, 2)), 2, 2, 2, 2), i, j)
CZ(i, j, T = ComplexF64) = Gate(reshape(cat(Matrix{T}(I, 2, 2), PauliZ(T); dims = (1, 2)), 2, 2, 2, 2), i, j)
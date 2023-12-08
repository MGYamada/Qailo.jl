# Qailo.jl

Supersimple quantum circuit simulator Qailo.jl,
inspired by [qailo in Python](https://github.com/wistaria/qailo).

## Circuit notation

```julia
circ"X(1) Y(2) CZ(1,2)"
```

A circuit is just represented by `Tuple` of `Gate`.
Note that `Circuit` will be read from left to right.

## Braket notation

```julia
psi = zero_state(Val(2));
braket"<psi|CX(1,2)|psi>"
```

It looks much better when you use Unicode.

```julia
ψ = zero_state(Val(2));
braket"<ψ|CX(1,2)|ψ>"
```

Note that brakets will be read from right to left.
module Qailo

using LinearAlgebra

export product_state, zero_state, one_state, @zero, @one, Gate, Circuit, apply, @circ_str, @braket_str, prob, prob2dict

include("statevector.jl")
include("circuit.jl")
include("apply.jl")
include("braket.jl")

include("gate.jl")
include("controlled.jl")
include("measurement.jl")

end
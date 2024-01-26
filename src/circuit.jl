struct Gate{T, M, N}
    op::Array{T, M}
    # mpo::MPO
    symbol::String
    ind::NTuple{N, Int}
    function Gate(op::Array{T, M}, s, ind...) where {T, M}
        N = length(ind)
        @assert M == 2N
        new{T, M, N}(op, s, ind)
    end
end

const Circuit{D} = NTuple{D, Gate}

# Base.adjoint(c::Circuit) = reverse(adjoint.(c))

# Base.adjoint(g::Gate{T, M, N}) where {T, M, N} = Gate(Array(reshape(adjoint(reshape(g.op, 1 << N, :)), ntuple(x -> 2, Val(M)))), g.ind...)
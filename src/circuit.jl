struct Gate{T, M, N}
    op::Array{T, M}
    ind::NTuple{N, Int}
    function Gate(op::Array{T, M}, ind...) where {T, M}
        N = length(ind)
        @assert M == 2N
        new{T, M, N}(op, ind)
    end
end

const Circuit{D} = NTuple{D, Gate}
Base.show(io::IO, ::MIME"text/plain", g::Gate) = print(io, "Gate", g.symbol, g.ind) # fix later

function Base.show(io::IO, ::MIME"text/plain", c::Circuit)
    N = maximum(maximum(g.ind) for g in c)
    if N >= 100
        print("Large circuit with ", N, " qubits")
    else
        for i in 1:N
            print(io, lpad(string(i), 2))
        end
        for g in c
            println(io)
            flag = 0
            for i in 1:N
                j = findfirst(isequal(i), g.ind)
                if j === nothing
                    if flag == 0 || flag == length(g.ind)
                        print(io, " |")
                    else
                        print(io, " +")
                    end
                else
                    print(io, g.symbol[(2j - 1):2j])
                    flag += 1
                end
            end
        end
    end
end
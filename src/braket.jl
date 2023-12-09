function enlarge(s::AbstractString)
    m = match(r"([^₁-₉]+)([₁-₉]+)", s)
    if m !== nothing
        s = m.captures[1] * "(" * join(string.(collect(m.captures[2]) .- '₀'), ",") * ")"
    end
    s
end

function circ(s::AbstractString, T = Float64)
    gates = map(x -> Expr(:call, Meta.parse(enlarge(x)).args..., T), split(s))
    :($(gates...),)
end

macro circ_str(s::AbstractString)
    circ(s)
end

const prec_table = Dict{String, Type}("h" => Float16, "s" => Float32, "d" => Float64)

macro circ_str(s::AbstractString, f::AbstractString)
    circ(s, prec_table[f])
end

function braket(s::AbstractString, f = "d")
    m = match(r"<(.+)\|(.+)\|(.+)>", s)
    m === nothing && throw(ArgumentError("invalid braket specification $s"))
    a = Meta.parse(m.captures[1])
    b = circ(m.captures[2], prec_table[f])
    c = Meta.parse(m.captures[3])
    :(dot($(esc(a)), apply($(esc(c)), reverse($b))))
end

macro braket_str(s::AbstractString)
    braket(s)
end

macro braket_str(s::AbstractString, f::AbstractString)
    braket(s, f)
end
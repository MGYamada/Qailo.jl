function circ(s::AbstractString)
    gates = Meta.parse.(split(s))
    :($(gates...),)
end

macro circ_str(s::AbstractString)
    circ(s)
end

function braket(s::AbstractString)
    m = match(r"<(.+)\|(.+)\|(.+)>", s)
    m === nothing && throw(ArgumentError("invalid braket specification $s"))
    a = Meta.parse(m.captures[1])
    b = circ(m.captures[2])
    c = Meta.parse(m.captures[3])
    :(dot($(esc(a)), apply($(esc(c)), reverse($b))))
end

macro braket_str(s::AbstractString)
    braket(s)
end
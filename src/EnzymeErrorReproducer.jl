module EnzymeErrorReproducer

using Enzyme

function mygradient(f, x)
    g = zero(x)
    autodiff(Reverse, f, Active, Duplicated(x, g))
    return g
end

myhvp(f, x, dx) = return autodiff(Forward, mygradient, Const(f), Duplicated(x, dx))[1]

@inline function arraycube_bad(x::AbstractArray{N}) where {N}
    y = similar(x)
    for i in 1:4
        for j in 1:3
            y[i, j] = x[i, j]^3
        end
    end
    return y
end

@inline function arraycube_good(x)
    y = similar(x)
    for k in 1:12
        y[k] = x[k]^3
    end
    return y
end

f_bad(x) = sum(arraycube_bad(x))
f_good(x) = sum(arraycube_good(x))

export f_bad, f_good
export myhvp

end # module EnzymeErrorReproducer

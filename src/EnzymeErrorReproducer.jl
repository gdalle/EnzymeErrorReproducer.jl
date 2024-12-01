module EnzymeErrorReproducer

using Enzyme

function mygradient(f, x)
    g = zero(x)
    autodiff(Reverse, f, Active, Duplicated(x, g))
    return g
end

myhvp(f, x, dx) = return autodiff(Forward, mygradient, Const(f), Duplicated(x, dx))[1]

@inline function arraycube_cartesian(x::AbstractArray{N}) where {N}
    y = similar(x)
    @inbounds for i in 1:2
        @inbounds for j in 1:3
            y[i, j] = x[i, j]^3
        end
    end
    return y
end

@inline function arraycube_linear(x)
    y = similar(x)
    @inbounds for k in 1:6
        y[k] = x[k]^3
    end
    return y
end

f_cartesian(x) = sum(arraycube_cartesian(x))
f_linear(x) = sum(arraycube_linear(x))

inputs() = Matrix{Float64}(reshape(1:6, 2, 3)), ones(2, 3)
outputs() = 441.0, Matrix{Float64}(6 .* reshape(1:6, 2, 3))

export f_cartesian, f_linear
export myhvp
export inputs, outputs

end # module EnzymeErrorReproducer

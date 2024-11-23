using EnzymeErrorReproducer
using Test

@testset "Enzyme HVP error" begin
    xm, dxm = Matrix{Float64}(reshape(1:12, 4, 3)), ones(4, 3)  # matrix input
    @test f_bad(xm) == f_good(xm)
    @test myhvp(f_bad, xm, dxm) == myhvp(f_good, xm, dxm)
end

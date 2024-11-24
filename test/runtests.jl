using EnzymeErrorReproducer
using Test

@testset "EnzymeErrorReproducer" begin
    xm, dxm = inputs()
    @test f_bad(xm) == f_good(xm)
    @test myhvp(f_bad, xm, dxm) == myhvp(f_good, xm, dxm)
end

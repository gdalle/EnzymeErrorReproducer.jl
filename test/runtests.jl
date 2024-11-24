using Enzyme
Enzyme.API.printall!(true)
Enzyme.Compiler.DumpPreEnzyme[] = true
Enzyme.Compiler.DumpPostWrap[] = true
Enzyme.Compiler.DumpPostOpt[] = true

using EnzymeErrorReproducer
using Test

@testset "EnzymeErrorReproducer" begin
    xm, dxm = inputs()
    @test f_bad(xm) == f_good(xm)
    @test myhvp(f_bad, xm, dxm) == myhvp(f_good, xm, dxm)
end

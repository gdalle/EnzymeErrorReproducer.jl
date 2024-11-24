using Enzyme
Enzyme.API.printall!(false)
Enzyme.Compiler.DumpPreEnzyme[] = true
Enzyme.Compiler.DumpPostWrap[] = true
Enzyme.Compiler.DumpPostOpt[] = true

using EnzymeErrorReproducer
using Test

@testset verbose = true "EnzymeErrorReproducer" begin
    x, dx = inputs()
    y, h = outputs()
    @testset "f_bad" begin
        @test f_bad(x) == y
        @test myhvp(f_bad, x, dx) == h
    end
    @testset "f_good" begin
        @test f_good(x) == y
        @test myhvp(f_good, x, dx) == h
    end
end

using Enzyme

Enzyme.API.printall!(false)
Enzyme.Compiler.DumpPreEnzyme[] = true
Enzyme.Compiler.DumpPostWrap[] = false
Enzyme.Compiler.DumpPostOpt[] = false

using EnzymeErrorReproducer
using Test

FUNCTION = get(ENV, "JULIA_HVP_FUNCTION", "cartesian")

@testset verbose = true "EnzymeErrorReproducer" begin
    x, dx = inputs()
    y, h = outputs()
    if FUNCTION == "cartesian"
        @testset "f_cartesian" begin
            @test f_cartesian(x) == y
            @test myhvp(f_cartesian, x, dx) == h
        end
    elseif FUNCTION == "good"
        @testset "f_linear" begin
            @test f_linear(x) == y
            @test myhvp(f_linear, x, dx) == h
        end
    else
        error("Unknown function $FUNCTION")
    end
end

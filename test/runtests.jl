using Enzyme
Enzyme.API.printall!(false)
Enzyme.Compiler.DumpPreEnzyme[] = true
Enzyme.Compiler.DumpPostWrap[] = true
Enzyme.Compiler.DumpPostOpt[] = true

using EnzymeErrorReproducer
using Test

FUNCTION = get(ENV, "JULIA_HVP_FUNCTION", "bad")

@testset verbose = true "EnzymeErrorReproducer" begin
    x, dx = inputs()
    y, h = outputs()
    if FUNCTION == "bad"
        @testset "f_bad" begin
            @test f_bad(x) == y
            @test myhvp(f_bad, x, dx) == h
        end
    elseif FUNCTION == "good"
        @testset "f_good" begin
            @test f_good(x) == y
            @test myhvp(f_good, x, dx) == h
        end
    else
        error("Unknown function $FUNCTION")
    end
end

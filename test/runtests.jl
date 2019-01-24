using Test, NaturallyUnitful

@testset "tests" begin 
    @test natural(1u"m") == 5.067730759202785e6u"eV^-1"

    unnnatural(u"m", ans) == 1.0u"m"
end

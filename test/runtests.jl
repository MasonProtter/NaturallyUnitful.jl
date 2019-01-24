using Test, NaturallyUnitful

@testset "tests" begin 
    @test natural(1u"m") == 5.067730759202785e6u"eV^-1"

    @test unnatural(u"m", 5.067730759202785e6u"eV^-1") == 1.0u"m"

    @test natural(1e8u"m/s") == 0.33356409519815206

    @test unnatural(u"m/s", 0.33356409519815206) == 1e8u"m/s"
end

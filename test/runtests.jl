using Test, NaturallyUnitful

@testset "tests" begin 
    @test natural(1u"m") == 5.067730759202785e6u"eV^-1"

    @test unnatural(u"m", 5.067730759202785e6u"eV^-1") == 1.0u"m"

    @test natural(1e8u"m/s") == 0.33356409519815206

    @test unnatural(u"m/s", 0.33356409519815206) == 1e8u"m/s"

    @test natural(1u"kg", base=u"GeV") ==  5.609588650020685e26u"GeV"
    
    @test natural(1u"m", base=u"GeV") ==  5.067730759202785e15u"GeV^-1"

    @test unnatural(u"K", 1u"eV") == 11604.522060401006u"K" 
end

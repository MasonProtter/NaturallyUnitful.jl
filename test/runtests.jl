using Test, NaturallyUnitful
using NaturallyUnitful: c, ħ, ħc, kB, ϵ0

@testset "tests" begin 
    @test natural(1u"m") ≈ uconvert(u"eV^-1", 1u"m"/(ħc))

    @test unnatural(u"m", uconvert(u"eV^-1", 1u"m"/(ħc))) ≈ 1.0u"m"

    @test natural(1e8u"m/s") ≈ convert(Float64, 1e8u"m/s"/c)

    @test unnatural(u"m/s", convert(Float64, 1e8u"m/s"/c)) ≈ 1e8u"m/s"

    @test natural(1u"kg") ≈ uconvert(u"GeV", 1u"kg"*c^2)
    
    @test natural(1u"m", base=u"GeV") ≈ uconvert(u"GeV^-1", 1u"m"/(ħc)) 

    @test unnatural(u"K", 1u"eV") ≈ uconvert(u"K", 1u"eV"/kB)
end

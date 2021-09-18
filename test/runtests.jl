using Test, NaturallyUnitful
using NaturallyUnitful: c0, ħc0, k

@testset "Tests" begin
    @test natural(1u"m") ≈ uconvert(u"eV^-1", 1u"m" / ħc0)

    @test unnatural(u"m", uconvert(u"eV^-1", 1u"m" / ħc0)) ≈ 1.0u"m"

    @test natural(1e8u"m/s") ≈ convert(Float64, 1e8u"m/s" / c0)

    @test unnatural(u"m/s", convert(Float64, 1e8u"m/s" / c0)) ≈ 1e8u"m/s"

    @test natural(1u"kg") ≈ uconvert(u"GeV", 1u"kg" * c0^2)

    @test natural(1u"m"; base=u"GeV") ≈ uconvert(u"GeV^-1", 1u"m" / ħc0)

    @test unnatural(u"K", 1u"eV") ≈ uconvert(u"K", 1u"eV" / k)

    @test unnatural(u"(m/s)^(3/2)", 1) ≈ c0^(3 / 2)
end

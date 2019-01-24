module NaturallyUnitful

using Reexport
@reexport using Unitful

c  = 1u"c"
ħ  = 1.0545718e-34u"kg*m^2/s"
ħc = ħ*c
kB = 1.38064852e-23u"kg*m^2/s^2/K"
ϵ0 = 8.85418782e-12u"m^-3*kg^-1*s^4*A^2"

setDimPow(D::Dict, x::Unitful.Dimension{T}) where {T} = D[T] = x.power

function dimDict(x::Unitful.Dimensions{T}) where {T}
    D = Dict(:Length => 0,
             :Mass => 0,
             :Temperature => 0,
             :Time => 0,
             :Current => 0)
    for t in T
        setDimPow(D,t)
    end
    return D
end

dimDict(x::Unitful.Quantity{T}) where {T} = dimDict(dimension(x))

dimDict(x) = Dict(:Length => 0, :Mass => 0, :Temperature => 0, :Time => 0, :Current => 0)

function natural(q)
    D = dimDict(q)
    (α,β,γ,δ,ϕ) = (D[:Length], D[:Mass], D[:Temperature], D[:Time], D[:Current])
    uconvert(u"eV"^(-α-δ+β+γ+ϕ),
             q*ħc^(-α+ϕ/2)*ħ^(-δ)*c^(2(β-ϕ/2))*kB^(γ)*(4π*ϵ0)^(-ϕ/2))
end

function unnnatural(targetUnit, q)
    natTarget = natural(1targetUnit)
    natQ = natural(q)
    ratio = natQ/natTarget
    if typeof(ratio |> dimension) == Unitful.Dimensions{()}
        (ratio)targetUnit
    else
        throw(Unitful.DimensionError)
    end
end

export natural, unnnatural

end # module

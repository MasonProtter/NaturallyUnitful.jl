[![Build Status](https://travis-ci.com/MasonProtter/NaturallyUnitful.jl.svg?branch=master)](https://travis-ci.com/MasonProtter/NaturallyUnitful.jl)

# NaturallyUnitful.jl

This package reexports [Unitful.jl](https://github.com/ajkeller34/Unitful.jl) alongside two extra functions
 * `natrual`, a function for converting a given quantity to the Physicst's so called "natural units" in which 
 
 `ħ = c = ϵ₀ = 1`
```julia
julia> using NaturallyUnitful

julia> natural(1u"m")
5.067730759202785e6 eV^-1

julia> natural(1e8u"m/s")
0.33356409519815206
```
 * `unnatural`, a function for converting from natural units to a given `unnatural` unit such as meters
 ```julia
 julia> unnatural(u"m", 5.067730759202785e6u"eV^-1")
1.0 m

julia> unnatural(u"m/s", 0.33356409519815206)
1.0e8 m s^-1
 ```

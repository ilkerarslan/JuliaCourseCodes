struct Rectangle
    width::Float64
    heigt::Float64
end

struct ParRectangle{T}
    width::T
    height::T
end

r1 = ParRectangle{Int}(3, 8)
r2 = ParRectangle{Float32}(2.78, 3.14)
r3 = ParRectangle{String}("three", "five")

typeof(r1)
typeof(r2)
typeof(r3)

ParRectangle{Float64} <: ParRectangle

r4 = ParRectangle(3, 4)
r5 = ParRectangle(2.0, 3.0)
r6 = ParRectangle(2, 3.0)

struct NumRectangle{T<:Real}
    width::T
    height::T
end

r4 = NumRectangle{String}("three", "five")

abstract type Color{T} end

Color{Float64} <: Color
Color{String} <: Color

Color{Int64} <: Color{<:Integer}

abstract type NewColor{T<:Real} end

struct Rational{T<:Integer} <: Real
    num::T
    den::T
end

r = Rational(4, 5)
typeof(r)

struct NewShape{T<:AbstractString, P<:Number}
    name::T
    color::T
    x_coord::P
    y_coord::P
end

rect = NewShape("Rectangle", "Red", 5.5, 7.5)

circle = NewShape("Circle", "Black", 3, 4.5)
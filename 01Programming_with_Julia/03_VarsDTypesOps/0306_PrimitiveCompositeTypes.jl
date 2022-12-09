struct Rectangle
    width::Float64
    length::Float64
end

fieldnames(Rectangle)

rectangle1 = Rectangle(4, 7)

rectangle1.length
rectangle1.width

rectangle1 = Rectangle(5.0)
restangle1 = Rectangle(1.0, 2.0, 3.0)

rectangle1.length = 2;

mutable struct NewRectangle
    width::Float64
    height::Float64
end

rectangle2 = NewRectangle(4.5, 7.8)
rectangle2.width = 3.5

supertype(Rectangle)

abstract type Shape end

mutable struct RectangleShape <: Shape
    width::Float64
    height::Float64
end

mutable struct Square <: Shape
    length::Float64
end


mutable struct Circle <: Shape
    radius::Float64
end

intstr = Union{Integer, AbstractString}
x = 123
y = "123"
z = 123.0
x::intstr
y::intstr
z::intstr
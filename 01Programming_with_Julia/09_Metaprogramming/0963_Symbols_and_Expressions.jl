num = 7 + 8;

s = :num
typeof(s)
supertype(Symbol)

s
eval(s)

Symbol("num")
Symbol("num", 2)
Symbol("new", "num")

:(a + b)
ex = :(a + b)

typeof(ex)
supertype(Expr)

eval(ex)

a = 7; b = 6.4;
eval(ex)

Meta.parse("a + b")

:(
    begin
        c = a + b
        d = c^2 
        e = π*d
    end
)

quote
    c = a + b
    d = c^2 
    e = π*d
end

dump(ex)
propertynames(ex)
ex.head
ex.args

Expr(:call, :+, :a, :b)

ex2 = :(3x - 7y + z*t)
dump(ex2)
ex2.args
ex2.args[1]
ex2.args[2]
ex2.args[3]
ex2.args[2].args

using GraphRecipes, Plots 

plot(ex2, fontsize=16)

exp = :(
    function power(a,b)
        return a^b
    end
)
exp.head

exp2 = :(
    for i in 1:5
        println(i)
    end
)
exp2.head

exp3 = :(
    if a < b
        println(a)
    else
        println(b)
    end
)
exp3.head

:([x, y, z, t]) |> dump

mutable struct Point
    a 
    b 
end

Expr(:struct, true, :Point, Expr(:block, :a, :b))

mutable struct Point1 
    a::Float64 
    b::Float64
end

Expr(:struct, true, :Point1,
     Expr(:block,
          Expr(:(::), :a, :Float64),
          Expr(:(::), :b, :Float64)))

:(mutable struct Point
    a::Float64 
    b::Float64
end) |> dump 

:(x - 3y)

x = 5
:($x - 5y)

:(:x) |> dump

:(a = :x) |> dump 

ref = QuoteNode(:variable)
:(var = $ref)

ref2 = :variable2
:(var2 = $ref2)

:(ref = :var) |> dump

var = 7
:(ref = :($var))

:(ref = :($($var)))
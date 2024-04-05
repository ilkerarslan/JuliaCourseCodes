using Observables
a = Observable("Python")

a[]

on(a) do language 
    println("Now I am coding with $language")
end

a[] = "Java";
a[] = "Julia";

using Makie
a = Observable(10);
f(x) = x^2 + x
b = lift(f, a)

a[] = 4; b

c = @lift(
    f($a)
)

a[] = 7; c
a[] = 9; c[]
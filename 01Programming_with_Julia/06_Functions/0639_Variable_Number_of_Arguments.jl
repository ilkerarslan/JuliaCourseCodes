varfunc(x...) = (x)
varfunc(3)
varfunc(3,4,5)

function printall(x...)
    println(x)
end

printall("Julia")
printall("Julia", "Python")
printall("Julia", "Python", "C++", "R", "Java")

addall(x, y...) = x + addall(y...)
addall(x) = x
addall(7)
addall(5, 7, 12)
addall(7, 12, 14, 32, 35)

findmin(x, y) = x < y ? x : y
findmin(x,y...) = findmin(x, findmin(y...))
findmin(4, 1, -4, 17, 7)

a, b, c... = [3, 5, 9, 3, 11, 35]; 
a
b
c


function printtype(args...)
    for (i, arg) ∈ enumerate(args)
        println("$i: Type of $arg is $(typeof(arg))")
    end
end

printtype(1, 3.14, "math", true)

(1:10...,)
(0:10:50...,)

function printargs(a, b, c)
    println(a)
    println(b)
    println(c)
end

tpl = ["mathematics", "physics", "chemistry"]
printargs(tpl)

printargs(tpl...)
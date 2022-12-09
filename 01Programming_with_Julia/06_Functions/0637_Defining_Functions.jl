numbers = rand(-1000:1000, 200)

maxnum = typemin(Int64)
for num in numbers
    if num > maxnum
        maxnum = num 
    end
end
println(maxnum)

newnumbers = rand(0:1000_000, 1000)
maxnum = typemin(Int64)
for num in newnumbers
    if num > maxnum
        maxnum = num 
    end
end
println(maxnum)

function mymax(array)
    maxnum = typemin(Int64)
    for num in array 
        if num > maxnum 
            maxnum = num 
        end
    end
    return maxnum 
end

mymax(numbers)
mymax(newnumbers)

max1 = mymax(numbers)
max2 = mymax(newnumbers)

function greet()
    println("Welcome to Julia Programming Course!")
    println("I hope you enjoy it...")
end
greet()

function greet()
    println("Welcome to Julia Programming Course!")
    println("I hope you enjoy it...")
    return nothing
end

function power(x, y)
    x^y 
end

power(3,4)

p(x,y) = x^y
p(3,4)

ϕ(x,y) = x^y
ϕ(3,4)

ϕ

phi = ϕ
phi(3,4)

function fact(n::Integer) 
    f = 1
    for i ∈ 1:n 
        f *= i
    end
    return f 
end

fact(5)
fact(2)

function fact(n::Integer)::Integer
    f = 1
    for i ∈ 1:n 
        f *= i
    end
    return f 
end

function absDiff(a,b)
    if a > b 
        return a - b 
    else
        return b - a
    end
end

absDiff(-2,5)

*(3,4,5)

m = *;
m(3,4,5)

function findmeansd(array)
    total = 0
    n = 0

    for el in array 
        total += el 
        n += 1 
    end
    μ = total / n 

    σ = 0
    for el in array
        σ += (el - μ)^2
    end
    σ = √(σ/(n-1)) 

    return μ, σ
end

array = [4, 5, 6, 8, 12, 34, 65, 98, 76, 36, 35, 100]

findmeansd(array)
avg, sd = findmeansd(array)
avg
sd

res = findmeansd(array)
res[1]
res[2]

using Statistics
mean(array)
std(array)

x -> 3x^2 + 5x - 4
ans(4)

g = x -> 3x^2 + 5x - 4
g(5)

(x, y, z) -> (x^3 - y^3) / y^3

fact(n) = n == 1 ? n : n * fact(n-1)

fact(3)
fact(5)

fibo(n) = n < 2 ? n : fibo(n-1) + fibo(n-2)
fibo(10)


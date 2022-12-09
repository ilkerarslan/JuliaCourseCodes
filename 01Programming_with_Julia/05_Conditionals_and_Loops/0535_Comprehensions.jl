arr = [5, 8, 12, 17, 24, 42];

[x^2 for x in arr]

[(x^2, y^3) for x ∈ 1:4, y ∈ 1:3]
[x^2 for x in arr if iseven(x)]


[iseven(x) ? x^2 : x^3 for x in arr]


[(i,j) for i=1:4 for j=1:i]


(x^2 for x ∈ 1:1000)

sum(x^2 for x ∈ 1:1000)

s = 0
@time for i = 1:1_000_000_000 s += i^2 end

@time sum([i^2 for i = 1:1_000_000_000])

@time sum(i^2 for i ∈ 1:1_000_000_000)



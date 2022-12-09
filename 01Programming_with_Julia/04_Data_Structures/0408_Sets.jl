vec = [3, 5, 7, 7, 7, 8, 8, 8, 12, 15]
Set(vec)

tup = (3, 5, 7, 7, 7, 8, 8, 8, 12, 15)
Set(tup)

x1 = [1 2 2 3 3 4 4 4 5 6 7 7 7]
x2 = [3 5 6 6 6 7 8 8 9 9 9]

union(x1, x2)
intersect(x1, x2)
setdiff(x1, x2)
setdiff(x2, x1)
symdiff(Set(x1), Set(x2))

issubset([1, 2, 3], [1, 2, 3, 3, 5, 7])

[1, 2, 3] ⊆ [1, 2, 3, 3, 5, 7]
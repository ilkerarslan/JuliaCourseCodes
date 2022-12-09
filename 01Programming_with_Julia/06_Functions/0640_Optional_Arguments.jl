pow(a,b=2) = a^b

pow(3,4)
pow(14)

findmin(x, y) = x < y ? x : y
findmin(x,y...) = findmin(x, findmin(y...))
findmin(10)

findmin(x, y=x) = x < y ? x : y
findmin(x,y...) = findmin(x, findmin(y...))
findmin(10)




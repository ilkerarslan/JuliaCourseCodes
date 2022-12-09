arr = [5, 8, 12, 17, 24, 42];
sqarr = Int64[]

for el in arr   
    append!(sqarr, el^2)
end
println(sqarr)

sqarr = map(x -> x^2, arr)
sqarr

broadcast(x -> x^2, arr)

rowvec = [1 2 3 4 5]
colvec = [10, 20, 30, 40, 50]

map(+, rowvec, colvec)

rowvec .+ colvec

reduce(+, arr)

filter( x -> x %4 == 0, arr)

sqarr = map(x -> x^2, arr)
sumsqr = reduce(+, sqarr)
mapreduce(x -> x^2, +, arr)

struct Course
    subject::Symbol 
    field::Symbol
    ncourses::Int 
    nstudents::Int
end

coursedata = [Course(:Julia, :Programming, 10, 250), Course(:Python, :Programming, 50, 750), 
              Course(:Mathematics, :Science, 30, 100), Course(:Physics, :Science, 45, 300),
              Course(:R, :Programming, 35, 300)]

nprogramming = filter(x -> x.field === :Programming, coursedata)
nstudents = map(x -> x.ncourses * x.nstudents, nprogramming)
totalstudents = reduce(+, nstudents)

function nfield(data, field)
   f = filter(x -> x.field === Symbol(field), data)
   s = mapreduce(x -> x.ncourses * x.nstudents, +, f)
   return s 
end

nfield(coursedata, "Programming")
nfield(coursedata, "Science")

function f(x)
    if (x % 2 == 0) && (x % 3 != 0)
        return "Div2"
    elseif (x % 3 == 0) && (x %2 != 0)
        return "Div3"
    elseif (x % 6 == 0)
        return "Div6"
    else
        return "DivNone"
    end        
end

map(f, arr)

map(x -> begin
            if (x % 2 == 0) && (x % 3 != 0)
                return "Div2"
            elseif (x % 3 == 0) && (x %2 != 0)
                return "Div3"
            elseif (x % 6 == 0)
                return "Div6"
            else
                return "DivNone"
            end
        end,    
    arr)

map(arr) do x
    if (x % 2 == 0) && (x % 3 != 0)
        return "Div2"
    elseif (x % 3 == 0) && (x %2 != 0)
        return "Div3"
    elseif (x % 6 == 0)
        return "Div6"
    else
        return "DivNone"
    end
end


data = "Programming with Julia.\nHigher order functions.\nMap, reduce and filter."

open("input.txt", "w") do io 
    write(io, data)
end


d1 = Dict()

grades = Dict([("albert", 100), ("marie", 99), ("richard", 98), ("carl", 97)])

grades = Dict("albert" => 100, "marie" => 99, "richard" => 98, "carl" => 97)

grades = Dict()

grades["albert"] = 100
grades["marie"] = 99
grades["richard"] = 98
grades["carl"] = 97
grades

grades["carl"] = 100
grades

grades[1]

grades["marie"]
grades["rosalind"]
length(grades)
keys(grades)
values(grades)

"albert" ∈ keys(grades)
100 ∈ values(grades)
"isaac" ∈ keys(grades)

haskey(grades, "isaac", "newton")

get(grades, "albert", "not found")
get(grades, "bertrand", "not found")

get!(grades, "bertrand", 85)
grades

getkey(grades, "albert", "einstein")
getkey(grades, "isaac", "newton")


delete!(grades, "carl")

dict1 = Dict("a" => 5, "b" => 7, "c" => 9)
dict2 = Dict("d" => 6, "e" => 8, "f" => 10)

merge(dict1, dict2)

dict1 = Dict("a" => 5, "b" => 7, "c" => 9)
dict2 = Dict("a" => 7, "b" => 10, "d" => 15)
mergewith(+, dict1, dict2)

dct = Dict(1 => "one", "two" => 2, 3.5 => true)
keys(dct)
values(dct)
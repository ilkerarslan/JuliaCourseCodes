using DataFrames

# DataFrame()

df = DataFrame( x = [3, 4, 5, 6],
                y = [3.2, 4.5, 6.7, 8.5],
                z1 = ["AAA", "BBB", "CCC", "DDD"],
                z2 = true)

df.x
df."y"
df[!, :z1]
df[!, "z2"]

df[!, 2]

df.x .= 10
df[!, :z2] .= false

df

df[:, :y]

col1 = df[!, :z1];
col2 = df[:, :z1];

col1 == col2

col1 === col2 

col1[1] = "WWW";
col2[3] = "ZZZ";

df

names(df)
names(df, r"z")

names(df, Float64)
names(df, Not(:z2))
names(df, Not(r"z"))

propertynames(df)


df = DataFrame()
df.x = [3, 4, 5 ,6 ,7]
df[!, :y] = [3.1, 2.5, 5.3, 7.8, 8.2]
df[:, "z"] .= true

df

size(df)
size(df, 1)
size(df, 2)

df = DataFrame(x=Int64[], y=Float64[], z=String[])
push!(df, [1, 2.78, "e"])
push!(df, (2, 3.14, "pi"))
push!(df, Dict(:x => 3, :y => 1.62, :z => "golden"))

pushfirst!(df, [0, 0.0, "zero"])    
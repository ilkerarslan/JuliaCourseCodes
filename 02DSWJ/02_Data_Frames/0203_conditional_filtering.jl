using DataFrames, RDatasets
iris = dataset("datasets", "iris");

iris.SepalLength

iris.SepalLength .> 7

iris[iris.SepalLength .> 7, :]

index = iris.SepalLength .> 7
iris[index, :]

iris[1 .< iris.PetalWidth .< 2, :]

iris[(iris.SepalLength .> 7)  .& (1 .< iris.PetalWidth .< 2), :]

in.(iris.PetalWidth, Ref([0.4, 2.0, 2.5]))

condition = in.(iris.PetalWidth, Ref([0.4, 2.0, 2.5]));
iris[condition, :]

condition2 = in([0.4, 2.0, 2.5]).(iris.PetalWidth)
iris[condition2, :]

iris[condition, :] == iris[condition2, :]

subset(iris, :PetalWidth => x -> 1.4 .< x .< 1.8)

df = DataFrame(A=[1, 2, missing, 5, 6, missing, missing, 10, 11],
               B=collect(21:29))

subset(df, :A => x -> iseven.(x))
subset(df, :A => x -> iseven.(x), skipmissing=true)

subset(df, :A => x -> coalesce.(iseven.(x), false))

coalesce(iseven(8), false)
coalesce(iseven(7), false)

coalesce(iseven(missing), false)


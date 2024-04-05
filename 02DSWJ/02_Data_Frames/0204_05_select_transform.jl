using DataFrames, RDatasets
iris = dataset("datasets", "iris");

select(iris, r"Width")
select(iris, Not(:Species))

select(iris, :SepalLength => :sl,
             :SepalWidth => :sw,
             :PetalLength => :pl,
             :PetalWidth => :pw,
             :Species => :sp)

iris 

mean(x) = sum(x) / length(x)

absdiff(x) = (x .- mean(x)) .|> abs 

select(iris, :SepalLength => (x -> absdiff(x)))
select(iris, :SepalLength => (x -> absdiff(x)) => :sl_diff)

select(iris, :SepalLength => ByRow(x -> x^2) => :sl_sq)
select(iris, :SepalLength => ByRow(sqrt))

select(iris, 
       [:SepalLength, :PetalLength] => 
       ((x1, x2) -> (x1 .+ x2) ./ 2) =>
       :meanLength)

select(iris, 
       [:SepalLength, :PetalLength] =>
       ByRow((x1, x2) -> (x1+x2)/2) =>
       :meanLength)

values(x) = minimum(x), mean(x), maximum(x)

select(iris,
       AsTable(Not(:Species)) =>
       ByRow(values) =>
       [:min, :mean, :max])

select(iris, AsTable(Not(:Species)) => ByRow(values))

select(iris, :PetalWidth)
iris[!, :PetalWidth]

df = select(iris, :PetalLength);
df.PetalLength === iris.PetalLength

df = select(iris, :PetalLength, copycols=false);
df.PetalLength === iris.PetalLength

df = deepcopy(iris);

select!(df, r"Sepal")
df 
df = iris[:, Not(:Species)]
select(df, All() => (+) => :rowsums)
transform(df, All() => (+) => :rowsums)

using Statistics

transform(df, AsTable(:) => ByRow(mean) => :rowmean)
transform(df, AsTable(:) .=>
              ByRow.([minimum, mean, maximum]) .=>
              [:min, :mean, :max])

df = DataFrame(x = [ 1, 2, missing, 3, 4, missing],
               y = [missing, 6, missing, 7, 8, 9],
               z = [10, missing, 11, missing, 12, missing])

transform(df,
          AsTable(:) =>
          ByRow(x -> count(!ismissing, x)) =>
          :n)

transform(df,
          AsTable(:) .=>
          ByRow.([x -> count(!ismissing, x),
                  minimum, mean, maximum]) .=>
                  [:n, :min, :mean, :max])

vec = [1, missing, 2, missing, 3]
sum(vec)
maximum(vec)

skipmissing(vec)
sum(skipmissing(vec))
maximum(skipmissing(vec))

vec |> skipmissing |> sum
(sum ∘ skipmissing)(vec)  # \circ TAB 

transform(df, AsTable(:) .=>
              ByRow.(sum ∘ skipmissing) .=>
              [:sum])

transform(df,
          AsTable(:) .=> 
          ByRow.([sum∘skipmissing,
                  minimum∘skipmissing,
                  Statistics.mean ∘ skipmissing,
                  maximum∘skipmissing]) .=>
          [:sum, :min, :mean, :max])

describe(df)

iris[!, [:SepalLength, :PetalLength]] |> describe

combine(iris, names(iris, Not(:Species)) .=> mean)
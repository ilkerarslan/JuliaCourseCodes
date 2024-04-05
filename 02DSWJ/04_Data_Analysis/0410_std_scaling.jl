using CSV, DataFrames, Plots, StatsPlots, Statistics
cd("02DSWJ/Data/04DataAnalysis")
data = CSV.read("data_0409.csv", DataFrame)

histogram(data.totalLoanLimit, bins=:scott, legend=false)
describe(data.totalLoanLimit)

log(0)

logvals = log.(data.totalLoanLimit .+ 1)
histogram(logvals, bins=:scott, legend=false)
describe(logvals)

μ = mean(logvals)
σ = std(logvals)

zvals = (logvals .- μ) ./ σ
describe(zvals)
histogram(zvals, bins=:scott, legend=false)

zvals = zvals .|> x -> abs(x) > 3 ? sign(x)*3 : x 
histogram(zvals, bins=:scott, legend=false)

minmaxscaler(x) = (x .- minimum(x)) ./ (maximum(x) - minimum(x))

scaled = minmaxscaler(data.avgCheckAmount)
describe(scaled)

function standardize(x)
    μ = (mean ∘ skipmissing)(x)
    σ = (std ∘ skipmissing)(x)
    (x .- μ) ./ σ
end

vars = names(data, Not(1:3, :default))

for var in vars 
    data[!, var] = standardize(data[!, var])
end

describe(data[:, 4:77], :min, :max, :mean, :std) |>
    df -> show(df, allrows=true)

CSV.write("data_0410.csv", data)
using CSV, DataFrames, Plots, Statistics
cd("02DSWJ/Data/05DataVisualization")
data = CSV.read("worldbankdata.csv", DataFrame)

histogram(data[data.year .== 2020, :military_exp],
          legend=false,
          xlabel="Military Expenditures")

data |> 
    df -> subset(df, :year => x -> x .== 2020) |>
    df -> df[:, :military_exp] |>
    x -> histogram(x, legend=false, 
                   xlabel="Military Expenditures")

histogram(data[data.year .== 2020, :military_exp],
          normalize=:probability,
          legend=false,
          xlabel="Military Expenditures")

vec = randn(100) .* 10;
histogram(vec)
histogram(vec, bins=-40:10:40)
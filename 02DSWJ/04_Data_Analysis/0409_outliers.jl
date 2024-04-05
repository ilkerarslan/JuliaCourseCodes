using CSV, DataFrames
cd("02DSWJ/Data/04DataAnalysis")
data = CSV.read("data_0408.csv", DataFrame)

data[:, [:undueCheckCount]] |> describe

using Plots, StatsPlots, Statistics
histogram(data.undueCheckCount, bins=:scott, legend=false)
boxplot(data.undueCheckCount, legend=false, xaxis=[])

q1, q3 = quantile(data.undueCheckCount, [0.25, 0.75])
iqr = q3 - q1
max_thresh = q3 + 1.5iqr

data.undueCheckCount = data.undueCheckCount .|>
                        v -> (v > max_thresh ? max_thresh : v)

describe(data.undueCheckCount)                        
histogram(data.undueCheckCount, bins=:scott, legend=false)
boxplot(data.undueCheckCount, legend=false, xaxis=[])

CSV.write("data_0409.csv", data)
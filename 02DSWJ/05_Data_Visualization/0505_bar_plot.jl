using CSV, DataFrames, Plots, Statistics
cd("02DSWJ/Data/05DataVisualization")
data = CSV.read("worldbankdata.csv", DataFrame)

countries = ["IND", "USA", "TUR", "DEU", "BRA"];

data |>
    df -> subset(df, :year => x -> 2000 .≤ x .≤ 2022,
                     :ccode => c -> c .∈ Ref(countries)) |>
    df -> combine(groupby(df, :ccode),
                  :pop_growth => mean => :avg_pop_growth) |>
    df -> sort(df, :avg_pop_growth, rev=true) |>
    df -> bar(df.ccode, df.avg_pop_growth,
              legend=false,
              xlabel="Country",
              title="Average Population Growth (2000-2022)")
using CSV, DataFrames, StatsPlots, Interact, Blink
cd("02DSWJ/Data/05DataVisualization")
data = CSV.read("worldbankdata.csv", DataFrame);

columns = [:cname, :year, :pop_growth, :life_exp];
countries = ["Canada", "Mexico", "United States"];

datalite = data |>
    df -> select(df, columns) |>
    df -> subset(df, :cname => x -> x .∈ Ref(countries)) |>
    dropmissing

w = Window()
body!(w, dataviewer(datalite))
using CSV, DataFrames, Plots, Statistics
cd("02DSWJ/Data/05DataVisualization")
data = CSV.read("worldbankdata.csv", DataFrame)

countries = ["Germany", "France", "Italy", "Spain"];

data |>
    df -> subset(df, :cname => x -> x .∈ Ref(countries)) |>
    df -> subset(df, :year => x -> 2016 .≤ x .≤ 2021) |>
    df -> unstack(df, :ccode, :year, :inflation) |>
    df -> heatmap(Matrix(df[:, 2:end]),
                  xticks=(1:6, names(df)[2:end]),
                  yticks=(1:4, df.ccode),
                  title="Inflation")

function corr_heatmap(var, countries, years=[1960, 2021])
    corrdf = data |>
        df -> subset(df, :cname => x -> x .∈ Ref(countries)) |>
        df -> subset(df, :year => t -> years[1] .≤ t .≤ years[2]) |>
        df -> select(df, :year, :ccode, var) |>
        df -> unstack(df, :year, :ccode, var) |>
        dropmissing

    corrmat = cor(Matrix(corrdf[:, 2:end]))
    n = length(countries)

    heatmap(corrmat,
            xticks=(1:n, names(corrdf)[2:end]),
            yticks=(1:n, names(corrdf)[2:end]),
            color=:viridis,
            title="Correlation heatmap for $var")
    
    for i ∈ 1:n, j ∈ 1:n 
        annotate!(i, j, text(round(corrmat[i,j]; digits=2), :white))
    end
    annotate!()
end

corr_heatmap(:inflation, countries, [1960, 2021])

corrdf = data |>
    df -> subset(df, :cname => x -> x .∈ Ref(countries)) |>
    df -> subset(df, :year => t -> 1960 .≤ t .≤ 2021) |>
    df -> select(df, :year, :ccode, :inflation) |>
    df -> unstack(df, :year, :ccode, :inflation) |>
    dropmissing

using StatsPlots
corrplot(Matrix(corrdf[:, 2:end]))

country = "Indonesia";
vars = [:poverty, :immunization, :life_exp];

data |>
    df -> subset(df, :cname => x -> x .== country) |>
    df -> select(df, vars) |>
    dropmissing |>
    df -> surface(df[:, 1],
                  df[:, 2],
                  df[:, 3],
                  xlabel=vars[1],
                  ylabel=vars[2],
                  zlabel=vars[3])
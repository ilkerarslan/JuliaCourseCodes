using CSV, DataFrames, StatsPlots, Statistics
cd("02DSWJ/Data/05DataVisualization")
data = CSV.read("worldbankdata.csv", DataFrame)

countries = ["CAN", "GBR", "JPN", "MEX", "NLD"];
macrovar = :gdp_percapita;

data |>
    df -> select(df, :ccode, macrovar) |>
    df -> subset(df, :ccode => x -> x .∈ Ref(countries)) |>
    df -> df[completecases(df), :] |>
    df -> boxplot(df.ccode, df[:, macrovar],
                  legend=false,
                  xlabel="Countries",
                  title=macrovar)

newdata = data |>
    df -> select(df, :ccode, macrovar) |>
    df -> subset(df, :ccode => x -> x .∈ Ref(countries)) |>
    dropmissing

@df newdata boxplot(:ccode, :gdp_percapita, legend=false, color=:white)
@df newdata dotplot!(:ccode, :gdp_percapita, alpha=0.4, color=:red)

@df newdata violin(:ccode, :gdp_percapita, legend=false)

@df newdata boxplot(:ccode, :gdp_percapita, legend=false, color=:white, linewidth=1.5)
@df newdata dotplot!(:ccode, :gdp_percapita, marker=(:red, 3, stroke(0)))
@df newdata violin!(:ccode, :gdp_percapita, alpha=0.4, color=:lightblue)
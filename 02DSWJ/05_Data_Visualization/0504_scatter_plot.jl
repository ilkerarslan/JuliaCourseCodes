using CSV, DataFrames, Plots
cd("02DSWJ/Data/05DataVisualization")
data = CSV.read("worldbankdata.csv", DataFrame)

plot(data.gdp_percapita, data.life_exp,
     seriestype=:scatter,
     legend=false)

scatter(data.gdp_percapita, data.life_exp,
        legend=false,
        markersize=1,
        xlabel="GDP per Capita",
        ylabel="Life Expectancy")

scatter(data.gdp_percapita, data.life_exp,
        legend=false,
        alpha=0.5,
        xlabel="GDP per Capita",
        ylabel="Life Expectancy")

countries = ["BRA", "PER", "COL"]
data[data.ccode .∈ Ref(countries), :] |>
    df -> scatter(df.gdp_percapita, df.life_exp,
                  group=df.ccode,
                  xlabel="GDP per Capita",
                  ylabel="Life Expectancy")

using StatsPlots
@df data scatter(:gdp_percapita, :life_exp,
                 legend=false,
                 xlabel="GDP per Capita",
                 ylabel="Life Exp.")

function scatterplot(varx, vary, group, countries)
    data[ data[:, group] .∈ Ref(countries), :] |>
        df -> scatter(df[:, varx], df[:, vary],
                      group=df[:, group],
                      xlabel=varx,
                      ylabel=vary)
end

scatterplot(:gdp_percapita, :life_exp, :ccode, ["CHN", "JPN", "KOR"])
using CSV, DataFrames, Plots
cd("02DSWJ/Data/05DataVisualization")
data = CSV.read("worldbankdata.csv", DataFrame)

x = data[data.ccode .== "JPN", :year]
y1 = data[data.ccode .== "JPN", :population]

plot(x, y1)

plot(x, y1,
     legend=false,
     title="Population of Japan",
     xlabel="Year",
     ylabel="Population")

plot(x, y1, legend=false)
title!("Population of Japan")
xlabel!("Year")
ylabel!("Population") 

y2 = data[data.ccode .== "TUR", :population];

plot(x, y1, label="Japan")
plot!(x, y2, label="Turkey")
title!("Population of countries")
xlabel!("Year")
ylabel!("Population")

plot(x, [y1 y2],
     label = ["Japan" "Turkey"],
     title="Population of countries",
     xlabel="Year",
     ylabel="Population")

function lineplot(df, var, ccodes)
    df |>
        df -> subset(df, :ccode => x -> x .∈ Ref(ccodes)) |>
        df -> plot(df.year, df[:, var], group=df.ccode,
                   title=var,
                   xlabel="Year")
end                   
    
variable = "gni_pcapita"
countries = ["USA", "GBR", "JPN"];
lineplot(data, variable, countries)
using CairoMakie, CSV, DataFrames
cd("02DSWJ/Data/05DataVisualization")
data = CSV.read("worldbankdata.csv", DataFrame)

var = ["gdp_growth", "co2emission"]
years = [1990, 2020]
countries = ["United States", "China", "Germany"]

f = Figure(backgroundcolor=RGBf(0.9, 0.9, 0.9), size=(960, 540))

gridA = f[1,1] = GridLayout()
gridB = f[1,2] = GridLayout()
gridC = f[2,1] = GridLayout()
gridD = f[2,2] = GridLayout()
f

axscatter = Axis(gridA[2,1])
f
axdensityX = Axis(gridA[1,1])
f
axdensityY = Axis(gridA[2,2])
f

bar1 = Axis(gridB[1,1],
            title = "$(var[1]) ($(years[2]))",
            xticklabelsvisible=false,
            xticksvisible=false)
f

bar2 = Axis(gridB[2,1],
            title = "$(var[2]) ($(years[2]))")
f            

axline1 = Axis(gridC[1,1], title=var[1])
axline2 = Axis(gridD[1,1], title=var[2])
f

dt = data |>
    df -> subset(df, :cname => x -> x .∈ Ref(countries)) |>
    df -> subset(df, :year => x -> years[1] .< x .< years[2]) |>
    df -> select(df, :cname, var[1], var[2]) |>
    dropmissing

for cnt in countries
    x = dt[dt.cname .== cnt, var[1]]
    y = dt[dt.cname .== cnt, var[2]]

    scatter!(axscatter, x, y, label=cnt)
    density!(axdensityX, x)
    density!(axdensityY, y, direction=:y)
end

f

leg = Legend(gridA[1,2], axscatter)
f

xlims!(axdensityX, low=0)
f
ylims!(axdensityY, low=0)
f

hidedecorations!(axdensityX, grid=false)
hidedecorations!(axdensityY, grid=false)
f

leg.tellheight = true
f

rowgap!(gridA, 5)
colgap!(gridA, 5)
f

Label(gridA[1, 1:2, Top()],
      "$(var[2]) vs $(var[1])",
      font=:bold)
f

dt = data |>
    df -> subset(df, :cname => x -> x .∈ Ref(countries)) |>
    df -> subset(df, :year => x -> x .== years[2]) |>
    df -> select(df, :cname, var[1], var[2])

barplot!(bar1, 1:size(dt, 1), dt[:, var[1]])    
f
barplot!(bar2, 1:size(dt, 1), dt[:, var[2]])
f
rowgap!(gridB, 5)
f

bar2.xticks = (1:size(dt, 1), dt.cname)
f

for cnt in countries
    dt = data[(data.cname .== cnt) .& (years[1] .≤ data.year .≤ years[2]), Cols(:year, var[1])]
    x, y = dt[:, 1], dt[:, 2]
    lines!(axline1, x, y)
end
f

for cnt in countries
    dt = data[(data.cname .== cnt) .&
              (years[1] .≤ data.year .≤ years[2]),
              Cols(:year, var[2])]
    x, y = dt[:, 1], dt[:, 2]
    lines!(axline2, x, y)
end
f
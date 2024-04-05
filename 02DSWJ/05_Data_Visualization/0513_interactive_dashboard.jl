using CSV, DataFrames, GLMakie
cd("02DSWJ/Data/05DataVisualization")
data = CSV.read("worldbankdata.csv", DataFrame)

countries = ["Brazil", "Indonesia", "South Africa"];
years = [1990, 2020];

macrovars = Dict("Life Expectancy" => "life_exp",
                 "GDP per Capita" => "gdp_percapita",
                 "GDP Growth" => "gdp_growth",
                 "Net Migration" => "net_migration",
                 "Debt Service" => "debt_service",
                 "Net FDI" => "fdi_net",
                 "External Debt" => "external_debt")

var1 = Observable("gdp_percapita");
var2 = Observable("life_exp");

fig = Figure(backgroundcolor=RGBf(.95, .95, .95), size=(1920, 1080))
gridA = fig[1,1] = GridLayout()
gridB = fig[1,2] = GridLayout()
gridC = fig[2,1] = GridLayout()
gridD = fig[2,2] = GridLayout()

menuvar1 = Menu(fig, options=keys(macrovars), default="GDP per Capita");
menuvar2 = Menu(fig, options=keys(macrovars), default="Life Expectancy");

fig[1:end, 0] = vgrid!(
    Label(fig, "First Variable:", width=200, font=:bold),
    menuvar1,
    Label(fig, "Second Variable:", width=200, font=:bold),
    menuvar2;
    tellheight=true,
    width=200
)

axscatter = Axis(gridA[2,1])
axdensityX = Axis(gridA[1,1])
axdensityY = Axis(gridA[2,2])

axbar1 = Axis(gridB[1,1],
              xticks=(1:length(countries), countries),
              title = lift(x -> x, menuvar1.selection),
              xticklabelsvisible=false,
              xticksvisible=false)

axbar2 = Axis(gridB[2,1],
              xticks=(1:length(countries), countries),
              title = lift(y -> y, menuvar2.selection))

rowgap!(gridB, 10)

axline1 = Axis(gridC[1,1], title=lift(x -> x, menuvar1.selection))
axline2 = Axis(gridD[1,1], title=lift(x -> x, menuvar2.selection))

dfsc = @lift(
    data |>
        df -> subset(df, :year => y -> years[1] .≤ y .≤ years[2]) |>
        df -> subset(df, :cname => cnt -> cnt .∈ Ref(countries)) |>
        df -> select(df, :cname, :year, $var1, $var2) |>
        dropmissing
)

dfbar = @lift(
    data |>
        df -> subset(df, :cname => cnt -> cnt .∈ Ref(countries)) |>
        df -> subset(df, :year => y -> y .== years[2]) |>
        df -> select(df, :cname, $var1, $var2)
)

dfline1 = @lift(
    data |>
        df -> subset(df, :year => y -> years[1] .≤ y .≤ years[2]) |>
        df -> subset(df, :cname => cnt -> cnt .∈ Ref(countries)) |>
        df -> select(df, :cname, :year, $var1)
)

dfline2 = @lift(
    data |>
        df -> subset(df, :year => y -> years[1] .≤ y .≤ years[2]) |>
        df -> subset(df, :cname => cnt -> cnt .∈ Ref(countries)) |>
        df -> select(df, :cname, :year, $var2)
)

for cnt in countries 
    points = @lift(
        Point2f.($dfsc[$dfsc.cname .== cnt, $var1],
                 $dfsc[$dfsc.cname .== cnt, $var2])
    )

    scatter!(axscatter, points, label=cnt)

    xs = @lift([p[1] for p in $points])
    density!(axdensityX, xs)
    ys = @lift([p[2] for p in $points])
    density!(axdensityY, ys, direction=:y)
end

leg = Legend(gridA[1,2], axscatter)

ylims!(axdensityX, low=0)
xlims!(axdensityY, low=0)

hidedecorations!(axdensityX, grid=false)
hidedecorations!(axdensityY, grid=false)
leg.tellheight = true
colgap!(gridA, 7)
rowgap!(gridA, 7)

xs = 1:length(countries)
ys1 = @lift($dfbar[:, 2])
ys2 = @lift($dfbar[:, 3])

barplot!(axbar1, xs, ys1)
barplot!(axbar2, xs, ys2)

for country in countries 
    xs = @lift($dfline1[$dfline1.cname .== country, :year])
    ys = @lift($dfline1[$dfline1.cname .== country, $var1])
    lines!(axline1, xs, ys, label=country)
end

for country in countries 
    xs = @lift($dfline2[$dfline2.cname .== country, :year])
    ys = @lift($dfline2[$dfline2.cname .== country, $var2])
    lines!(axline2, xs, ys, label=country)
end

on(menuvar1.selection) do var
    var1[] = macrovars[var]
    autolimits!(axline1)
    autolimits!(axscatter)
    autolimits!(axdensityX)
    autolimits!(axdensityY)
    autolimits!(axbar1)
    ylims!(axdensityX, low=0)
    xlims!(axdensityY, low=0)
end
notify(menuvar1.selection)

on(menuvar2.selection) do var
    var2[] = macrovars[var]
    autolimits!(axline2)
    autolimits!(axscatter)
    autolimits!(axdensityX)
    autolimits!(axdensityY)
    autolimits!(axbar2)
    ylims!(axdensityX, low=0)
    xlims!(axdensityY, low=0)
end
notify(menuvar2.selection)
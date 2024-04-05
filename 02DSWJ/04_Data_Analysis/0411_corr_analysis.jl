using CSV, DataFrames, Statistics
cd("02DSWJ/Data/04DataAnalysis")
data = CSV.read("data_0410.csv", DataFrame)

function stddev(x)
    n = length(x)
    μ = sum(x) / n 
    sum_sq_devs = (x .- μ).^2 |> sum
    variance = sum_sq_devs / (n-1)
    sqrt(variance)
end

v = randn(200)
stddev(v)
Statistics.std(v)

function corrcoef(x, y)
    idx = @. !(ismissing(x) | ismissing(y))
    x, y = x[idx], y[idx]
    n = length(x)
    mx = sum(x) / n 
    my = sum(y) / n 
    sdx, sdy = stddev(x), stddev(y)
    covxy = (x .- mx) .* (y .- my) |> sum 
    covxy /= (n-1)
    return covxy /(sdx*sdy)
end

a = data.totalCashLoanLimit
b = data.totalCashLoanLimit

corrcoef(a,b) ≈ Statistics.cor(a, b)  # ≈ \approx 
data

inputs = select(data, Not(1:3, :default))
vars = names(inputs)

corrdf = DataFrame(
    variable1=String[],
    variable2=String[],
    corrcoef=Float64[]
)

for i in 1:length(vars)-1
    println("i = $i")
    for j in (i+1):length(vars)
        var1, var2 = vars[i], vars[j]
        coef = corrcoef(inputs[:, var1], inputs[:, var2])
        push!(corrdf, (variable1=var1, variable2=var2, corrcoef=coef))
    end
end

corrdf
sort!(corrdf, :corrcoef, rev=true, by=abs)

vars2remove = corrdf[abs.(corrdf.corrcoef) .> 0.9, :variable2]
vars2remove = unique(vars2remove)
inputs = inputs[!, Not(vars2remove)]

corr_input = DataFrame(
    variable=String[],
    corrcoef=Float64[],
)

invars = names(inputs)
defs = data.default

for var in invars 
    coef = corrcoef(inputs[:, var], defs)
    push!(corr_input, (variable=var, corrcoef=coef))
end

sort!(corr_input, :corrcoef, rev=true, by=abs)

using Plots

col = :maxOverdueDays
nbins = 4

df = data[:, [col, :default]]
sort!(df, col)

df[!, :bin] .= 0
binlimits = (nrow(df) ÷ nbins) .* (1:(nbins-1)) |> collect
pushfirst!(binlimits, 1)

for i ∈ 1:(nbins-1)
    df[binlimits[i]:binlimits[i+1]-1, :bin] .= i 
end

df[binlimits[end]:nrow(df), :bin] .= nbins;

defrates = combine(groupby(df, :bin), :default => mean)

plot(defrates.bin, defrates.default_mean, legend=false, title=col)
scatter!(defrates.bin, defrates.default_mean, legend=false)

function split_to_bins(col::Symbol, nbins::Int)
    df = data[:, [col, :default]]
    sort!(df, col)

    df[!, :bin] .= 0
    binlimits = (nrow(df) ÷ nbins) .* (1:(nbins-1)) |> collect
    pushfirst!(binlimits, 1)

    for i ∈ 1:(nbins-1)
        df[binlimits[i]:binlimits[i+1]-1, :bin] .= i 
    end

    df[binlimits[end]:nrow(df), :bin] .= nbins;    
    defrates = combine(groupby(df, :bin), :default => mean)

    plot(defrates.bin, defrates.default_mean, legend=false, title=col)
    scatter!(defrates.bin, defrates.default_mean, legend=false)
end

split_to_bins(:maxOverdueDays, 6)
split_to_bins(:lastBounceDate, 4)
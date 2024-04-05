using CSV, DataFrames, Dates, Statistics
cd("02DSWJ/Data/04DataAnalysis")
data = CSV.read("data_0407.csv", DataFrame)

data[completecases(data), :]

df = describe(data, :nmissing)
df = df[df.nmissing .> 0, :]
df.rmissing = df.nmissing ./ nrow(data) .* 100;
df

lim = 90;
cols2remove = df[df.rmissing .> lim, :variable]
select!(data, Not(cols2remove))

cond = data[:, :unusedCheckCount] .|> !ismissing;
data = data[cond, :]

dropmissing!(data, :unusedCheckCount)

data |> describe |>
    df -> subset(df, :nmissing => x -> x .> 0) |>
    df -> select(df, [:variable, :nmissing]) |>
    df -> transform!(df, :nmissing =>
                         (x -> x ./ nrow(data) .* 100) =>
                         :rmissing)

medianImpute(v) = [ismissing(el) ?
                   median(skipmissing(v)) :
                   el 
                   for el in v]                         

data.lastCreditUsageDate = medianImpute(data.lastCreditUsageDate)                   
describe(data[:, [:lastCreditUsageDate]], :nmissing)

CSV.write("data_0408.csv", data)
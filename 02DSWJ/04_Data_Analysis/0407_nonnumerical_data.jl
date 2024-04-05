using DataFrames, CSV, Dates
cd("02DSWJ/Data/04DataAnalysis")
data = CSV.read("data_0406.csv", DataFrame)

names(data)

eltype.(eachcol(data))

coltypes = DataFrame(column = names(data),
                     type = eltype.(eachcol(data)))

Union{Missing, Int64}

show(coltypes, allrows=true)

datecond = coltypes.type .∈ Ref([Date, Union{Missing, Date}])
datecols = coltypes[datecond, :]

show(coltypes, allrows=true)

strcond = (coltypes.type .<: AbstractString) .|
          (coltypes.type .<: Union{Missing, AbstractString});

strcols = coltypes[strcond, :]

datecols

diff = data.appDate .- data.latestCreditLineDate

Dates.value.(diff) # error

diff = [ismissing(el) ? missing : Dates.value(el) for el in diff]

cols = datecols.column[datecols.column .!= "appDate"]

for col in cols 
    println(col)
    diff = data.appDate .- data[!, col]
    data[!, col] = [ismissing(el) ? missing : 
                                    Dates.value(el) for el in diff]
end 

data[!, r"Date"]

onehot = zeros(Int8, size(data, 1));

onehot[data[:, "custSegment"] .== "Micro"] .= 1;
data[!, "Micro"] = onehot;
data[!, [:custSegment, :Micro]]

function col2onehot!(df::DataFrame, colname)
    categories = unique(df[:, colname])
    len = size(df, 1)
    for category in categories 
        onehot = zeros(Int8, len)
        onehot[df[:, colname] .== category] .= 1
        df[:, category] = onehot
    end
    select!(df, Not(colname))
end

col2onehot!(data, :custSegment)

data[!, [:Micro, :Medium, :Commercial, :Corporate]]
select(data, [:Micro, :Medium, :Commercial, :Corporate] =>
             (+) =>
             :rowsums)

:custSegment ∈ names(data)

function col2label!(df::DataFrame, colname)
    column = df[!, colname]
    keys = column |> skipmissing |> unique |> sort 
    values = collect(1:length(keys))
    labels = Dict(string.(keys) .=> values)
    newcol = replace(column, labels...)
    newcol = [ismissing(el) ? el : Int(el) for el in newcol]
    data[!, "$(colname)_label"] = newcol 
    select!(df, Not(colname))
end

col2label!(data, "creditRating")

data[!, "creditRating_label"]
strcols 

col2label!(data, "exceptionCategory")
col2label!(data, "reasonNotScoring")

CSV.write("data_0407.csv", data)
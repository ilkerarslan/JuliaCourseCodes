using CSV, DataFrames
cd("02DSWJ/Data/04DataAnalysis")

input = CSV.read("credit_input_data.csv", DataFrame)
output = CSV.read("credit_output_data.csv", DataFrame)

names(input) |> show
names(output) |> show

subtypes(InlineString)

using PrettyTables

coldict = Dict(names(input) .=> eltype.(eachcol(input)))
pretty_table(coldict, crop=:none)
eltype(input[:, "firstCreditUsageDate"])

datecols = names(input, r"Date")
Dict(datecols .=> eltype.(eachcol(input[!, datecols])))

input[!, [:lastCreditUsageDate, :firstCreditUsageDate, :latestCreditLineDate]]

using Dates

dfmt = dateformat"dd-mm-yy";
input = CSV.read("credit_input_data.csv",
                 dateformat=dfmt,
                 DataFrame)

Dict(datecols .=> eltype.(eachcol(input[!, datecols])))
input[!, datecols]

for col in datecols
    input[!, col] = input[!, col] .+ Year(2000)
end
input[!, datecols]

output

output = CSV.read("credit_output_data.csv",
                  dateformat=dfmt,
                  DataFrame)
output[!, "recordDate"] = output[!, "recordDate"] .+ Year(2000)
output 
output.defaultDate = Date.(string.(output.defaultDate), "yyyymmdd");
output

CSV.write("input_0403.csv", input)
CSV.write("output_0403.csv", output)
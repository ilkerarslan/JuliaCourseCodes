using CSV, DataFrames, Dates
cd("02DSWJ/Data/04DataAnalysis")

input = CSV.read("input_0404.csv", DataFrame)
output = CSV.read("output_0404.csv", DataFrame)

input.default .= 0;
input[:, end-2:end]

for row in eachrow(input)
    id, date = row.custID, row.appDate 
    defdates = output[output.customer_ID .== id, :defaultDate]
    result = date .< defdates .< (date + Year(1))

    if !isempty(result) row.default = 1 end 
end

sum(input.default)
sum(input.default) / size(input, 1)

CSV.write("data_0405.csv", input)
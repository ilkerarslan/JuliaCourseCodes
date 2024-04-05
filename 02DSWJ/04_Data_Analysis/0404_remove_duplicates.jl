using CSV, DataFrames
cd("02DSWJ/Data/04DataAnalysis")

input = CSV.read("input_0403.csv", DataFrame)
output = CSV.read("output_0403.csv", DataFrame)

unique!(input, [:custID, :appDate])
unique!(output, [:defaultDate, :customer_ID])

CSV.write("input_0404.csv", input)
CSV.write("output_0404.csv", output)
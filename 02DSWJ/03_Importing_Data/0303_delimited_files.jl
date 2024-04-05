using CSV, DataFrames

cd("02DSWJ/Data/03ImportData")
readdir()

student_data = CSV.read("student_data.csv", DataFrame)
student_data = CSV.read("student_data.csv", DataFrame, delim=";")

input_data = select(student_data, 1:12)

CSV.write("input_data.csv", input_data)
CSV.write("input_data_delim.csv", input_data, delim="|")
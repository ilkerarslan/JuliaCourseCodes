using CSV, DataFrames, HDF5

cd("02DSWJ/Data/03ImportData")
df = CSV.read("student_data.csv", DataFrame)

input1 = df[:, 1:12] |> Array
input2 = df[:, 13:24] |> Array
input3 = df[:, 25:36] |> Array
output = df[:, 37] |> Array

hdfile = h5open("student_data.h5", "cw")
create_group(hdfile, "input_files")

hdfile["input_files"]["input1"] = input1
hdfile["input_files"]["input2"] = input2
hdfile["input_files"]["input3"] = input3

hdfile 

create_group(hdfile, "output_file")
hdfile["output_file"]["output"] = output 

hdfile

attrs(hdfile["input_files"])["Description"] = "Group for inputs"
attrs(hdfile["output_file"])["Description"] = "Group for outputs"

close(hdfile)

file = h5open("student_data.h5", "r")
input1 = file["input_files"]["input1"]
inputdata = read(input1)
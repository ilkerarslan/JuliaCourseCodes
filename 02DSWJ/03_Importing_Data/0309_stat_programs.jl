using StatFiles, DataFrames
cd("02DSWJ/Data/03ImportData/StatFiles")

readdir()

StatFiles.load("data_spss.sav") |> DataFrame 
StatFiles.load("data_stata.dta") |> DataFrame 
StatFiles.load("data_sas.sas7bdat") |> DataFrame
using CSV, DataFrames
cd("02DSWJ/Data/04DataAnalysis")

data = CSV.read("data_0405.csv", DataFrame)

describe(data)

describe(data[:, r"Date"], :detailed)
show(describe(data), allrows=true)

data = data[!, Not(:minOverdueDays)]
combine(groupby(data, :exceptionCategory), nrow => :Freq)
describe(data[:, r"Date"], :min, :median, :max)

cols2replace = [:latestCreditLineDate,
                :firstCreditUsageDate,
                :lastCreditUsageDate]

for col in cols2replace
    data[isless.(data.appDate, data[:, col]), col] .= missing 
end
                
describe(data[:, cols2replace], :min, :median, :max, :nmissing)

using Statistics

data |>
    df -> groupby(df, :custSegment) |>
    df -> combine(df, :totalCashLoanExposure => 
                      (x -> mean(x) / 1000)  => 
                      :meanCashLoan)

data |>
    df -> groupby(df, :default) |>
    df -> combine(df, :totalCashLoanExposure => 
                      (x -> mean(x) / 1000)  => 
                      :meanCashLoan)
                  

data |>
    df -> groupby(df, :default) |>
    df -> combine(df, :bouncedCheckAmountLast3M => 
                      mean  => 
                      :meanBouncedChecks)
              
data |>
    df -> groupby(df, :creditRating) |>
    df -> combine(df, :default => mean => :meanDefault) |>
    df -> sort(df, :creditRating)
              
CSV.write("data_0406.csv", data)
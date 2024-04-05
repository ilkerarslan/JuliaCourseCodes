using XLSX, DataFrames
cd("02DSWJ/Data/03ImportData")

xfile = XLSX.readxlsx("student_data.xlsx")

sheet1 = xfile["student_data"]  # or xfile[1]

datatable = XLSX.gettable(sheet1)
typeof(datatable)

datamtx = XLSX.getdata(sheet1)
DataFrame(datamtx[2:end, :], datamtx[1, :])

xfile
datarange = sheet1["A1:AK4425"]
DataFrame(datarange[2:end, :], datarange[1, :])

student_data = XLSX.readtable("student_data.xlsx", 1) |> DataFrame

datamtx = Matrix{Any}(undef, 0 ,37)
fname = "student_data.xlsx"

XLSX.openxlsx(fname, enable_cache=false) do xfile 
    sheet = xfile[1]
    for r in XLSX.eachrow(sheet)
        XLSX.row_number(r) % 1_000 == 0 &&
            println("Row: $(XLSX.row_number(r))")
        row = Any[r[i] for i in 1:37]
        row = reshape(row, 1, 37)
        global datamtx = vcat(datamtx, row)
    end
end

DataFrame(datamtx[2:end, :], datamtx[1, :])

data_lite = select(student_data, 1:12)
XLSX.writetable("student_data_lite.xlsx", data_lite)

data1 = select(student_data, 1:12)
data2 = select(student_data, 13:37)

XLSX.openxlsx("new_data.xlsx", mode="w") do xfile 
    XLSX.addsheet!(xfile, "data1")
    XLSX.writetable!(xfile["data1"], data1)
    XLSX.addsheet!(xfile, "data2")
    XLSX.writetable!(xfile["data2"], data2)
end
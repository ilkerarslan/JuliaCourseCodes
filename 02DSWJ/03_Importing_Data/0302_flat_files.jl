pwd()
cd("D:/002Julia_Courses/JuliaCourseCodes/02DSWJ/Data/")
readdir()
mkdir("03ImportData")
mkdir("03ImportData/newfolder")
touch("03ImportData/newfolder/newfile.txt")

file = open("03ImportData/newfolder/newfile.txt")
readlines(file)
close(file)

#=
open(fname) do file
    do something with the file 
end
=#

fname = "03ImportData/newfolder/newfile.txt"
open(fname) do file 
    readlines(file)
end

file = open(fname, "w")
write(file, "This is a new line...\n")
close(file)

rm("03ImportData/newfolder/newfile.txt")
rm("03ImportData/newfolder")
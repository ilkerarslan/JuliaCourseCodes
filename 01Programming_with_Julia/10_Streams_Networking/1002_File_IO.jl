touch("10_Streams_Networking\\sample_file.txt")

f = open("10_Streams_Networking\\sample_file.txt")
readlines(f)
close(f)

fname = "10_Streams_Networking\\sample_file.txt"

open(fname) do file 
    readlines(file)
end

open(fname) do file 
    for line in eachline(file)
        println(line)
    end
end

vec = 1:10

map(x -> x^3, vec)

map(vec) do x 
    x^3 
end

fname = "10_Streams_Networking\\sample_file.txt"
f2 = open(fname, "w")
write(f2, "This is a new line...\n")
close(f2)

f3 = open(fname, "a")
write(f3, "And another line\n")
close(f3)

open(fname, "a") do f
    write(f, "One more line...\n")
    close(f)
end

readdir()

readdir("10_Streams_Networking")
mkdir("10_Streams_Networking\\Data_Files")

for file in ["sales", "employees", "products"]
    touch("10_Streams_Networking\\Data_Files\\"*file*".txt")
end

dir = "10_Streams_Networking\\Data_Files"
files = readdir(dir)

for fname in files 
    file = dir*"\\"*fname
    open(file, "a") do f 
        write(f, "This is the first line in the file: "*fname)
        close(f)
    end
end

dir = "10_Streams_Networking\Data_Files"
mkdir(dir)
for fname in ["sales", "employees", "products"]
    file = dir*"\\"*".txt"
    write(file, "This is the first line in the file: "*fname*".txt")
end
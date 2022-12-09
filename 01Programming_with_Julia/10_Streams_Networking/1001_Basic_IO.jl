read(stdin, Char)

read(stdin, 5)

write(stdout, "Julia is cool.")

write(stdout, "Julia is cool."); # to supress the number of characters in the output

readline(stdin)

for line in eachline(stdin)
    if line == "exit" break end
    println("You printed >>> $line")
end

while !eof(stdin)
    c = read(stdin, Char)
    if c ∈ ['q', 'Q'] break end 
    println("Typed >>> $c")
end

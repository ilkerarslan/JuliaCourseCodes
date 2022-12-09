input = nothing
arr = []

while input != 0
    print("Enter a number (0 to exit): ")
    global input = parse(Int, readline())
    append!(arr, input)
end

println("You entered:        ", length(arr), " numbers")
println("Sum of numbers:     ", sum(arr))
println("Average of numbers: ", sum(arr)/length(arr))

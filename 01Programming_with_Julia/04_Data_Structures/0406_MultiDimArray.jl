# Array{T}
# Array{T, N}

Array{Float64, 3}(undef, (5,4,3))
Array{Union{Int64, Nothing}, 4}(nothing, (2,3,2,3))
Array{Union{String, Missing}}(missing, 4,3,2)

v = Vector(1:60);
arr1 = reshape(v, (5,4,3))

[1 2 3 4; 5 6 7 8]

[1;5;;2;6;;3;7;;4;8]

[1;5;;2;6;;3;7;;4;8;;;
 9;13;;10;14;;11;15;;12;16]

arr1[2, 4, 3]
arr1[5, 3, 1]
arr1[43]


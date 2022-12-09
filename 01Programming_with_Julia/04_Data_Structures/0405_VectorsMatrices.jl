cvec = [1, 2, 3, 4, 5]

rvec = [1 2 3 4 5]

mat = [1 2 3; 4 5 6; 7 8 9; 10 11 12]

mat2 = [1 2 3
       4 5 6
       7 8 9
       10 11 12]

cvec = [1; 2; 3; 4; 5]

[1, 2, 3; 4, 5, 6]

ndims(cvec)
ndims(rvec)
ndims(mat)

size(cvec)
size(rvec)
size(mat)

size(mat, 1)
size(mat, 2)

length(mat)

mat
mat[2,3]
mat[end, end]

mat[3]
mat[5]

mat[2:4, 2:3]

mat[2, :]
mat[:, 3]

cvec1 = [1, 2, 3, 4, 5]
cvec2 = [6, 7, 8, 9, 10]
cvec3 = [11, 12, 13, 14, 15]

vcat(v1, v2, v3)
hcat(v1, v2, v3)

rvec1 = [1 2 3 4 5]
rvec2 = [6 7 8 9 10]
rvec3 = [11 12 13 14 15]

vcat(rvec1, rvec2, rvec3)
hcat(rvec1, rvec2, rvec3)

[cvec1; cvec2; cvec3]

[cvec1, cvec2, cvec3]

[cvec1 cvec2 cvec3]

[rvec1; rvec2; rvec3]
[rvec1 rvec2 rvec3]

m1 = [1 2 3; 4 5 6]
m2 = [11 12 13; 14 15 16]
mver = [m1; m2]
mhor = [m1 m2]

emptymat = Matrix(undef, 2, 3)
Matrix{Any}(undef, 2, 3)
Matrix{Float64}(undef, 3, 2)
mat = Matrix{Union{Int64, String}}(undef, 3, 4)
mat[2, 3] = 999;
mat[1, 2] = "number";
mat
mat[3, 4] = 3.14

nothing
typeof(nothing)

Matrix{Any}(nothing, (2,3))
Matrix{Int64}(nothing, (2,3))
Matrix{Union{Int64, Nothing}}(nothing, (2,3))

missing
typeof(missing)

Matrix{Union{Missing, String}}(missing, (2,3))

reshape(1:15, 3, 5)
reshape(mhor, (4, 3))

zeros(2,3)
ones(2,3)
ones(Int32, 2, 3)
trues(2,2)
falses(2,2)
fill(3.14, (3,2))

rand(1:20, 3, 5)
randn(3,5)


m1 = reshape(range(12., 23., length=12), (4,3))
m2 = similar(m1)
m3 = similar(m1, (3,3))


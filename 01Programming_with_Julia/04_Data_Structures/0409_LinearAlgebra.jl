using LinearAlgebra

mat = [1 4 8;2 5 9; 3 6 7]

tr(mat)
det(mat)

transpose(mat)
mat'

mat2 = [4 2 1; 5 0 3; 3 2 1]
mat * mat2

mat .* mat2

x = 7.6;
y = 1/x

idt = [1 0 0; 0 1 0; 0 0 1]

I
I(3)

idt == I
idt == I(3)

invmat = inv(mat)

mat * invmat

A = [1 2; 2 -4]
B = [28; -2]

# A * X = B
X = A\B
A*X == B


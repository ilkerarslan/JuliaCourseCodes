5 + 7
14 - 6
3.14 * 2.78
67 / 13

ans
ans^2

x = 12
y = 23
3x + 5y

4(5 + 7)

-x
-y

# ÷  # \div TAB
15 ÷ 6
6.5 ÷ 2

div(15, 6)
div(6.5, 2)

4 ^ 3
0.25 ^ 0.5

4 + 5
+(4,5)

4^3
^(4,3)

5 \ 15
4 \ 8

sqrt(16)
√16

cbrt(64)
∛64   # \cbrt TAB

28 % 5
rem(28, 5)

a = 7.8
b = 3.6

a == b
a != b
a ≠ b   # \ne TAB

c = [1, 2, 3]
d = c
e = deepcopy(c)

c == e
c === e
c ≡ e   # \equiv TAB

a ≤ b  # \leq TAB
a ≥ b  # \geq TAB

c = 1.7
a ≥ b ≥ c

(a ≥ b) && (b ≥ c)

3 ≤ 3 < 9 ≠ 17 ≥ 14

0.4 + 0.2
0.6 == 0.4 + 0.2
isequal(0.6, 0.4 + 0.2)

isapprox(0.6, 0.4 + 0.2)
0.6 ≈ 0.4 + 0.2   # \approx TAB

a = true
b = false
!a
!b

a && a
a && b
a || b
b || b


x = 109;
y = 56;

x & y
x | y
x ⊻ y   # \xor TAB
xor(x,y)

~x

using Bits
bits(5)
~5
bits(-6)

bitstring(5)
bitstring(-6)

x = 7
x = x + 5

x += 5    # x = x + 5
x *= 4    # x = x * 4
x /= 17   # x = x / 17
x ^= 3    # x = x 

log(ℯ^2)

log(10, 10000)

exp(3)
ℯ^3   # \euler TAB


round(3.78)  # nearest integer
floor(3.78)  # towards -∞
ceil(3.25)   # towards ∞

abs(-3)
sign(-4)
sign(2)

sin(π/6)
cos(π/4)
tan(π/4)

sind(30)
cosd(45)
tand(30)

rand(4)
rand(Int, 4)
rand(Float64, (2,2))
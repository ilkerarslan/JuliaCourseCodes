tpl1 = (3, "Julia", 2022, 4.12)
typeof(tpl1)

tpl2 = tuple(3, "Julia", 2022, 4.12)
tpl1 === tpl2
supertype(Tuple)

tpl2 = (4, 9, 3.5, 4.5)
typeof(tpl2)

tpl3 = "Julia", 5+7, 10//3
typeof(tpl3)

t = (6)
typeof(t)

t = (6, )  # or t = 6,
typeof(t)

tpl1[1]
tpl1[2]
tpl1[2:3]

tpl = (name="Julia", year=2012, version=1.7)
tpl[1]

tpl.version

t = (a = 7, 8, 10)


mathConsts = (MathConstants.pi, MathConstants.e, MathConstants.golden)

p, e, g = mathConsts
p
e
g

nt = (3, 4, 5, 6)
typeof(t)

ntuple(x -> x^3, 5)

in(2022, tpl1)
in("Python", tpl1)

2022 ∈ tpl1
"C++" ∈ tpl1

1999 ∉ tpl1
2022 ∉ tpl1
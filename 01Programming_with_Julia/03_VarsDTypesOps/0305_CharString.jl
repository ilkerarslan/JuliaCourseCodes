chr = 'a'
typeof(chr)
numchar = Int(chr)
typeof(numchar)

unichar = 'Σ'

'\u03A3'

'\u03B1'

str = "Julia string"
typeof(str)

longstr = """Another Julia string."""

str = "Julia language"
str[1]
str[14]

str[begin]
str[end]

str[end-1]
str[end÷2]

str[3:5]
str[end-4:end]
firstindex(str)
lastindex(str)
length(str)

newstr = "αβΣ"

firstindex(newstr)
lastindex(newstr)

newstr[1]
newstr[2]
newstr[3]

c = "∞ α a Σ"
lastindex(c)
length(c)
ncodeunits('→')

ncodeunits('∫')
sizeof('∫')

str1 = "Julia programming"
str2 = "is the best"
string(str1, " ", str2)
str1 * " " * str2

"Julia "^4

x = 4
y = 5
"First number is $x, and second number is $y and their sum is $(x+y)."


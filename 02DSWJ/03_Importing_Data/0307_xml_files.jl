using EzXML, DataFrames
cd("02DSWJ/Data/03ImportData")

doc = XMLDocument()
typeof(doc)

doc.node
typeof(doc.node)
print(doc)

starwars = ElementNode("starwars")
setroot!(doc, starwars)
print(doc)

movie1 = ElementNode("movie")
addelement!(movie1, "order", "IV")
addelement!(movie1, "name", "A New Hope")
addelement!(movie1, "year", "1977")

rate = ElementNode("rating")
rate["source"] = "IMDB"
rate.content = "8.6"
link!(movie1, rate)

prettyprint(movie1)

link!(starwars, movie1)
prettyprint(doc)

movie2 = ElementNode("movie")
addelement!(movie2, "order", "V")
addelement!(movie2, "name", "The Empire Strikes Back")
addelement!(movie2, "year", "1980")
rate = ElementNode("rating")
rate["source"] = "IMDB"
rate.content = "8.7"
link!(movie2, rate)
link!(starwars, movie2)

movie3 = ElementNode("movie")
addelement!(movie3, "order", "VI")
addelement!(movie3, "name", "Return of the Jedi")
addelement!(movie3, "year", "1983")
rate = ElementNode("rating")
rate["source"] = "IMDB"
rate.content = "8.3"
link!(movie3, rate)
link!(starwars, movie3)

prettyprint(doc)
write("starwars.xml", doc)

xmldoc = EzXML.readxml("starwars.xml")
xmlroot = xmldoc.root

orderNodes = findall("//starwars/movie/order", xmlroot)
orders = [element.content for element in orderNodes]

nameNodes = findall("//starwars/movie/name", xmlroot)
yearNodes = findall("//starwars/movie/year", xmlroot)
ratingNodes = findall("//starwars/movie/rating", xmlroot)

names = [el.content for el in nameNodes]
years = [el.content for el in yearNodes]
ratings = [el.content for el in ratingNodes]

starwars = DataFrame(order=orders,
                     name=names,
                     year=parse.(Int, years),
                     rating=parse.(Float64, ratings))
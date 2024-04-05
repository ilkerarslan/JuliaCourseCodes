using DataFrames, RDatasets

iris = dataset("datasets", "iris");
iris 

show(iris)
show(iris, allrows=true)

iris[1, 2]
iris[  1:5, 2:3 ]
iris[ [3, 7, 9], [2, 4]]

iris[:, 2:end]
iris[end-9:end, 1:2]

iris[:, [:SepalLength, :PetalLength]]
iris[:, ["SepalLength", "PetalLength"]]
iris[51:60, [:SepalLength, :PetalLength, :Species]]

iris[:, :SepalLength]
iris[:, [:SepalLength]]

iris[!, r"Width"]
iris[!, Not(r"Width")]

iris[:, Between(:SepalWidth, :PetalWidth)]

iris[!, All()] == iris[!, :]

iris[:, Cols(col -> endswith(col, "Length"))]

iris[:, 
     Cols("Species", "SepalLength", "PetalLength", "SepalWidth", "PetalWidth")]

iris[:, Cols(r"Sepal", "Species")]

iris[:, Cols(r"Petal", :)]


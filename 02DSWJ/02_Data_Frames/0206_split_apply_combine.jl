using DataFrames, CSV, Statistics

hflights = CSV.read("02DSWJ/Data/02DataFrames/hflights.csv", DataFrame)

names(hflights)

hflights.Origin |> unique

hflights.Dest |> unique
hflights.UniqueCarrier |> unique  

origin_grp = groupby(hflights, :Origin)

combine(origin_grp, :DepDelay => mean)
combine(origin_grp, :DepDelay => mean ∘ skipmissing)
combine(origin_grp, :DepDelay => mean∘skipmissing => :meanDepDelay)
combine(origin_grp, nrow, proprow)

combine(origin_grp, 
        :ArrDelay => mean∘skipmissing => :meanArrDelay,
        :DepDelay => mean∘skipmissing => :meanDepDelay)

combine(origin_grp, 
        :Distance =>
        (x -> [extrema(x)]) =>
        [:minDist, :maxDist])

combine(origin_grp,
        AsTable([:ArrDelay, :DepDelay]) =>
        (x -> (x.ArrDelay + x.DepDelay) |> mean∘skipmissing) =>
        :meanDelay)

combine(x -> (x.ArrDelay+x.DepDelay) |> mean∘skipmissing, origin_grp)

combine(origin_grp,
        :Distance =>
        (x -> (minDist=minimum(x), maxDist=maximum(x))) =>
        AsTable)
using CSV, DataFrames

books = CSV.read("02DSWJ/Data/02DataFrames/books.csv", DataFrame)
books_lent = CSV.read("02DSWJ/Data/02DataFrames/bookslent.csv", DataFrame)
members = CSV.read("02DSWJ/Data/02DataFrames/members.csv", DataFrame)
publishers = CSV.read("02DSWJ/Data/02DataFrames/publishers.csv", DataFrame)

books_lent
books 

innerjoin(books_lent, books, on=:Book_No)
innerjoin(books_lent, books, on=[:Book_No, :Book_Name])

innerjoin(books_lent, books, on = :Book_No, makeunique=true)

books
publishers

leftjoin(books, publishers, on= :Publisher => :Publisher_Name)

leftjoin(books, publishers, on= :Publisher => :Publisher_Name) |>
        df -> subset(df, :Publisher_No => x -> ismissing.(x))

books_lent
members

rightjoin(books_lent, members, on= :Member_No)

outerjoin(publishers, books, on = :Publisher_Name => :Publisher)

semijoin(members, books_lent, on = :Member_No)

members
books

crossjoin(members, books)

outerjoin(publishers, books,
          on = :Publisher_Name => :Publisher,
          validate=(true, false))

outerjoin(publishers, books,
          on = :Publisher_Name => :Publisher,
          source = :source)

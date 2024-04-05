using ODBC, DBInterface, DataFrames

ODBC.drivers()

conn = ODBC.Connection("Driver=ODBC Driver 17 for SQL Server;
                       SERVER=localhost;
                       DATABASE=Northwind;
                       UID=juliasql;
                       PWD=qwer1234*")

DBInterface.execute(conn,
                    """SELECT ProductID, ProductName
                    FROM Products
                    WHERE Discontinued = 'True'
                    ORDER BY ProductID
                    """) |> DataFrame 

DBInterface.execute(conn,
                    """
                    SELECT ProductID, ProductName, UnitPrice
                    FROM Products
                    WHERE ( (UnitPrice < 20) AND (Discontinued='False'))
                    ORDER BY UnitPrice DESC
                    """) |> DataFrame 

DBInterface.close!(conn)
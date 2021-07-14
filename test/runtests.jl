using SQLite,SQLiteDF, DataFrames,Test

a = DataFrame(foo=[1,2,3],bar=[4,5,6])
b = DataFrame(foo=[1,2,3],baz=["four","five","six"])
cc = DataFrame(foo=[1,2,3],bar=[4,5,6],baz=["four","five","six"])


c = @sqlitedf(a,b,"select a.*,b.baz from a join b on a.foo=b.foo") |> DataFrame

@test c == cc



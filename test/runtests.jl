using SQLite,SQLiteDF, DataFrames,Test

a = DataFrame(foo=[1,2,3],bar=[4,5,6])
b = DataFrame(foo=[1,2,3],baz=["four","five","six"])
cc = DataFrame(foo=[1,2,3],bar=[4,5,6],baz=["four","five","six"])


c = @sqlitedf(a,b,"select a.*,b.baz from a join b on a.foo=b.foo") |> DataFrame

@test c == cc


a = DataFrame(foo=["one","two","three"],bar=[1,2,3])
b = DataFrame(bar=[1,2,3],baz=["ONE","TWO","THREE"])
cc = DataFrame(foo=["one","two","three"],bar=[1,2,3],baz=["ONE","TWO","THREE"])

c = @sqlitedf(a,b,"select a.*,b.baz from a join b on a.bar=b.bar") |> DataFrame

@test c == cc



a = DataFrame(foo=["one","two","three"],bar=[1,2,3])
b = DataFrame(foo=["one","two","three"],baz=["ONE","TWO","THREE"])
cc = DataFrame(foo=["one","two","three"],bar=[1,2,3],baz=["ONE","TWO","THREE"])

c = @sqlitedf(a,b,"select a.*,b.baz from a join b on a.foo=b.foo") |> DataFrame

@test c == cc

module SQLiteDF
using SQLite
export @sqlitedf

"""@sqlitedf(a,b,c,...,Q) creates a new in-memory SQLite database,
loads the tables a,b,c, etc into that database using the names a,b,c
etc and then executes the query Q which can refer to the tables a,b,c
by name. The result can be converted to a DataFrame or similar.
example:
mydf = @sqlitedf(a,b,"select a.*,b.* from a join b on a.foo=b.foo") |> DataFrame()
"""
macro sqlitedf(a...)
    q = a[end]
    tabs = a[1:end-1]
    names = String.(tabs)
    db = gensym()
    code = :(begin end)
    push!(code.args,esc(:($db = SQLite.DB())))
    for (tab,name) in zip(tabs,names)
        push!(code.args,esc(:(SQLite.load!($tab,$db,$name))))
    end
    push!(code.args,esc(:(SQLite.DBInterface.execute($db,$q))))
    return code
end

end

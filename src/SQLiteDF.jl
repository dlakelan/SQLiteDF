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
    db = gensym()
    return esc(quote
        $db = SQLite.DB();
        for sym in $(a[1:end-1])
            SQLite.load!(eval(sym),$db,String(sym))
        end;
        SQLite.DBInterface.execute($db,$(a[end]))
    end)
end

end

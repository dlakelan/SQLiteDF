# SQLiteDF
Provides a simple Julia macro that allows you to load data from
Tables.jl interface objects into an in-memory SQLite database and then
execute a query to get back a potentially complex result.


@sqlitedf(a, b, c, ..., "select ...")

creates a new in-memory SQLite database, loads the data from a,b,c,...
into SQL tables named a,b,c,... etc and then executes the query in the
final position, returning the result.

The tables can be anything that SQLite is happy running load! on,
which basically means anything that is Tables.jl API compatible.

Returns a Tables.jl compatible object that can for example be read
into a DataFrame.

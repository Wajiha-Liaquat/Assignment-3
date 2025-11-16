con <- dbConnect(
  RMySQL::MySQL(),
  user = "root",
  password = "Samsung7898$",
  dbname = "sakila",
  host = "localhost"
)

film <- as.data.table(dbReadTable(con, "film"))
language <- as.data.table(dbReadTable(con, "language"))
customer <- as.data.table(dbReadTable(con, "customer"))
store <- as.data.table(dbReadTable(con, "store"))
payment <- as.data.table(dbReadTable(con, "payment"))
staff <- as.data.table(dbReadTable(con, "staff"))
inventory <- as.data.table(dbReadTable(con, "inventory"))
rental <- as.data.table(dbReadTable(con, "rental"))

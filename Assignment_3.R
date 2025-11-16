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

question1 <- film[rating == "PG" & rental_duration > 5]
question1

question2 <- film[, .(avg_rental_rate = mean(rental_rate)), by = rating]
question2


question3 <- merge(film, language, by = "language_id")[
  , .(film_count = .N), 
  by = name
]
question3


question4 <- merge(customer, store, by = "store_id")[
  , .(first_name, last_name, store_id)
]
question4




question5 <- merge(payment, staff, by = "staff_id")[
  , .(payment_id, amount, payment_date, staff_first = first_name, staff_last = last_name)
]
question5




all_rented_films <- merge(inventory, rental, by = "inventory_id")[, unique(film_id)]

question6 <- film[!film_id %in% all_rented_films]
question6




library(ggplot2)
library(data.table)

avg_rate <- film[, .(avg_rental_rate = mean(rental_rate)), by = rating]

# Line plot
ggplot(avg_rate, aes(x = rating, y = avg_rental_rate, group = 1)) +
  geom_line() +
  geom_point() +
  labs(
    title = "Average Rental Rate by Film Rating",
    x = "Film Rating",
    y = "Average Rental Rate"
  )


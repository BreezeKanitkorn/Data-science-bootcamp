## 1. load library
library(RPostgreSQL)
library(tidyverse)


## 2. create dataframe
# 2.1. create dataframe : customers

customers <- tribble(
  ~customerid, ~name, ~gender, ~age, ~phone,
  1, "Breeze", "Male" , 27 , 0974236591,
  2, "Tony" , "Male" , 45 , 0687524569,
  3, "Danny" , "Male" , 38 , 0924569687,
  4, "Jam" , "Female" , 21 , 0687569245,
  5, "Auz" , "Male" , 19 , 0945696875,
)

# 2.2. create dataframe : menu

menu <- tribble(
  ~menu_id, ~menu_name, ~menu_catagory, ~menu_price,
  1, "Margherita"	, "Pizza"	, 399,
  2, "Pepperoni", "Pizza"	, 459,
  3, "Hawaiian"	, "Pizza"	, 459,
  4, "Double Cheese", "Pizza"	, 499,
  5, "Meat Lovers", "Pizza"	, 499,
  6, "Vegetarian", "Pizza"	, 399,
  7, "Chicken Phanang Curry", "Pizza"	, 599,
  8, "Spicy Minced Pork Salad", "Pizza"	, 599,
  9, "Monthong Durian sauce", "Pizza"	, 599,
  10, "Garlic Bread", "Side", 99,
  11, "French Fries", "Side", 99,
  12, "Onion Rings", "Side", 129,
  13, "Wing", "Side", 199,
  14, "Thai Tea Ice Cream", "Dessert", 99,
  15, "Chocolate Ice Cream", "Dessert", 99,
  16, "Strawberry Ice Cream", "Dessert", 99,
  17, "IPA Beer", "Beverage", 199,
  18, "Coke", "Beverage", 50,
  19, "Thai TEA", "Beverage", 99,
  20, "Mineral Water", "Beverage", 40 
  )
View(menu)

# 2.3. create dataframe : order_item
order_item <- tribble(
  ~order_item_id, ~order_id,  ~menu_id,  ~quantity,
  1,	1, 7, 1,
  2,	1, 17,1,
  3,	2, 8 ,1,
  4,	2, 10 ,1,
  5,	2, 20 ,1,
  6,	3, 6 ,1,
  7,	3, 2 ,1,
  8,	3, 10 ,3,
  9,	4, 4 ,2,
  10,	4, 7 ,2,
  11,	4, 1 ,1,
  12,	4, 17 ,6,
  13,	5, 4 ,1,
  14,	5, 14 ,1,
  15,	5, 18 ,1,
  16,	6, 4 ,1,
  17,	6, 11 ,1,
  18,	6, 18 ,1,
  19,	7, 2 ,1,
  20,	7, 19 ,1
)

# 2.4 create dataframe : orders
orders <- tribble(
  ~order_id,	~customer_id, ~order_date, ~order_time, ~total_price,
  1, 1, "2023-11-9", "12:00:00" ,798,
  2, 2, "2023-11-10", "13:00:00" ,738,
  3, 3, "2023-11-10", "14:00:00" ,1155,
  4, 4, "2023-11-10", "15:00:00" ,3789,
  5, 5, "2023-11-11", "18:00:00" ,648,
  6, 2, "2023-11-12", "13:00:00" ,648,
  7, 3, "2023-11-13", "14:00:00" ,558
)

## 3. create connection
con <- dbConnect(
  PostgreSQL(),
  host = "floppy.db.elephantsql.com", ## IP address of data base
  dbname = "auswlsbp", ## same as user
  user = "auswlsbp",
  password = "Tr-rHC_c0v84bQWUvAM7TmZ7ndeaH9GP",
  port = 5432 ##port no of PostgreSQL
)


## 4. db write tables
dbWriteTable(con, "customers", customers)
dbWriteTable(con, "menu", menu)
dbWriteTable(con, "order_item", order_item)
dbWriteTable(con, "orders", orders)

## db check list tables
dbListTables(con)

## 5. get data
df_customers <- dbGetQuery(con, "select * from customers")
df_menu <- dbGetQuery(con, "select * from menu")
df_order_item <- dbGetQuery(con, "select * from order_item")
df_orders <- dbGetQuery(con, "select * from orders")

## 6. Disconnect
dbDisconnect(con)


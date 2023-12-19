/*Homework in SQL

PIZZA restaurant

1. Create at least 3 tables
  -customers
  -orders
  -menus (Pizza)

2. three SQL quries 
  2.1 JOIN
  2.2 Subquriies or WITH
  2.3 Agregate fucntions*/

--HW1 : Create tables
-------------------------------------------------
----Table1 : Create_and_Insert_Customer_Table----
-------------------------------------------------
CREATE TABLE customers (
   customer_id INT PRIMARY KEY , 
   first_name TEXT NOT NULL,
   last_name TEXT NOT NULL,
   email TEXT,
   phone_number TEXT  );

INSERT INTO customers VALUES 
  (1, 'Shawn' , 'Dumrong', 'Shawn.D@gmail.com', '091-999-45788'),
  (2, 'Julian', 'Sumrit', 'Julian.S@gmail.com', '094-216-2226'),
  (3, 'Bob', 'Jumjai', 'Bob.J@gmail.com', '068-998-6172'),
  (4, 'Alice', 'Wittaya', 'Alice.W@gmail.com', '098-941-2154'),
  (5, 'David', 'Boonchum', 'David.B@gmail.com', '091-420-7741');

SELECT * FROM customers;
---------------------------------------------
----Table2 :Create_and_Insert_Menu_Table-----
---------------------------------------------
CREATE TABLE menu (
    menu_id INT PRIMARY KEY,
    menu_name TEXT,
    menu_category TEXT,
    menu_price REAL);

INSERT INTO menu VALUES
    (1, 'Margherita'				, 'Pizza'	, 399),
    (2, 'Pepperoni'					, 'Pizza'	, 459),
    (3, 'Hawaiian'					, 'Pizza'	, 459),
    (4, 'Double Cheese'				, 'Pizza'	, 499),
    (5, 'Meat Lovers'				, 'Pizza'	, 499),
    (6, 'Vegetarian'				, 'Pizza'	, 399),
    (7, 'Chicken Phanang Curry'		, 'Pizza'	, 599),
    (8, 'Spicy Minced Pork Salad'		, 'Pizza'	, 599),
    (9, 'Monthong Durian sauce'		, 'Pizza'	, 599),
    (10, 'Garlic Bread'				, 'Side'			, 99),
    (11, 'French Fries'				, 'Side'			, 99),
    (12, 'Onion Rings'				, 'Side'			, 129),
    (13, 'Wing'					, 'Side'			, 199),
    (14, 'Thai Tea Ice Cream'			, 'Dessert'		, 99),
    (15, 'Chocolate Ice Cream'		, 'Dessert'		, 99),
    (16, 'Strawberry Ice Cream'		, 'Dessert'		, 99),
    (17, 'IPA Beer'					, 'Beverage'		, 199),
    (18, 'Coke'					, 'Beverage'		, 50),
    (19, 'Thai TEA'					, 'Beverage'		, 99),
    (20, 'Mineral Water'				, 'Beverage'		, 40)
    ;

SELECT * from menu ;
--------------------------------------------------
----Table3 :Create_and_Insert_Order_item_Table----
--------------------------------------------------
CREATE TABLE order_item (
  order_detail_id INTEGER PRIMARY KEY AUTOINCREMENT ,
  order_id INT NOT NULL,
  menu_id INT NOT NULL,
  quantity INT NOT NULL

);

INSERT INTO order_item (order_id, menu_id, quantity) VALUES 
(1, 7, 1),
(1, 17,1),
(2, 8 ,1),
(2, 10 ,1),
(2, 20 ,1),
(3, 6 ,1),
(3, 2 ,1),
(3, 10 ,3),
(4, 4 ,2),
(4, 7 ,2),
(4, 1 ,1),
(4, 17 ,6),
(5, 4 ,1),
(5, 14 ,1),
(5, 18 ,1),
(6, 4 ,1),
(6, 11 ,1),
(6, 18 ,1),
(7, 2 ,1),
(7, 19 ,1);

SELECT* from order_item ;
----------------------------------------------
----Table4 :Create_and_Insert_Orders_Table----
----------------------------------------------

CREATE TABLE orders (
  order_id INTEGER PRIMARY KEY AUTOINCREMENT ,
  customer_id INT NOT NULL,
  order_date TEXT NOT NULL,
  order_time TEXT NOT NULL,
  total_price REAL NOT NULL
);

INSERT INTO orders  (customer_id, order_date, order_time, total_price)
VALUES 
    ( 1, '2023-11-9', '12:00:00' ,798),
    ( 2, '2023-11-10', '13:00:00' ,738),
    ( 3, '2023-11-10', '14:00:00' ,1155),
    ( 4, '2023-11-10', '15:00:00' ,3789),
    ( 5, '2023-11-11', '18:00:00' ,648),
    ( 2, '2023-11-12', '13:00:00' ,648),
    ( 3, '2023-11-13', '14:00:00' ,558) ;

SELECT * from orders;

----HW2
--HW 2.1  :  JOIN
--Q1 : The most sales of Beverage on 2023-11-10.
--Use Basic querie 

SELECT 
  od.order_date,
  m.menu_category,
  m.menu_name,
  m.menu_price,
  odi.quantity


FROM menu  as m
JOIN order_item as odi
  ON m.menu_id = odi.menu_id
JOIN orders as od
  ON od.order_id = odi.order_id 
WHERE od.order_date = "2023-11-10" 
AND m.menu_category = "Beverage" 
ORDER BY  odi.quantity DESC
LIMIT 1

; 

--HW 2.2  :Use  Subquriies or WITH
--The most sales of Beverage on 2023-11-10.

--With querie--------------------------------

WITH beverage AS 
  (SELECT * FROM menu WHERE menu_category = "Beverage"),
  c_date AS
  (SELECT * FROM orders WHERE order_date = "2023-11-10")

SELECT 

  od.order_date,
  m.menu_category,
  m.menu_name,
  m.menu_price,
  odi.quantity


FROM beverage  as m
JOIN order_item as odi
  ON m.menu_id = odi.menu_id
JOIN c_date as od
  ON od.order_id = odi.order_id 

ORDER BY  odi.quantity DESC
LIMIT 1 ;

--Sub quries----------------------------

SELECT 

  od.order_date,
  m.menu_category,
  m.menu_name,
  m.menu_price,
  odi.quantity


FROM (SELECT * FROM menu WHERE menu_category = "Beverage")  as m
JOIN order_item as odi
  ON m.menu_id = odi.menu_id
JOIN (SELECT * FROM orders WHERE order_date = "2023-11-10") as od
  ON od.order_id = odi.order_id 

ORDER BY  odi.quantity DESC
LIMIT 1 ;

--HW2.3 : Aggregate function
-- Q2 Quantity of each menu sold on 2023-11-10
-- Aggregate function

SELECT
  od.order_date,
  m.menu_name,
  sum(odi.quantity) as sum_quantity

FROM menu  as m
JOIN order_item as odi
  ON m.menu_id = odi.menu_id
JOIN orders as od
  ON od.order_id = odi.order_id 
WHERE od.order_date = "2023-11-10"
Group by 2 ;

--Bonus
--What is 'Alice' purchase?  ? 

SELECT 
  od.order_id,
  od.order_date || "/" || od.order_time AS "Date/Time" ,
  cus.first_name || " " || cus.last_name AS Fullname,
  m.menu_name,
  m.menu_category ,
  m.menu_price ,
  odi.quantity ,
  m.menu_price*odi.quantity AS 'Total Price'

FROM order_item AS odi
JOIN orders AS od
  ON	odi.order_id = od.order_id
JOIN menu AS m
  ON 	m.menu_id = odi.menu_id
JOIN customers as cus
  ON 	cus.customer_id = od.customer_id
WHERE cus.first_name = 'Alice'  
;



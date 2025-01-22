--Assignment: Homework Chapter 5 
--Short Description: Code summary query using MGS tables
--Course: CMSC246
--Student: Silvia Lim Siew Ling
--Professor: Dr. G Grinberg
--Due Date: 30th Sept 2024

------------------------------------------
--#1
/*Description: Write a SELECT statement that returns the count of number of orders
				and the sum of the tax_amount in the Orders table
*/

SELECT COUNT(*) AS number_orders,
        SUM(tax_amount) AS total_tax_amt
FROM orders;

--Output:


NUMBER_ORDERS TOTAL_TAX_AMT
------------- -------------
            9        122.24



------------------------------------------
--#2
/*Description: Write a SELECT statement that returns the category name from the Categories table,
				the count of products in Products table, and the list price of the most expensive product
				in Products table. Sort the result with the most products appear first. 
*/

SELECT c.category_name, COUNT(p.product_id) AS products_count,
        MAX(p.list_price) AS most_expensive_product
FROM categories c 
    JOIN products p
		ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY products_count DESC;

--Output:


CATEGORY_NAME                                                                                                                                                                                                                                                   PRODUCTS_COUNT MOST_EXPENSIVE_PRODUCT
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------- ----------------------
Guitars                                                                                                                                                                                                                                                                      6                   2517
Basses                                                                                                                                                                                                                                                                       2                 799.99
Drums                                                                                                                                                                                                                                                                        2                 799.99


------------------------------------------
--#3
/*Description: Write a SELECT statement that returns a row for each customer that has orders with
				an email address in Customers table, sum of item price in Order_Items multipled by quantity in
				the Order_Items, and sum of the discount amount in Order_Items multiplied by quantity in Order_Items.
				Sort result set in DESC by item price total for each customer.
*/
SELECT c.email_address, SUM(oi.item_price * quantity) AS total_item_price,
        SUM(oi.discount_amount * oi.quantity) AS total_discount
FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
GROUP BY c.email_address
ORDER BY total_item_price DESC;

--Output:

EMAIL_ADDRESS                                                                                                                                                                                                                                                   TOTAL_ITEM_PRICE TOTAL_DISCOUNT
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------- --------------
allan.sherwood@yahoo.com                                                                                                                                                                                                                                                    4131        1830.39
christineb@solarone.com                                                                                                                                                                                                                                                     2398          719.4
frankwilson@sbcglobal.net                                                                                                                                                                                                                                                2198.98          659.7
david.goldstein@hotmail.com                                                                                                                                                                                                                                                  998          209.7
gary_hernandez@yahoo.com                                                                                                                                                                                                                                                  799.99            120
barryz@gmail.com                                                                                                                                                                                                                                                          489.99          186.2
erinv@gmail.com                                                                                                                                                                                                                                                              299              0

7 rows selected. 


------------------------------------------
--#4
/*Description: Write a SELECT statement that returns email_address from Customers table,
				a count of number of orders, and the total amount for each order.
				Return only those rows where customer has more than 1 order.
				Sort the result sete by the sum of the line item amounts in descending order. 
*/

SELECT c.email_address, COUNT(o.order_id) AS number_of_orders, 
    SUM((oi.item_price - oi.discount_amount) * oi.quantity) AS total_amount
FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
HAVING COUNT(o.order_id) > 1
GROUP BY c.email_address
ORDER BY total_amount DESC;

--Output: 


EMAIL_ADDRESS                                                                                                                                                                                                                                                   NUMBER_OF_ORDERS TOTAL_AMOUNT
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------- ------------
allan.sherwood@yahoo.com                                                                                                                                                                                                                                                       3      2300.61
frankwilson@sbcglobal.net                                                                                                                                                                                                                                                      3      1539.28
david.goldstein@hotmail.com                                                                                                                                                                                                                                                    2        788.3


------------------------------------------
--#5
/*Description: Modify question 4 to only count and total line items that have an item_price value
				greater than 400.
*/

SELECT c.email_address, COUNT(o.order_id) AS number_of_orders, 
    SUM((oi.item_price - oi.discount_amount) * oi.quantity) AS total_amount
FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
WHERE oi.item_price > 400
HAVING COUNT(o.order_id) > 1
GROUP BY c.email_address
ORDER BY total_amount DESC;

--Output: 


EMAIL_ADDRESS                                                                                                                                                                                                                                                   NUMBER_OF_ORDERS TOTAL_AMOUNT
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------- ------------
allan.sherwood@yahoo.com                                                                                                                                                                                                                                                       3      2300.61
frankwilson@sbcglobal.net                                                                                                                                                                                                                                                      3      1539.28


------------------------------------------
--#6
/*Description: Write a SELECT statement that shows product name from Products table
				and total amount ordered for each product in the Order_Items table. 
				Use ROLLUP operator to include a row that gives grand total.
*/

SELECT p.product_name, SUM((oi.item_price - discount_amount) * quantity) AS total_ordered
FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
GROUP BY ROLLUP (p.product_name);

--Output:


PRODUCT_NAME                                                                                                                                                                                                                                                    TOTAL_ORDERED
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------
Fender Precision                                                                                                                                                                                                                                                       559.99
Fender Stratocaster                                                                                                                                                                                                                                                     978.6
Gibson Les Paul                                                                                                                                                                                                                                                        2517.9
Gibson SG                                                                                                                                                                                                                                                             1208.16
Ludwig 5-piece Drum Set with Cymbals                                                                                                                                                                                                                                   489.99
Rodriguez Caballero 11                                                                                                                                                                                                                                                 253.15
Tama 5-Piece Drum Set with Cymbals                                                                                                                                                                                                                                     679.99
Washburn D10S                                                                                                                                                                                                                                                             598
Yamaha FG700S                                                                                                                                                                                                                                                          303.79
                                                                                                                                                                                                                                                                      7589.57

10 rows selected. 


------------------------------------------
--#7
/*Description: Write a SELECT statement that return email address from Customers table
				and the count of distinct products from the customer's order. Code should answer
				which customers have ordered more than once product.
*/

SELECT c.email_address, COUNT(DISTINCT oi.product_id) AS total_ordered
FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
HAVING COUNT(DISTINCT oi.product_id) > 1
GROUP BY c.email_address;

--Output:


EMAIL_ADDRESS                                                                                                                                                                                                                                                   TOTAL_ORDERED
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------
david.goldstein@hotmail.com                                                                                                                                                                                                                                                 2
allan.sherwood@yahoo.com                                                                                                                                                                                                                                                    3
frankwilson@sbcglobal.net                                                                                                                                                                                                                                                   3





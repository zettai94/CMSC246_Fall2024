--Assignment: Homework Chapter 6
--Short Description: Using subqueries with MGS tables
--Course: CMSC246
--Student: Silvia Lim Siew Ling
--Professor G Grinberg
--Due Date: 7th Oct 2024

------------------------------------------
--#1
/*Description: Using a subquery in a WHERE clause that uses the IN keyword
				that will return a result set that is same as the following code
				SELECT DISTINCT category_name
				FROM categories c JOIN products p
					ON c.category_id = p.category_id
				ORDER BY category_name
*/

SELECT DISTINCT category_name
FROM categories c
WHERE c.category_id IN (SELECT p.category_id FROM products p)
ORDER BY category_name;

--Output:

CATEGORY_NAME                                                                                                                                                                                                                                                  
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Basses
Drums
Guitars


------------------------------------------
--#2
/*Description: Using subquery, write a SELECT statement that returns product_name and list_price
				where the products have a list price that's greater than the 
				average list price of all products. Sort result by list_price in DESC.
*/

SELECT p.product_name, p.list_price
FROM products p
WHERE p.list_price > (SELECT AVG(list_price)FROM products)
ORDER BY p.list_price DESC;

--Output:

PRODUCT_NAME                                                                                                                                                                                                                                                    LIST_PRICE
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------
Gibson SG                                                                                                                                                                                                                                                             2517
Gibson Les Paul                                                                                                                                                                                                                                                       1199


------------------------------------------
--#3
/*Description: Write a SELECT statement that returns category_name from Categories table.
				Return one row for each category that has never been assigned to any products 
				in the Products table using the NOT EXISTS operator.
*/

SELECT c.category_name
FROM categories c
WHERE NOT EXISTS
    (SELECT *
    FROM products p
    WHERE p.category_id = c.category_id);
	
--Output:


CATEGORY_NAME                                                                                                                                                                                                                                                  
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Keyboards


------------------------------------------
--#4
/*Description: Write a correlated subquery that returns email_address, order_id, and order total for each customer.
				Write a main query that uses the first SELECT statement in its FROM clause and returns customer's email_address
				and largest order for that customer. 
*/

SELECT email_address, MAX(order_total) as largest_order
FROM (
    SELECT c.email_address, o.order_id, SUM(oi.item_price * oi.quantity) AS order_total
    FROM customers c 
        JOIN orders o
            ON c.customer_id = o.customer_id
        JOIN order_items oi
            ON o.order_id = oi.order_id
    GROUP BY c.email_address, o.order_id
    )
GROUP BY email_address;
    
--Output:


EMAIL_ADDRESS                                                                                                                                                                                                                                                   LARGEST_ORDER
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------
david.goldstein@hotmail.com                                                                                                                                                                                                                                               699
gary_hernandez@yahoo.com                                                                                                                                                                                                                                               799.99
barryz@gmail.com                                                                                                                                                                                                                                                       489.99
christineb@solarone.com                                                                                                                                                                                                                                                  2398
erinv@gmail.com                                                                                                                                                                                                                                                           299
allan.sherwood@yahoo.com                                                                                                                                                                                                                                                 2932
frankwilson@sbcglobal.net                                                                                                                                                                                                                                             2198.98

7 rows selected. 


------------------------------------------
--#5
/*Description: Write a SELECT statement that returns the name and discount 
				percent of each product that has a unique discount percent. Don't include
				products that have the same discount percent as another product.
				Sort by product_name column.
*/

SELECT product_name, discount_percent
FROM products p_main
WHERE NOT EXISTS
    (
        SELECT *
        FROM products p_sub
        WHERE p_main.discount_percent = p_sub.discount_percent
            AND p_main.product_name <> p_sub.product_name
    )
ORDER BY product_name;
        
--Output:


PRODUCT_NAME                                                                                                                                                                                                                                                    DISCOUNT_PERCENT
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------------
Gibson SG                                                                                                                                                                                                                                                                     52
Hofner Icon                                                                                                                                                                                                                                                                   25
Rodriguez Caballero 11                                                                                                                                                                                                                                                        39
Tama 5-Piece Drum Set with Cymbals                                                                                                                                                                                                                                            15
Washburn D10S                                                                                                                                                                                                                                                                  0
Yamaha FG700S                                                                                                                                                                                                                                                                 38

6 rows selected. 


------------------------------------------
--#6
/*Description: Use a correlated subquery to return one row per customer, 
				representing the customer's oldest order. Each role should include email_address,
				order_id, and order_date
*/

SELECT c_main.email_address, o_main.order_id, o_main.order_date
FROM customers c_main
    JOIN orders o_main
        ON c_main.customer_id = o_main.customer_id
WHERE o_main.order_date = 
        (SELECT MIN(o_sub.order_date)
        FROM orders o_sub 
        WHERE o_sub.customer_id = c_main.customer_id);
		
--Output:


EMAIL_ADDRESS                                                                                                                                                                                                                                                     ORDER_ID ORDER_DAT
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------- ---------
allan.sherwood@yahoo.com                                                                                                                                                                                                                                                 1 28-MAR-12
barryz@gmail.com                                                                                                                                                                                                                                                         2 28-MAR-12
christineb@solarone.com                                                                                                                                                                                                                                                  4 30-MAR-12
david.goldstein@hotmail.com                                                                                                                                                                                                                                              5 31-MAR-12
erinv@gmail.com                                                                                                                                                                                                                                                          6 31-MAR-12
frankwilson@sbcglobal.net                                                                                                                                                                                                                                                7 01-APR-12
gary_hernandez@yahoo.com                                                                                                                                                                                                                                                 8 02-APR-12

7 rows selected. 


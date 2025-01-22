--Assignment: HW Chapter 4 Exercises
--Short Description: How to retrieve data from two or more tables
--Course: CMSC246
--Student: Silvia Lim Siew Ling
--Professor G Grinberg
--Due Date: 23rd Sept 2024


------------------------------------------------------------
--#1
/*
Description: Write a SELECT statement that joins the Categories table to the Products table
				and returns category_name, product_name, and list_price. Sort result by category_name
					then product_name in ascending sequence.
*/

SELECT category_name, product_name, list_price
FROM categories 
    JOIN products
    ON categories.category_id = products.category_id
ORDER BY category_name, product_name ASC;

--Output:

CATEGORY_NAME                                                                                                                                                                                                                                                   PRODUCT_NAME                                                                                                                                                                                                                                                    LIST_PRICE
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------
Basses                                                                                                                                                                                                                                                          Fender Precision                                                                                                                                                                                                                                                    799.99
Basses                                                                                                                                                                                                                                                          Hofner Icon                                                                                                                                                                                                                                                         499.99
Drums                                                                                                                                                                                                                                                           Ludwig 5-piece Drum Set with Cymbals                                                                                                                                                                                                                                699.99
Drums                                                                                                                                                                                                                                                           Tama 5-Piece Drum Set with Cymbals                                                                                                                                                                                                                                  799.99
Guitars                                                                                                                                                                                                                                                         Fender Stratocaster                                                                                                                                                                                                                                                    699
Guitars                                                                                                                                                                                                                                                         Gibson Les Paul                                                                                                                                                                                                                                                       1199
Guitars                                                                                                                                                                                                                                                         Gibson SG                                                                                                                                                                                                                                                             2517
Guitars                                                                                                                                                                                                                                                         Rodriguez Caballero 11                                                                                                                                                                                                                                                 415
Guitars                                                                                                                                                                                                                                                         Washburn D10S                                                                                                                                                                                                                                                          299
Guitars                                                                                                                                                                                                                                                         Yamaha FG700S                                                                                                                                                                                                                                                       489.99

10 rows selected. 


------------------------------------------------------------
--#2
/*
Description: Write a SELECT statement that joins the Customers table and Addresses table and 
				returns first_name, last_name, line1, city, state, and zip_code. Return one 
				row for customer with an email address of 'allan.sherwood@yahoo.com'.
*/

SELECT first_name, last_name, line1, city, state, zip_code
FROM customers 
    JOIN addresses 
    ON customers.customer_id = addresses.customer_id
WHERE customers.email_address = 'allan.sherwood@yahoo.com';

--Output:

FIRST_NAME                                                   LAST_NAME                                                    LINE1                                                        CITY                                     ST ZIP_CODE  
------------------------------------------------------------ ------------------------------------------------------------ ------------------------------------------------------------ ---------------------------------------- -- ----------
Allan                                                        Sherwood                                                     100 East Ridgewood Ave.                                      Paramus                                  NJ 07652     
Allan                                                        Sherwood                                                     21 Rosewood Rd.                                              Woodcliff Lake                           NJ 07677     


------------------------------------------------------------
--#3
/*
Description: Write a SELECT statement that joins the Customers table and Addresses table and 
				returns first_name, last_name, line1, city, state, and zip_code. Return one
				row for each customer, but only return addresses that are the shipping address for a customer.
*/

SELECT first_name, last_name, line1, city, state, zip_code
FROM customers c 
    JOIN addresses a
    ON c.customer_id = a.customer_id
WHERE a.address_id = c.shipping_address_id;

--Output:

FIRST_NAME                                                   LAST_NAME                                                    LINE1                                                        CITY                                     ST ZIP_CODE  
------------------------------------------------------------ ------------------------------------------------------------ ------------------------------------------------------------ ---------------------------------------- -- ----------
Allan                                                        Sherwood                                                     100 East Ridgewood Ave.                                      Paramus                                  NJ 07652     
Barry                                                        Zimmer                                                       16285 Wendell St.                                            Omaha                                    NE 68135     
Christine                                                    Brown                                                        19270 NW Cornell Rd.                                         Beaverton                                OR 97006     
David                                                        Goldstein                                                    186 Vermont St.                                              San Francisco                            CA 94110     
Erin                                                         Valentino                                                    6982 Palm Ave.                                               Fresno                                   CA 93711     
Frank Lee                                                    Wilson                                                       23 Mountain View St.                                         Denver                                   CO 80208     
Gary                                                         Hernandez                                                    7361 N. 41st St.                                             New York                                 NY 10012     
Heather                                                      Esway                                                        2381 Buena Vista St.                                         Los Angeles                              CA 90023     

8 rows selected. 


------------------------------------------------------------
--#4
/*
Description: Write a SELECT statement that joins Customers, Orders, Order_Items, and Products tables. 
				Return last_name, first_name, order_date, product_name, item_price, discount_amount, and quantity.
				Use aliases for the tables and sort final result set by last_name, order_date, and product_name.
*/

SELECT cust.last_name, cust.first_name, o.order_date,
        pro.product_name, oi.item_price, oi.discount_amount, oi.quantity
FROM customers cust
    JOIN orders o
        ON cust.customer_id = o.customer_id AND
            cust.billing_address_id = o.billing_address_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products pro
        ON oi.product_id = pro.product_id
ORDER BY cust.last_name, o.order_date, pro.product_name;

--Output:


LAST_NAME                                                    FIRST_NAME                                                   ORDER_DAT PRODUCT_NAME                                                                                                                                                                                                                                                    ITEM_PRICE DISCOUNT_AMOUNT   QUANTITY
------------------------------------------------------------ ------------------------------------------------------------ --------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------- --------------- ----------
Brown                                                        Christine                                                    30-MAR-12 Gibson Les Paul                                                                                                                                                                                                                                                       1199           359.7          2
Goldstein                                                    David                                                        31-MAR-12 Washburn D10S                                                                                                                                                                                                                                                          299               0          1
Goldstein                                                    David                                                        03-APR-12 Fender Stratocaster                                                                                                                                                                                                                                                    699           209.7          1
Hernandez                                                    Gary                                                         02-APR-12 Tama 5-Piece Drum Set with Cymbals                                                                                                                                                                                                                                  799.99             120          1
Sherwood                                                     Allan                                                        28-MAR-12 Gibson Les Paul                                                                                                                                                                                                                                                       1199           359.7          1
Sherwood                                                     Allan                                                        29-MAR-12 Gibson SG                                                                                                                                                                                                                                                             2517         1308.84          1
Sherwood                                                     Allan                                                        29-MAR-12 Rodriguez Caballero 11                                                                                                                                                                                                                                                 415          161.85          1
Valentino                                                    Erin                                                         31-MAR-12 Washburn D10S                                                                                                                                                                                                                                                          299               0          1
Wilson                                                       Frank Lee                                                    01-APR-12 Fender Precision                                                                                                                                                                                                                                                    799.99             240          1
Wilson                                                       Frank Lee                                                    01-APR-12 Fender Stratocaster                                                                                                                                                                                                                                                    699           209.7          1
Wilson                                                       Frank Lee                                                    01-APR-12 Ludwig 5-piece Drum Set with Cymbals                                                                                                                                                                                                                                699.99             210          1

LAST_NAME                                                    FIRST_NAME                                                   ORDER_DAT PRODUCT_NAME                                                                                                                                                                                                                                                    ITEM_PRICE DISCOUNT_AMOUNT   QUANTITY
------------------------------------------------------------ ------------------------------------------------------------ --------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------- --------------- ----------
Zimmer                                                       Barry                                                        28-MAR-12 Yamaha FG700S                                                                                                                                                                                                                                                       489.99           186.2          1

12 rows selected. 


------------------------------------------------------------
--#5
/*
Description: Write a SELECT statement that returns the product_name and list_price from the Products table.
				Return one row for each product that has the same list price as another product using self joins
				to check the product_id aren't equal but the list_price are equal.
				Sort the result set by product_name.
*/

SELECT p1.product_name, p1.list_price
FROM products p1
    JOIN products p2
        ON (p1.product_id <> p2.product_id) AND (p1.list_price = p2.list_price)
ORDER BY p1.product_name;

--Output:


PRODUCT_NAME                                                                                                                                                                                                                                                    LIST_PRICE
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------
Fender Precision                                                                                                                                                                                                                                                    799.99
Tama 5-Piece Drum Set with Cymbals                                                                                                                                                                                                                                  799.99


------------------------------------------------------------
--#6
/*
Description: Write a SELECT statement that returns category_name from Categories table and 
				product_id from Products table. Return one row of each category that has never been use,
				where the product_id contains a null value. 
*/

SELECT c.category_name, p.product_id
FROM categories c 
    LEFT JOIN products p
        ON c.category_id = p.category_id
WHERE p.product_id IS NULL;

--Output:


CATEGORY_NAME                                                                                                                                                                                                                                                   PRODUCT_ID
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------
Keyboards                                                                                                                                                                                                                                                                 


------------------------------------------------------------
--#7
/*
Description: Use UNION operator to generate a result set consisting of 3 columns from the Orders table:
				ship_status, orer_id, and order_date. If ship_date contains a value, ship_status should
				be 'SHIPPED', otherwise, it should be 'NOT SHIPPED'. Sort result set by order_date.
*/

    SELECT 'SHIPPED' AS ship_status, order_id, order_date
    FROM orders
    WHERE ship_date IS NOT NULL
UNION
    SELECT 'NOT SHIPPED' AS ship_status, order_id, order_date
    FROM orders
    WHERE ship_date IS NULL
ORDER BY order_date;

--Output:


SHIP_STATUS   ORDER_ID ORDER_DAT
----------- ---------- ---------
SHIPPED              1 28-MAR-12
SHIPPED              2 28-MAR-12
SHIPPED              3 29-MAR-12
SHIPPED              4 30-MAR-12
SHIPPED              5 31-MAR-12
NOT SHIPPED          6 31-MAR-12
SHIPPED              7 01-APR-12
NOT SHIPPED          8 02-APR-12
NOT SHIPPED          9 03-APR-12

9 rows selected. 


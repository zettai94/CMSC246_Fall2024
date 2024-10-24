--Assignment: HW Chapter 3 Exercises
--Short Description: How to retrieve data from a single table
--Course: CMSC246
--Student: Silvia Lim Siew Ling
--Professor G Grinberg
--Due Date: 16th Sept 2024


------------------------------------------------------------
--#1
/*
Description: Write a SELECT statement that returns product_code, product_name, list_price
			and discount_percent in descending order. 
*/

SELECT product_code, product_name, 
    list_price, discount_percent
FROM products
ORDER BY list_price DESC;

--Output:

PRODUCT_CO PRODUCT_NAME                                                                                                                                                                                                                                                    LIST_PRICE DISCOUNT_PERCENT
---------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------- ----------------
sg         Gibson SG                                                                                                                                                                                                                                                             2517               52
les_paul   Gibson Les Paul                                                                                                                                                                                                                                                       1199               30
tama       Tama 5-Piece Drum Set with Cymbals                                                                                                                                                                                                                                  799.99               15
precision  Fender Precision                                                                                                                                                                                                                                                    799.99               30
ludwig     Ludwig 5-piece Drum Set with Cymbals                                                                                                                                                                                                                                699.99               30
strat      Fender Stratocaster                                                                                                                                                                                                                                                    699               30
hofner     Hofner Icon                                                                                                                                                                                                                                                         499.99               25
fg700s     Yamaha FG700S                                                                                                                                                                                                                                                       489.99               38
rodriguez  Rodriguez Caballero 11                                                                                                                                                                                                                                                 415               39
washburn   Washburn D10S                                                                                                                                                                                                                                                          299                0

10 rows selected. 


------------------------------------------------------------
--#2
/*
Description: Write a SELECT statement that returns one column from the Customer table named
			full_name that joins the last_name and first_name with a comma and a space.
			Sort the result set by last name in ascending sequence and return only customers whose
			name begins with letters from M to Z
*/

SELECT last_name ||', '|| first_name AS full_name
FROM customers
WHERE last_name >= 'M'
ORDER BY last_name ASC;

--Output:

FULL_NAME                                                                                                                 
--------------------------------------------------------------------------------------------------------------------------
Sherwood, Allan
Valentino, Erin
Wilson, Frank Lee
Zimmer, Barry


------------------------------------------------------------
--#3
/*
Description: Write a SELECT statement that returns product_name, list_price, and date_added	
			from Products table. Only return the rows with list_price that is greater than 500
			and less than 2000. Result set should be in descending sequence by the date_added column.
*/
SELECT product_name, list_price, date_added
FROM products
WHERE list_price > 500 AND list_price < 2000
ORDER BY date_added DESC;

--Output:

PRODUCT_NAME                                                                                                                                                                                                                                                    LIST_PRICE DATE_ADDE
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------- ---------
Tama 5-Piece Drum Set with Cymbals                                                                                                                                                                                                                                  799.99 30-JUL-12
Ludwig 5-piece Drum Set with Cymbals                                                                                                                                                                                                                                699.99 30-JUL-12
Fender Precision                                                                                                                                                                                                                                                    799.99 01-JUN-12
Gibson Les Paul                                                                                                                                                                                                                                                       1199 05-DEC-11
Fender Stratocaster                                                                                                                                                                                                                                                    699 30-OCT-11


------------------------------------------------------------
--#4
/*
Description: Write a SELECT statement that returns product_name, list_price, discount_percent,
			discount_amount, and discount_price. Calculate discount_amount and discount_price accordingly.
			Use ROWNUM to show only the first 5 rows and sort the result set by discount_price in descending order.
*/
SELECT product_name, list_price, discount_percent, 
        (list_price * discount_percent / 100) discount_amount, 
        (list_price - (list_price * discount_percent / 100)) discount_price
FROM products
WHERE ROWNUM <= 5
ORDER BY discount_price DESC;

--Output:


PRODUCT_NAME                                                                                                                                                                                                                                                    LIST_PRICE DISCOUNT_PERCENT DISCOUNT_AMOUNT DISCOUNT_PRICE
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------- ---------------- --------------- --------------
Gibson SG                                                                                                                                                                                                                                                             2517               52         1308.84        1208.16
Gibson Les Paul                                                                                                                                                                                                                                                       1199               30           359.7          839.3
Fender Stratocaster                                                                                                                                                                                                                                                    699               30           209.7          489.3
Yamaha FG700S                                                                                                                                                                                                                                                       489.99               38        186.1962       303.7938
Washburn D10S                                                                                                                                                                                                                                                          299                0               0            299


------------------------------------------------------------
--#5
/*
Description: Write a SELECT statement that returns item_id, item_price, discount_amount, quantity, price_total,
			discount_total, and item_total. Calculate price_total, discount_total, and item_total accordingly.
			Only return rows where item_total is greater than 500 and in a descending order. 
*/
SELECT item_id, item_price, discount_amount, 
        quantity, (item_price * quantity) price_total,
        (discount_amount * quantity) discount_total,
        ((item_price - discount_amount) * quantity) item_total
FROM order_items
WHERE ((item_price - discount_amount) * quantity) > 500
ORDER BY item_total DESC;

--Output:


   ITEM_ID ITEM_PRICE DISCOUNT_AMOUNT   QUANTITY PRICE_TOTAL DISCOUNT_TOTAL ITEM_TOTAL
---------- ---------- --------------- ---------- ----------- -------------- ----------
         5       1199           359.7          2        2398          719.4     1678.6
         3       2517         1308.84          1        2517        1308.84    1208.16
         1       1199           359.7          1        1199          359.7      839.3
        11     799.99             120          1      799.99            120     679.99
         9     799.99             240          1      799.99            240     559.99


------------------------------------------------------------
--#6
/*
Description: Write a SELECT statement that returns order_id, order_date, and ship_date. Return only the rows
				where the ship_date column contains a null value. 
*/
SELECT order_id, order_date, ship_date
FROM orders
WHERE ship_date IS NULL;

--Output:


  ORDER_ID ORDER_DAT SHIP_DATE
---------- --------- ---------
         6 31-MAR-12          
         8 02-APR-12          
         9 03-APR-12          


------------------------------------------------------------
--#7
/*
Description: Write SELECT statement that uses the SYSDATE function to create a row with today_unformatted
				and today_formatted (MM-DD-YYY) with a Dual table.
*/
SELECT SYSDATE AS today_unformatted, 
        TO_CHAR(SYSDATE, 'MM/DD/YYY') AS today_formatted
FROM Dual;

--Output:

TODAY_UNF TODAY_FOR
--------- ---------
13-SEP-24 09/13/024


------------------------------------------------------------
--#8
/*
Description: Write a SELECT statement that creates a row with price (100), tax_rate (0.07),
				tax_amount, and total with a Dual table.
*/
SELECT 100 AS price,
    0.07 AS tax_rate, (100 * 0.07) AS tax_amount,
    ((100*0.07) + 100) AS total
FROM Dual;

--Output:

     PRICE   TAX_RATE TAX_AMOUNT      TOTAL
---------- ---------- ---------- ----------
       100        .07          7        107


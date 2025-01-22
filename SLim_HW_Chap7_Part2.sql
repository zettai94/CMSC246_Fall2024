--Assignment: HW Chapter 7 Exercises Part 2
--Short Description: How to INSERT, UPDATE, DELETE data
--Course: CMSC246
--Student: Silvia Lim Siew Ling
--Professor G Grinberg
--Due Date: 14th Oct 2024


------------------------------------------------------------
--#1
/*
Description: Write an INSERT statement that adds a row into Categories;
				category_id : 5 and category_name : 'Brass'. Use SELECT statement 
				to verify the changes. 
*/

SELECT category_id, category_name
FROM categories
WHERE category_id = 5 AND category_name = 'Brass';

INSERT INTO categories (category_id, category_name)
VALUES (5, 'Brass');

SELECT category_id, category_name
FROM categories
WHERE category_id = 5 AND category_name = 'Brass';

--Output:

no rows selected

1 row inserted.


CATEGORY_ID CATEGORY_NAME                                                                                                                                                                                                                                                  
----------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          5 Brass                                                                                                                                                                                                                                                          


------------------------------------------------------------
--#2
/*
Description: Modify the previous row added and change the category_name
				to "woodwinds". Identify with category_id and verify the changes.
*/

SELECT category_id, category_name
FROM categories
WHERE category_id = 5 AND category_name = 'Brass';

UPDATE categories
SET category_name = 'Woodwinds'
WHERE category_id = 5;

SELECT category_id, category_name
FROM categories
WHERE category_id = 5 AND category_name = 'Brass';

SELECT category_id, category_name
FROM categories
WHERE category_id = 5 AND category_name = 'Woodwinds';

--Output:


CATEGORY_ID CATEGORY_NAME                                                                                                                                                                                                                                                  
----------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          5 Brass                                                                                                                                                                                                                                                          


1 row updated.

no rows selected

CATEGORY_ID CATEGORY_NAME                                                                                                                                                                                                                                                  
----------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          5 Woodwinds                                                                                                                                                                                                                                                      


------------------------------------------------------------
--#3
/*
Description: Delete the row added in #1. Use category_id to identify the row and verify the changes.
*/

SELECT category_id, category_name
FROM categories
WHERE category_id = 5;

DELETE FROM categories
WHERE category_id = 5;

SELECT category_id, category_name
FROM categories
WHERE category_id = 5;

--Output:


CATEGORY_ID CATEGORY_NAME                                                                                                                                                                                                                                                  
----------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          5 Woodwinds                                                                                                                                                                                                                                                      


1 row deleted.

no rows selected


------------------------------------------------------------
--#4
/*
Description: Write an INSERT statement that adds a row into Products table
				with the information given in the instruction. Write appropriate SELECT
				statement to verify the changes. 
*/

SELECT *
FROM products
WHERE product_id = 11;

INSERT INTO products p (product_id, category_id, product_code,
    product_name, description, list_price, discount_percent, date_added)
VALUES (11, 4, 'dgz_640', 'Yamaha DGX 640 88-Key Digital Piano', 'Long description to come.',
        799.99, DEFAULT, SYSDATE);

SELECT *
FROM products
WHERE product_id = 11;

--Output:

no rows selected

1 row inserted.


PRODUCT_ID CATEGORY_ID PRODUCT_CO PRODUCT_NAME
---------- ----------- ---------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
LIST_PRICE DISCOUNT_PERCENT DATE_ADDE
---------- ---------------- ---------
        11           4 dgz_640    Yamaha DGX 640 88-Key Digital Piano                                                                                                                                                                                                                             
Long description to come.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    799.99                0 12-OCT-24


------------------------------------------------------------
--#5
/*
Description: Write an UPDATE statement that modifies #4 by changing discount_percent to 35%.
				Verify using SELECT statement. 
*/
SELECT product_id, discount_percent
FROM products
WHERE product_id = 11;

UPDATE products
SET discount_percent = 35
WHERE product_id = 11;

SELECT product_id, discount_percent
FROM products
WHERE product_id = 11;

--Output:


PRODUCT_ID DISCOUNT_PERCENT
---------- ----------------
        11                0


1 row updated.


PRODUCT_ID DISCOUNT_PERCENT
---------- ----------------
        11               35


------------------------------------------------------------
--#6
/*
Description: DELETE category_id 4 from Categories by deleting it from 
				Products first. Then run appropriate statement to verify the changes.
*/

SELECT *
FROM categories
WHERE category_id = 4;

DELETE FROM products
WHERE category_id = 4;

DELETE FROM categories
WHERE category_id = 4;

SELECT *
FROM categories
WHERE category_id = 4;

--Output:


CATEGORY_ID CATEGORY_NAME                                                                                                                                                                                                                                                  
----------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          4 Keyboards                                                                                                                                                                                                                                                      


1 row deleted.


1 row deleted.

no rows selected


------------------------------------------------------------
--#7
/*
Description: INSERT a row into Customers with the appropriate information on instruction.
				Verify accordingly with SELECT statement. 
*/

SELECT * 
FROM customers
WHERE customer_id = 9;

INSERT INTO customers
VALUES (9, 'rick@raven.com', 'sesame', 'Rick', 'Raven', DEFAULT, DEFAULT);

SELECT * 
FROM customers
WHERE customer_id = 9;

--Output:

no rows selected

1 row inserted.


CUSTOMER_ID EMAIL_ADDRESS                                                                                                                                                                                                                                                   PASSWORD                                                     FIRST_NAME                                                   LAST_NAME                                                    SHIPPING_ADDRESS_ID BILLING_ADDRESS_ID
----------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------------------------------------------------------------ ------------------------------------------------------------ ------------------------------------------------------------ ------------------- ------------------
          9 rick@raven.com                                                                                                                                                                                                                                                  sesame                                                       Rick                                                         Raven                                                                                              


------------------------------------------------------------
--#8
/*
Description: UPDATE password from #7 to 'secret'. Verify accordingly. 
*/

SELECT * 
FROM customers
WHERE customer_id = 9;

UPDATE customers
SET password = 'secret'
WHERE email_address = 'rick@raven.com';

SELECT * 
FROM customers
WHERE customer_id = 9;

--Output:


CUSTOMER_ID EMAIL_ADDRESS                                                                                                                                                                                                                                                   PASSWORD                                                     FIRST_NAME                                                   LAST_NAME                                                    SHIPPING_ADDRESS_ID BILLING_ADDRESS_ID
----------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------------------------------------------------------------ ------------------------------------------------------------ ------------------------------------------------------------ ------------------- ------------------
          9 rick@raven.com                                                                                                                                                                                                                                                  sesame                                                       Rick                                                         Raven                                                                                              


1 row updated.


CUSTOMER_ID EMAIL_ADDRESS                                                                                                                                                                                                                                                   PASSWORD                                                     FIRST_NAME                                                   LAST_NAME                                                    SHIPPING_ADDRESS_ID BILLING_ADDRESS_ID
----------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------------------------------------------------------------ ------------------------------------------------------------ ------------------------------------------------------------ ------------------- ------------------
          9 rick@raven.com                                                                                                                                                                                                                                                  secret                                                       Rick                                                         Raven                                                                                              


------------------------------------------------------------
--#9
/*
Description: UPDATE password to 'reset' for every customer in Customers table. 
*/
SELECT customer_id, email_address, password
FROM customers;

UPDATE customers
SET password = 'reset';

SELECT customer_id, email_address, password
FROM customers;

--Output:


CUSTOMER_ID EMAIL_ADDRESS                                                                                                                                                                                                                                                   PASSWORD                                                    
----------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------------------------------------------------------------
          1 allan.sherwood@yahoo.com                                                                                                                                                                                                                                        650215acec746f0e32bdfff387439eefc1358737                    
          2 barryz@gmail.com                                                                                                                                                                                                                                                3f563468d42a448cb1e56924529f6e7bbe529cc7                    
          3 christineb@solarone.com                                                                                                                                                                                                                                         ed19f5c0833094026a2f1e9e6f08a35d26037066                    
          4 david.goldstein@hotmail.com                                                                                                                                                                                                                                     b444ac06613fc8d63795be9ad0beaf55011936ac                    
          5 erinv@gmail.com                                                                                                                                                                                                                                                 109f4b3c50d7b0df729d299bc6f8e9ef9066971f                    
          6 frankwilson@sbcglobal.net                                                                                                                                                                                                                                       3ebfa301dc59196f18593c45e519287a23297589                    
          7 gary_hernandez@yahoo.com                                                                                                                                                                                                                                        1ff2b3704aede04eecb51e50ca698efd50a1379b                    
          8 heatheresway@mac.com                                                                                                                                                                                                                                            911ddc3b8f9a13b5499b6bc4638a2b4f3f68bf23                    
          9 rick@raven.com                                                                                                                                                                                                                                                  secret                                                      

9 rows selected. 


9 rows updated.


CUSTOMER_ID EMAIL_ADDRESS                                                                                                                                                                                                                                                   PASSWORD                                                    
----------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------------------------------------------------------------
          1 allan.sherwood@yahoo.com                                                                                                                                                                                                                                        reset                                                       
          2 barryz@gmail.com                                                                                                                                                                                                                                                reset                                                       
          3 christineb@solarone.com                                                                                                                                                                                                                                         reset                                                       
          4 david.goldstein@hotmail.com                                                                                                                                                                                                                                     reset                                                       
          5 erinv@gmail.com                                                                                                                                                                                                                                                 reset                                                       
          6 frankwilson@sbcglobal.net                                                                                                                                                                                                                                       reset                                                       
          7 gary_hernandez@yahoo.com                                                                                                                                                                                                                                        reset                                                       
          8 heatheresway@mac.com                                                                                                                                                                                                                                            reset                                                       
          9 rick@raven.com                                                                                                                                                                                                                                                  reset                                                       

9 rows selected. 


------------------------------------------------------------
--#10
/*
Description: Restore data with create_mgs_table.sql. 
*/
--Output:

PL/SQL procedure successfully completed.


Table CATEGORIES created.


Table PRODUCTS created.


Table CUSTOMERS created.


Table ADDRESSES created.


Table ORDERS created.


Table ORDER_ITEMS created.


Table ADMINISTRATORS created.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


Sequence CATEGORY_ID_SEQ created.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


Sequence PRODUCT_ID_SEQ created.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


Sequence CUSTOMER_ID_SEQ created.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


Sequence ADDRESS_ID_SEQ created.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


Sequence ORDER_ID_SEQ created.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


Sequence ITEM_ID_SEQ created.


1 row inserted.


1 row inserted.


1 row inserted.


Sequence ADMIN_ID_SEQ created.


Commit complete.


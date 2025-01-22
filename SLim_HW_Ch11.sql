--Assignment: HW Chapter 11
--Short Description: How to create views on MGS schema
--Course: CMSC246
--Student: Silvia Lim Siew Ling
--Professor G Grinberg
--Due Date: 25th Nov 2024

------------------------------------------------------------
--#1
/*
Description: Create a view named customer_addresses showing shipping and billing addresses for each customer.
			View should be sorted by last_name and first_name.
*/

CREATE OR REPLACE VIEW customer_addresses AS
    SELECT c.customer_id, c.email_address, c.last_name, c.first_name,
            ba.line1 AS bill_line1, ba.line2 AS bill_line2, ba.city AS bill_city, ba.state AS bill_state, ba.zip_code AS bill_zip,
            sa.line1 AS ship_line1, sa.line2 AS ship_line2, sa.city AS ship_city, sa.state AS ship_state, sa.zip_code AS ship_zip
    FROM customers c
        JOIN addresses ba
            ON c.billing_address_id = ba.address_id
        JOIN addresses sa
            ON c.shipping_address_id = sa.address_id
    ORDER BY c.last_name, c.first_name;

--Output:


View CUSTOMER_ADDRESSES created.

------------------------------------------------------------
--#2
/*
Description: Write a SELECT statement that returns customer_id, last_name, first_name, bill_line1
*/

SELECT customer_id, last_name, first_name, bill_line1
FROM customer_addresses;

--Output:


CUSTOMER_ID LAST_NAME                                                    FIRST_NAME                                                   BILL_LINE1                                                  
----------- ------------------------------------------------------------ ------------------------------------------------------------ ------------------------------------------------------------
          3 Brown                                                        Christine                                                    19270 NW Cornell Rd.                                        
          8 Esway                                                        Heather                                                      291 W. Hollywood Blvd.                                      
          4 Goldstein                                                    David                                                        1374 46th Ave.                                              
          7 Hernandez                                                    Gary                                                         3829 Broadway Ave.                                          
          1 Sherwood                                                     Allan                                                        21 Rosewood Rd.                                             
          5 Valentino                                                    Erin                                                         6982 Palm Ave.                                              
          6 Wilson                                                       Frank Lee                                                    23 Mountain View St.                                        
          2 Zimmer                                                       Barry                                                        16285 Wendell St.                                           

8 rows selected. 

------------------------------------------------------------
--#3
/*
Description: Create a view named order_item_products that return columns form Orders, 
			Order_items, and Products table. This view should return order_id, order_date, tax_amount, ship_date,
			item_price, discount_amount, final_price, quantity, item_total, and product_name
*/

CREATE OR REPLACE VIEW order_item_products AS
    SELECT o.order_id, o.order_date, o.tax_amount, o.ship_date,
            oi.item_price, oi.discount_amount, (oi.item_price - oi.discount_amount) AS final_price,
            oi.quantity, ((oi.item_price - oi.discount_amount) * oi.quantity) AS item_total,
            p.product_name
    FROM orders o
        JOIN order_items oi
            ON o.order_id = oi.order_id
        JOIN products p
            ON oi.product_id = p.product_id;
			
--Output:


View ORDER_ITEM_PRODUCTS created.

------------------------------------------------------------
--#4
/*
Description: Create a view named product_summary using the view created in #3.
			This view return summary information about each product, which includes product_name, order_count,
			and order_total.
*/

CREATE OR REPLACE VIEW product_summary AS
    SELECT product_name, COUNT(product_name) AS order_count,
            SUM(item_total) AS order_total
    FROM order_item_products
    GROUP BY product_name;
	
--Output:


View PRODUCT_SUMMARY created.


------------------------------------------------------------
--#5
/*
Description: Write a SELECT statement that uses the view created in #4 to get the total sales for
			the five best selling products.
*/

SELECT *
FROM (SELECT * FROM product_summary
        ORDER BY order_count DESC)
WHERE ROWNUM <=5;

--Output:


PRODUCT_NAME                                                                                                                                                                                                                                                    ORDER_COUNT ORDER_TOTAL
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------- -----------
Washburn D10S                                                                                                                                                                                                                                                             2         598
Gibson Les Paul                                                                                                                                                                                                                                                           2      2517.9
Fender Stratocaster                                                                                                                                                                                                                                                       2       978.6
Fender Precision                                                                                                                                                                                                                                                          1      559.99
Tama 5-Piece Drum Set with Cymbals                                                                                                                                                                                                                                        1      679.99



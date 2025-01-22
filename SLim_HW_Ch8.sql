--Assignment: HW Chapter 8 Exercises
--Short Description: How to work with data types and functions
--Course: CMSC246
--Student: Silvia Lim Siew Ling
--Professor G Grinberg
--Due Date: 28th Oct 2024


------------------------------------------------------------
--#1
/*
Description: Write a SELECT statement that returns list_price and a 
			column that uses TO_CHAR function to return list_price with	
			currency formatting from Products table.
*/

SELECT list_price, TO_CHAR(list_price, 'C99999.99') AS currency_format
FROM products;

--Output:

LIST_PRICE CURRENCY_FORMAT 
---------- ----------------
       699        USD699.00
      1199       USD1199.00
      2517       USD2517.00
    489.99        USD489.99
       299        USD299.00
       415        USD415.00
    799.99        USD799.99
    499.99        USD499.99
    699.99        USD699.99
    799.99        USD799.99

10 rows selected. 


------------------------------------------------------------
--#2
/*
Description: Write a SELECT statement that returns date_added
			and a column that uses CAST function to return date_added
			column as the VARCHAR2 data type with 9 characters from Products table.
*/

SELECT date_added, CAST(date_added AS VARCHAR2(9)) AS varchar_date
FROM products;

--Output:


DATE_ADDE VARCHAR_D
--------- ---------
30-OCT-11 30-OCT-11
05-DEC-11 05-DEC-11
04-FEB-12 04-FEB-12
01-JUN-12 01-JUN-12
30-JUL-12 30-JUL-12
30-JUL-12 30-JUL-12
01-JUN-12 01-JUN-12
30-JUL-12 30-JUL-12
30-JUL-12 30-JUL-12
30-JUL-12 30-JUL-12

10 rows selected. 


------------------------------------------------------------
--#3
/*
Description: Write a SELECT statement that returns list_price, discount_percent
			and a column name discount_amount that uses the prev two columns to calculate
			discount amount and uses ROUND function to round the result so it has 2 decimal digits.
*/

SELECT list_price, discount_percent, 
   ROUND((list_price * discount_percent / 100), 2)  AS discount_amount
FROM products;

--Output:

LIST_PRICE DISCOUNT_PERCENT DISCOUNT_AMOUNT
---------- ---------------- ---------------
       699               30           209.7
      1199               30           359.7
      2517               52         1308.84
    489.99               38           186.2
       299                0               0
       415               39          161.85
    799.99               30             240
    499.99               25             125
    699.99               30             210
    799.99               15             120

10 rows selected. 


------------------------------------------------------------
--#4
/*
Description: Write a SELECT statement that returns order_date, TO_CHAR of order_date 
			that returns four digit year, TO_CHAR of order_date in formate MON-DD-YYY,
			TO_CHAR of order_date with only hours and minutes on 12-hour clock with am/pm
			indicator, and TO_CHAR of order_date with format MM/DD/YY and uses 2 digit-hours
			and minutes on a 24-hour clock. Use leading zeroes for all date/time component.
*/

SELECT order_date, TO_CHAR(order_date, 'YYYY') AS year,
        TO_CHAR(order_date, 'MON-DD-YYYY') AS mm_dd_yyyy,
        TO_CHAR(order_date, 'HH:MI AM') AS time_in_12hr,
        TO_CHAR(order_date, 'MM/DD/YY HH24:MI') AS date_time_in_24h
FROM orders;

--Output:


ORDER_DAT YEAR MM_DD_YYYY           TIME_IN_ DATE_TIME_IN_2
--------- ---- -------------------- -------- --------------
28-MAR-12 2012 MAR-28-2012          09:40 AM 03/28/12 09:40
28-MAR-12 2012 MAR-28-2012          11:23 AM 03/28/12 11:23
29-MAR-12 2012 MAR-29-2012          09:44 AM 03/29/12 09:44
30-MAR-12 2012 MAR-30-2012          03:22 PM 03/30/12 15:22
31-MAR-12 2012 MAR-31-2012          05:43 AM 03/31/12 05:43
31-MAR-12 2012 MAR-31-2012          06:37 PM 03/31/12 18:37
01-APR-12 2012 APR-01-2012          11:11 PM 04/01/12 23:11
02-APR-12 2012 APR-02-2012          11:26 AM 04/02/12 11:26
03-APR-12 2012 APR-03-2012          12:22 PM 04/03/12 12:22

9 rows selected. 


------------------------------------------------------------
--#5
/*
Description: Write a SELECT statement that returns card_number, length of card_number,
			last four digits of the card_number, and a column that displays the last 4 
			digits of card_number in format: XXXX-XXXX-XXXX-1234, with the first 12 digits
			of the card number and actual numbers for the last four digits of the number. 
*/

SELECT DISTINCT card_number, LENGTH(TRIM(card_number)) AS length,
    LPAD(SUBSTR(TO_CHAR(TRIM(card_number)), -4), 10) AS last_4_digits,
    LPAD(SUBSTR(TO_CHAR(LPAD(TRIM(card_number), MAX(LENGTH(card_number)), 0)), 13), 19, 'XXXX-') AS formatted_number
FROM orders
GROUP BY card_number;

--Output:


CARD_NUMBER          LENGTH LAST_4_DIG FORMATTED_NUMBER   
---------------- ---------- ---------- -------------------
4111111111111111         16       1111 XXXX-XXXX-XXXX-1111
4012888888881881         16       1881 XXXX-XXXX-XXXX-1881
6011111111111117         16       1117 XXXX-XXXX-XXXX-1117
5555555555554444         16       4444 XXXX-XXXX-XXXX-4444
378282246310005          15       0005 XXXX-XXXX-XXXX-0005


------------------------------------------------------------
--#6
/*
Description: Write a SELECT statement that returns order_id, order_date,
			approc_ship_date that's calculated by adding 2 days to the order_date column,
			ship_date, days_to_ship that shows the number of days between the order date and ship date.
			Finally, add a where clause that retrieve jusst the orders for march 2012. 
*/

SELECT order_id, order_date,
        (order_date + 2) AS approx_ship_date, 
        ship_date, TRUNC(ship_date) - TRUNC(order_date) AS days_to_ship
FROM orders
WHERE TO_CHAR(order_date, 'MM-YYYY') = '03-2012';

--Output:

  ORDER_ID ORDER_DAT APPROX_SH SHIP_DATE DAYS_TO_SHIP
---------- --------- --------- --------- ------------
         1 28-MAR-12 30-MAR-12 30-MAR-12            2
         2 28-MAR-12 30-MAR-12 29-MAR-12            1
         3 29-MAR-12 31-MAR-12 31-MAR-12            2
         4 30-MAR-12 01-APR-12 03-APR-12            4
         5 31-MAR-12 02-APR-12 02-APR-12            2
         6 31-MAR-12 02-APR-12                       

6 rows selected. 


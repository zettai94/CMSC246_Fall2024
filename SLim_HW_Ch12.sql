--Assignment: HW Chapter 12 Exercises
--Short Description: How to manage database security
--Course: CMSC246
--Student: Silvia Lim Siew Ling
--Professor G Grinberg
--Due Date: 9th Dec 2024

------------------------------------------------------------
--#1
/*
Description: Write script that creates a username and password of your choosing
*/

CONNECT system/system;

CREATE USER silvia IDENTIFIED BY potato
DEFAULT TABLESPACE users;

------------------------------------------------------------
--#2
/*
Description: Grant the user you created in #1 SELECT, INSERT, UPDATE, and DELETE privileges 
			for the Customers, Addresses, Orders, and Order_Items tables for of the mgs database.
			However, this user should only have SELECT privileges for the Products and Categories tables.
			Grant CREATE SESSION privilege to the user. Also this user should not have the right to grant privileges 
			to other users.
*/

CONNECT system/system;

GRANT SELECT, INSERT, UPDATE, DELETE ON mgs.Customers TO silvia;
GRANT SELECT, INSERT, UPDATE, DELETE ON mgs.Addresses TO silvia;
GRANT SELECT, INSERT, UPDATE, DELETE ON mgs.Orders TO silvia;
GRANT SELECT, INSERT, UPDATE, DELETE ON mgs.Order_Items TO silvia;
GRANT SELECT ON mgs.Products TO silvia;
GRANT SELECT ON mgs.Categories TO silvia;
GRANT CREATE SESSION TO silvia;
--no [with admin option]; so that no right to grant privileges to other users. 


------------------------------------------------------------
--#3
/*
Description: Write a script that views the privileges for the user you created in #1
*/

--connect to see privileges
CONNECT silvia/potato;

SELECT *
FROM user_tab_privs;

------------------------------------------------------------
--#4
/*
Description: Write a script that revokes the DELETE privilege on the Orders and Order_Items table 
			from the user created in #1. Write a script that views the updated privileges for the user.
*/

CONNECT system/system;

REVOKE DELETE ON mgs.Orders FROM silvia;
REVOKE DELETE ON mgs.Order_Items FROM silvia;

CONNECT silvia/potato;
SELECT *
FROM user_tab_privs;

------------------------------------------------------------
--#5
/*
Description: Write a DELETE statement that attempts to delete one of the rows in the Products table.
*/

CONNECT silvia/potato;

--Since DELETE privilege is not granted, I assume this will fail.
DELETE FROM mgs.Products
WHERE product_id = 1;

------------------------------------------------------------
--#6
/*
Description: Write a script that creates a database role named payment_entry in the mgs schema.
			This new role should have SELECT and UPDATE privileges for Products table,
			SELECT and UPDATE privileges for the Orders table,
			SELECT, UPDATE and INSERT privileges for Order_Items table. 
			This role should also have the right to create a session.
*/

CONNECT system/system;

CREATE ROLE payment_entry;
GRANT SELECT, UPDATE ON mgs.Products TO payment_entry;
GRANT SELECT, UPDATE ON mgs.Orders TO payment_entry;
GRANT SELECT, UPDATE, INSERT ON mgs.Order_Items TO payment_entry;
GRANT CREATE SESSION TO payment_entry;


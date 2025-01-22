--Assignment: HW Chapter 10 Exercises Part 2
--Short Description: How to create table, sequences, and indexes
--Course: CMSC246
--Student: Silvia Lim Siew Ling
--Professor G Grinberg
--Due Date: 18th Nov 2024

------------------------------------------------------------
--#1
/*
Description: Write a script that adds an index to order_date column in the Orders table in mgs schema.
*/

CREATE INDEX order_date_ix
ON orders(order_date);

--Output: 


Index ORDER_DATE_IX created.

------------------------------------------------------------
--#2
/*
Description: Write a script that implements Users, Downloads, and Products tables according to the instructions
			given in Ex schema. user_id and product_id are foreign keys in Downloads.
			Create the sequences for user_id, download_id, and product_id columns.
			Include PL/SQL script to drop tables or sequence if it already exists.
			Include any indexes that's necessary.
*/

--drop table or sequence if it already exists with PL/SQL
BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE user_id_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE product_id_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE download_id_seq';
    
    EXECUTE IMMEDIATE 'DROP TABLE downloads';
    EXECUTE IMMEDIATE 'DROP TABLE users';
    EXECUTE IMMEDIATE 'DROP TABLE products';
    
    EXECUTE IMMEDIATE 'DROP INDEX users_downloads_ix';
    EXECUTE IMMEDIATE 'DROP INDEX products_downloads_ix';
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('');
END;
/

CREATE TABLE users
(
    user_id         NUMBER,
    email_address   VARCHAR2(50)        NOT NULL,
    first_name      VARCHAR2(50)        NOT NULL,
    last_name       VARCHAR2(50)        NOT NULL,
    CONSTRAINT users_pk
        PRIMARY KEY(user_id)
);

CREATE TABLE products
(
    product_id      NUMBER,
    product_name    VARCHAR2(100)       NOT NULL,
    CONSTRAINT products_pk
        PRIMARY KEY(product_id)
);

CREATE TABLE downloads
(
    download_id     NUMBER              NOT NULL,
    user_id         NUMBER              NOT NULL,
    download_date   DATE                NOT NULL,
    filename        VARCHAR2(50)        NOT NULL,
    product_id      NUMBER              NOT NULL,
    CONSTRAINT downloads_pk
        PRIMARY KEY(download_id),
    CONSTRAINT downloads_fk_users
        FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE,
    CONSTRAINT downloads_fk_products
        FOREIGN KEY (product_id) REFERENCES products(product_id)
        ON DELETE CASCADE
);

CREATE SEQUENCE user_id_seq;
CREATE SEQUENCE product_id_seq;
CREATE SEQUENCE download_id_seq;

CREATE INDEX users_downloads_ix ON downloads (user_id);
CREATE INDEX products_downloads_ix ON downloads (product_id);


--Output: 

PL/SQL procedure successfully completed.


Table USERS created.


Table PRODUCTS created.


Table DOWNLOADS created.


Sequence USER_ID_SEQ created.


Sequence PRODUCT_ID_SEQ created.


Sequence DOWNLOAD_ID_SEQ created.


Index USERS_DOWNLOADS_IX created.


Index PRODUCTS_DOWNLOADS_IX created.

------------------------------------------------------------
--#3
/*
Description: Write a script that adds tp database created in #2.
			Add 2 rows to users and products tables. Then add 3 rows to downloads according to the
			instructions given. Write a statement that shows the data inserted with a decending order for email_address
			address and an ascending order for product_name.
*/

INSERT INTO users
VALUES (user_id_seq.NEXTVAL, 'johnsmith@gmail.com', 'John', 'Smith');

INSERT INTO users
VALUES (user_id_seq.NEXTVAL, 'janedoe@gmail.com', 'Jane', 'Doe');

INSERT INTO products
VALUES (product_id_seq.NEXTVAL, 'Local Music Vol 2');

INSERT INTO products
VALUES (product_id_seq.NEXTVAL, 'Local Music Vol 1');

INSERT INTO downloads
VALUES (download_id_seq.NEXTVAL, 1, SYSDATE, 'pedals_are_falling.mp3', 2);

INSERT INTO downloads
VALUES (download_id_seq.NEXTVAL, 2, SYSDATE, 'one_horse_town.mp3', 1);

INSERT INTO downloads
VALUES (download_id_seq.NEXTVAL, 2, SYSDATE, 'turn_signal.mp3', 2);

SELECT u.email_address, u.first_name, u.last_name, d.download_date, d.filename,
        p.product_name
FROM downloads d 
    JOIN users u
        ON d.user_id = u.user_id
    JOIN products p
        ON d.product_id = p.product_id
ORDER BY u.email_address DESC, p.product_name ASC;
    


--Output:

1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


EMAIL_ADDRESS                                      FIRST_NAME                                         LAST_NAME                                          DOWNLOAD_ FILENAME                                           PRODUCT_NAME                                                                                        
-------------------------------------------------- -------------------------------------------------- -------------------------------------------------- --------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
johnsmith@gmail.com                                John                                               Smith                                              16-NOV-24 pedals_are_falling.mp3                             Local Music Vol 1                                                                                   
janedoe@gmail.com                                  Jane                                               Doe                                                16-NOV-24 turn_signal.mp3                                    Local Music Vol 1                                                                                   
janedoe@gmail.com                                  Jane                                               Doe                                                16-NOV-24 one_horse_town.mp3                                 Local Music Vol 2                                                                                   


------------------------------------------------------------
--#4
/*
Description: Write an ALTER TABLE statement that adds two new columns to the product Table
			created in #2. Add one column of product price that provides for three digit to the left of decimal
			point and two to the right. This column should have a default value of 9.99.
			Add one column for the date and time the product was added to the database. 
*/

ALTER TABLE products
ADD product_price       NUMBER(5, 2)   DEFAULT 9.99;

ALTER TABLE products
ADD date_time_added     DATE            DEFAULT SYSDATE;

--Output:


Table PRODUCTS altered.


Table PRODUCTS altered.

------------------------------------------------------------
--#5
/*
Description: Write an ALTER TABLE statement that modifies users created in #2 so that first_name 
			can store NULL values and store a maximum of 20 characters.
			Code UPDATE statement that inserts a NULL value into this column.
			Code another UPDATE statement that attempts to insert first_name with longer than 20 characters,
			which should fail due to the length of the column. 
*/

ALTER TABLE users
MODIFY first_name      VARCHAR2(20)     NULL;

UPDATE users
SET first_name = NULL
WHERE first_name = 'John';

UPDATE users
SET first_name = 'LongerThanValidFirstName'
WHERE first_name IS NULL;

--Output:


Table USERS altered.


1 row updated.


Error starting at line : 8 in command -
UPDATE users
SET first_name = 'LongerThanValidFirstName'
WHERE first_name IS NULL
Error at Command Line : 9 Column : 18
Error report -
SQL Error: ORA-12899: value too large for column "CMSC246110EX"."USERS"."FIRST_NAME" (actual: 24, maximum: 20)
12899. 00000 -  "value too large for column %s (actual: %s, maximum: %s)"
*Cause:    An attempt was made to insert or update a column with a value
           which is too wide for the width of the destination column.
           The name of the column is given, along with the actual width
           of the value, and the maximum allowed width of the column.
           Note that widths are reported in characters if character length
           semantics are in effect for the column, otherwise widths are
           reported in bytes.
*Action:   Examine the SQL statement for correctness.  Check source
           and destination column data types.
           Either make the destination column wider, or use a subset
           of the source column (i.e. use substring).

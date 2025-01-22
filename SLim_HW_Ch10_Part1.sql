--Assignment: HW Chapter 10 Exercises Part 1
--Short Description: How to create table, sequences, and indexes
--Course: CMSC246
--Student: Silvia Lim Siew Ling
--Professor G Grinberg
--Due Date: 11th Nov 2024

------------------------------------------------------------
--#1
/*
Description: Write ALTER TABLE statment that adds two new check constraints to Invoices table.
			First constraint allow payment_date to be null if payment_total is 0 or payment date
			not null if payment total is greater than zero. 
			Second constraint prevent the sum of payment_total and credit_total from being greater than
			invoice_total.
*/

ALTER TABLE invoices
ADD CONSTRAINT payment_total_ck 
    CHECK ((payment_total = 0 AND payment_date IS NULL) OR
            (payment_total > 0 AND payment_date IS NOT NULL));
            
ALTER TABLE invoices
ADD CONSTRAINT payment_credit_ck CHECK ((payment_total + credit_total) <= invoice_total);

--Output:


Table INVOICES altered.


Table INVOICES altered.

------------------------------------------------------------
--#2
/*
Description: Add an index to the AP schema for the zip code field in the Vendors table.
*/

CREATE INDEX zipcode_ix
ON vendors(vendor_zip_code);

--Output:

Index ZIPCODE_IX created.


------------------------------------------------------------
--#3
/*
Description: Write the CREATE TABLE statements needed to implement members,
			members_groups, and groups into EX schema. member_id and group_id
			columns are the primary key for Members and Groups table. And the members_groups
			table relates each members to one or more groups. 
*/

CREATE TABLE members
(
    member_id   NUMBER,
    first_name  VARCHAR2(50)    NOT NULL,
    last_name   VARCHAR2(50)    NOT NULL,
    address     VARCHAR2(100)   NOT NULL,
    city        VARCHAR2(50)    NOT NULL,
    state       CHAR(2)         NOT NULL,
    phone       VARCHAR2(15)    NOT NULL,
    CONSTRAINT members_pk PRIMARY KEY (member_id)
);

CREATE TABLE groups
(
    group_id    NUMBER,
    group_name  VARCHAR2(50)    NOT NULL,
    CONSTRAINT groups PRIMARY KEY (group_id)
);

CREATE TABLE members_groups
(
    member_id   NUMBER,
    group_id    NUMBER,
    CONSTRAINT mgroup_fk_members
        FOREIGN KEY (member_id) REFERENCES members (member_id)
        ON DELETE CASCADE,
    CONSTRAINT mgroups_fk_groups
        FOREIGN KEY (group_id) REFERENCES groups (group_id)
        ON DELETE CASCADE
);

--Output:

Table MEMBERS created.


Table GROUPS created.


Table MEMBERS_GROUPS created.

------------------------------------------------------------
--#4
/*
Description: INSERT two rows to the Members table for member IDs 1 and 2,
			two rows to Groups table for group IDs 1 and 2,
			three rows to the members_groups table.
*/

INSERT INTO members
VALUES (1, 'Sylvan', 'Forest', '91 Fairfax Road', 'Arlington', 'VA', 1234569999);

INSERT INTO members
VALUES (2, 'John', 'Snow', '13 Pikes Road', 'Rockville', 'MD', 2445559876);

INSERT INTO groups
VALUES (1, 'Group 1');

INSERT INTO groups
VALUES (2, 'Group 2');

INSERT INTO members_groups
VALUES (1, 2);

INSERT INTO members_groups
VALUES (2, 1);

INSERT INTO members_groups
VALUES (2, 2);

SELECT g.group_name, m.last_name, m.first_name
FROM members_groups mg 
    JOIN members m
        ON mg.member_id = m.member_id
    JOIN groups g
        ON mg.group_id = g.group_id;
    


--Output:

1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


GROUP_NAME                                         LAST_NAME                                          FIRST_NAME                                        
-------------------------------------------------- -------------------------------------------------- --------------------------------------------------
Group 2                                            Forest                                             Sylvan                                            
Group 1                                            Snow                                               John                                              
Group 2                                            Snow                                               John                                              

------------------------------------------------------------
--#5
/*
Description: Create sequences that can be used to number the number ID and group ID
			values starting with 3.
*/

CREATE SEQUENCE member_id_seq
START WITH 3;

CREATE SEQUENCE group_id_seq
START WITH 3;

--Output:


Sequence MEMBER_ID_SEQ created.


Sequence GROUP_ID_SEQ created.

------------------------------------------------------------
--#6
/*
Description: Write an INSERT statement that adds another row to Groups table.
			Use NEXTVAL pseudo column to get value for the next group ID from
			the sequence created at #5. Write a SELECT statement that gets all
			the data for all of the rows in Groups.
*/

INSERT INTO groups
VALUES (group_id_seq.NEXTVAL, 'Group 3');

SELECT *
FROM groups;

--Output:


1 row inserted.


  GROUP_ID GROUP_NAME                                        
---------- --------------------------------------------------
         1 Group 1                                           
         2 Group 2                                           
         3 Group 3                                           

------------------------------------------------------------
--#7
/*
Description: Write an ALTER TABLE statement that adds two new columns to members.
			One column for annual dues that provides for three digits to left of the 
			decimal point and two to the right. One column for payment date. The annual
			date column should have a default value of 52.50
*/
ALTER TABLE members
ADD (annual_dues    NUMBER(5,2) DEFAULT 52.50,
    payment_date    DATE);
	
--Output:	

Table MEMBERS altered.


------------------------------------------------------------
--#8
/*
Description: Write an ALTER TABLE statement that modifies the group 
				table so the group name of each row has to be unique. Then re-run
				the INSERT statement in #6 to make sure it works.
*/
ALTER TABLE groups
ADD CONSTRAINT group_name_uq UNIQUE (group_name);

--Should result in error since 'Group 3' exist in the column
INSERT INTO groups
VALUES (group_id_seq.NEXTVAL, 'Group 3');

--Output:

Table GROUPS altered.


Error starting at line : 4 in command -
INSERT INTO groups
VALUES (group_id_seq.NEXTVAL, 'Group 3')
Error report -
ORA-00001: unique constraint (CMSC246110EX.GROUP_NAME_UQ) violated


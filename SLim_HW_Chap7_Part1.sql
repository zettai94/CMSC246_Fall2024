--Assignment: HW Chapter 7 Exercises Part 1
--Short Description: How to INSERT, UPDATE, DELETE data
--Course: CMSC246
--Student: Silvia Lim Siew Ling
--Professor G Grinberg
--Due Date: 14th Oct 2024


------------------------------------------------------------
--#1
/*
Description: Write an INSERT statement that adds a new row to invoice table
				with values stated as per the instructions given. Write and run 
				appropriate SELECT statement to verify the changes
*/

SELECT *
FROM invoices
WHERE vendor_id = 32 AND invoice_number = 'AX-014-027';

INSERT INTO invoices
VALUES
    ((SELECT MAX(invoice_id)FROM invoices) +1, 32, 'AX-014-027',
        '01-Aug-2008', 434.58, 0, 0, 2, '31-Aug-2008', NULL);

SELECT *
FROM invoices
WHERE vendor_id = 32 AND invoice_number = 'AX-014-027';

--Output:

no rows selected

1 row inserted.


INVOICE_ID  VENDOR_ID INVOICE_NUMBER                                     INVOICE_D INVOICE_TOTAL PAYMENT_TOTAL CREDIT_TOTAL   TERMS_ID INVOICE_D PAYMENT_D
---------- ---------- -------------------------------------------------- --------- ------------- ------------- ------------ ---------- --------- ---------
       115         32 AX-014-027                                         01-AUG-08        434.58             0            0          2 31-AUG-08          

------------------------------------------------------------
--#2
/*
Description: Write an UPDATE statement that modifies the Vendors table.
			Change the default account number to 403 for each vendor that has
			a default number of 400. Write appropriate SELECT statement to verify	
			your changes.
*/

SELECT *
FROM vendors
WHERE default_account_number = 400;

SELECT *
FROM vendors
WHERE default_account_number = 403;

UPDATE vendors
SET default_account_number = 403
WHERE default_account_number = 400;

SELECT *
FROM vendors
WHERE default_account_number = 400;

SELECT *
FROM vendors
WHERE default_account_number = 403;

--Output:

 VENDOR_ID VENDOR_NAME                                        VENDOR_ADDRESS1                                    VENDOR_ADDRESS2                                    VENDOR_CITY                                        VE VENDOR_ZIP_CODE      VENDOR_PHONE                                       VENDOR_CONTACT_LAST_NAME                           VENDOR_CONTACT_FIRST_NAME                          DEFAULT_TERMS_ID DEFAULT_ACCOUNT_NUMBER
---------- -------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -- -------------------- -------------------------------------------------- -------------------------------------------------- -------------------------------------------------- ---------------- ----------------------
        19 Crown Printing                                     1730 "H" St                                                                                           Fresno                                             CA 93721                (559) 555-7473                                     Randrup                                            Leann                                                             2                    400
        20 Diversified Printing & Pub                         2632 Saturn St                                                                                        Brea                                               CA 92621                (714) 555-4541                                     Lane                                               Vanesa                                                            3                    400
        44 Courier Companies, Inc                             PO Box 5317                                                                                           Boston                                             MA 02206                (508) 555-6351                                     Antavius                                           Troy                                                              4                    400
        72 Data Reproductions Corp                            4545 Glenmeade Lane                                                                                   Auburn Hills                                       MI 48326                (810) 555-3700                                     Arodondo                                           Cesar                                                             3                    400
        99 Bertelsmann Industry Svcs. Inc                     28210 N Avenue Stanford                                                                               Valencia                                           CA 91355                (805) 555-0584                                     Potter                                             Lance                                                             3                    400
       110 Malloy Lithographing Inc                           5411 Jackson Road                                  PO Box 1124                                        Ann Arbor                                          MI 48106                (313) 555-6113                                     Regging                                            Abe                                                               3                    400

6 rows selected. 


 VENDOR_ID VENDOR_NAME                                        VENDOR_ADDRESS1                                    VENDOR_ADDRESS2                                    VENDOR_CITY                                        VE VENDOR_ZIP_CODE      VENDOR_PHONE                                       VENDOR_CONTACT_LAST_NAME                           VENDOR_CONTACT_FIRST_NAME                          DEFAULT_TERMS_ID DEFAULT_ACCOUNT_NUMBER
---------- -------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -- -------------------- -------------------------------------------------- -------------------------------------------------- -------------------------------------------------- ---------------- ----------------------
         3 Register of Copyrights                             Library Of Congress                                                                                   Washington                                         DC 20559                                                                   Liana                                              Lukas                                                             3                    403
        18 Fresno Photoengraving Company                      1952 "H" Street                                    P.O. Box 1952                                      Fresno                                             CA 93718                (559) 555-3005                                     Chaddick                                           Derek                                                             3                    403
        41 Shields Design                                     415 E Olive Ave                                                                                       Fresno                                             CA 93728                (559) 555-8060                                     Kerry                                              Rowan                                                             2                    403
       121 Zylka Design                                       3467 W Shaw Ave #103                                                                                  Fresno                                             CA 93711                (559) 555-8625                                     Ronaldsen                                          Jaime                                                             3                    403


6 rows updated.

no rows selected

 VENDOR_ID VENDOR_NAME                                        VENDOR_ADDRESS1                                    VENDOR_ADDRESS2                                    VENDOR_CITY                                        VE VENDOR_ZIP_CODE      VENDOR_PHONE                                       VENDOR_CONTACT_LAST_NAME                           VENDOR_CONTACT_FIRST_NAME                          DEFAULT_TERMS_ID DEFAULT_ACCOUNT_NUMBER
---------- -------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -- -------------------- -------------------------------------------------- -------------------------------------------------- -------------------------------------------------- ---------------- ----------------------
         3 Register of Copyrights                             Library Of Congress                                                                                   Washington                                         DC 20559                                                                   Liana                                              Lukas                                                             3                    403
        18 Fresno Photoengraving Company                      1952 "H" Street                                    P.O. Box 1952                                      Fresno                                             CA 93718                (559) 555-3005                                     Chaddick                                           Derek                                                             3                    403
        19 Crown Printing                                     1730 "H" St                                                                                           Fresno                                             CA 93721                (559) 555-7473                                     Randrup                                            Leann                                                             2                    403
        20 Diversified Printing & Pub                         2632 Saturn St                                                                                        Brea                                               CA 92621                (714) 555-4541                                     Lane                                               Vanesa                                                            3                    403
        41 Shields Design                                     415 E Olive Ave                                                                                       Fresno                                             CA 93728                (559) 555-8060                                     Kerry                                              Rowan                                                             2                    403
        44 Courier Companies, Inc                             PO Box 5317                                                                                           Boston                                             MA 02206                (508) 555-6351                                     Antavius                                           Troy                                                              4                    403
        72 Data Reproductions Corp                            4545 Glenmeade Lane                                                                                   Auburn Hills                                       MI 48326                (810) 555-3700                                     Arodondo                                           Cesar                                                             3                    403
        99 Bertelsmann Industry Svcs. Inc                     28210 N Avenue Stanford                                                                               Valencia                                           CA 91355                (805) 555-0584                                     Potter                                             Lance                                                             3                    403
       110 Malloy Lithographing Inc                           5411 Jackson Road                                  PO Box 1124                                        Ann Arbor                                          MI 48106                (313) 555-6113                                     Regging                                            Abe                                                               3                    403
       121 Zylka Design                                       3467 W Shaw Ave #103                                                                                  Fresno                                             CA 93711                (559) 555-8625                                     Ronaldsen                                          Jaime                                                             3                    403

10 rows selected. 


------------------------------------------------------------
--#3
/*
Description: Write an UPDATE statement that change the terms_id from Invoices 
				to 2 for each invoice that is for a vendor with a default_terms_id
				of 2. Write and run appropriate SELECT statement to verify your changes.
*/

SELECT i.vendor_id, i.terms_id, v.default_terms_id
FROM invoices i
    JOIN vendors v
        ON i.vendor_id = v.vendor_id
WHERE v.default_terms_id = 2;

UPDATE invoices
SET terms_id = 2
WHERE vendor_id IN
    (SELECT v.vendor_id 
    FROM vendors v JOIN invoices i
    ON v.vendor_id = i.vendor_id
    WHERE v.default_terms_id = 2 AND i.terms_id <> 2);

SELECT i.vendor_id, i.terms_id, v.default_terms_id
FROM invoices i
    JOIN vendors v
        ON i.vendor_id = v.vendor_id
WHERE v.default_terms_id = 2;

--Output:


 VENDOR_ID   TERMS_ID DEFAULT_TERMS_ID
---------- ---------- ----------------
        80          3                2
        80          2                2
        81          3                2
        82          2                2
        83          2                2
        83          2                2
        90          3                2
        94          3                2
        95          1                2
        95          2                2
        95          1                2

 VENDOR_ID   TERMS_ID DEFAULT_TERMS_ID
---------- ---------- ----------------
        95          3                2
        95          2                2
        95          1                2
        96          2                2
        97          4                2
        97          1                2
       119          2                2

18 rows selected. 


13 rows updated.


 VENDOR_ID   TERMS_ID DEFAULT_TERMS_ID
---------- ---------- ----------------
        80          2                2
        80          2                2
        81          2                2
        82          2                2
        83          2                2
        83          2                2
        90          2                2
        94          2                2
        95          2                2
        95          2                2
        95          2                2

 VENDOR_ID   TERMS_ID DEFAULT_TERMS_ID
---------- ---------- ----------------
        95          2                2
        95          2                2
        95          2                2
        96          2                2
        97          2                2
        97          2                2
       119          2                2

18 rows selected. 


------------------------------------------------------------
--#4
/*
Description: Write a DELETE statement that deletes the row that you added
				in Invoices table in exercise 1.
*/

SELECT *
FROM invoices
WHERE vendor_id = 32 AND invoice_number = 'AX-014-027';

DELETE FROM invoices
WHERE vendor_id = 32 AND invoice_number = 'AX-014-027';

SELECT *
FROM invoices
WHERE vendor_id = 32 AND invoice_number = 'AX-014-027';

--Output:


INVOICE_ID  VENDOR_ID INVOICE_NUMBER                                     INVOICE_D INVOICE_TOTAL PAYMENT_TOTAL CREDIT_TOTAL   TERMS_ID INVOICE_D PAYMENT_D
---------- ---------- -------------------------------------------------- --------- ------------- ------------- ------------ ---------- --------- ---------
       115         32 AX-014-027                                         01-AUG-08        434.58             0            0          2 31-AUG-08          


1 row deleted.

no rows selected

------------------------------------------------------------
--#5
/*
Description: ROLLBACK and verify rollback has been done. 
*/
ROLLBACK;

SELECT *
FROM invoices
WHERE vendor_id = 32 AND invoice_number = 'AX-014-027';

SELECT *
FROM vendors
WHERE default_account_number = 400;

SELECT *
FROM vendors
WHERE default_account_number = 403;

SELECT i.vendor_id, i.terms_id, v.default_terms_id
FROM invoices i
    JOIN vendors v
        ON i.vendor_id = v.vendor_id
WHERE v.default_terms_id = 2;



--Output:


Rollback complete.

--Rollback did not undo the DELETE done on #4
no rows selected

 VENDOR_ID VENDOR_NAME                                        VENDOR_ADDRESS1                                    VENDOR_ADDRESS2                                    VENDOR_CITY                                        VE VENDOR_ZIP_CODE      VENDOR_PHONE                                       VENDOR_CONTACT_LAST_NAME                           VENDOR_CONTACT_FIRST_NAME                          DEFAULT_TERMS_ID DEFAULT_ACCOUNT_NUMBER
---------- -------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -- -------------------- -------------------------------------------------- -------------------------------------------------- -------------------------------------------------- ---------------- ----------------------
        19 Crown Printing                                     1730 "H" St                                                                                           Fresno                                             CA 93721                (559) 555-7473                                     Randrup                                            Leann                                                             2                    400
        20 Diversified Printing & Pub                         2632 Saturn St                                                                                        Brea                                               CA 92621                (714) 555-4541                                     Lane                                               Vanesa                                                            3                    400
        44 Courier Companies, Inc                             PO Box 5317                                                                                           Boston                                             MA 02206                (508) 555-6351                                     Antavius                                           Troy                                                              4                    400
        72 Data Reproductions Corp                            4545 Glenmeade Lane                                                                                   Auburn Hills                                       MI 48326                (810) 555-3700                                     Arodondo                                           Cesar                                                             3                    400
        99 Bertelsmann Industry Svcs. Inc                     28210 N Avenue Stanford                                                                               Valencia                                           CA 91355                (805) 555-0584                                     Potter                                             Lance                                                             3                    400
       110 Malloy Lithographing Inc                           5411 Jackson Road                                  PO Box 1124                                        Ann Arbor                                          MI 48106                (313) 555-6113                                     Regging                                            Abe                                                               3                    400

6 rows selected. 


 VENDOR_ID VENDOR_NAME                                        VENDOR_ADDRESS1                                    VENDOR_ADDRESS2                                    VENDOR_CITY                                        VE VENDOR_ZIP_CODE      VENDOR_PHONE                                       VENDOR_CONTACT_LAST_NAME                           VENDOR_CONTACT_FIRST_NAME                          DEFAULT_TERMS_ID DEFAULT_ACCOUNT_NUMBER
---------- -------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -- -------------------- -------------------------------------------------- -------------------------------------------------- -------------------------------------------------- ---------------- ----------------------
         3 Register of Copyrights                             Library Of Congress                                                                                   Washington                                         DC 20559                                                                   Liana                                              Lukas                                                             3                    403
        18 Fresno Photoengraving Company                      1952 "H" Street                                    P.O. Box 1952                                      Fresno                                             CA 93718                (559) 555-3005                                     Chaddick                                           Derek                                                             3                    403
        41 Shields Design                                     415 E Olive Ave                                                                                       Fresno                                             CA 93728                (559) 555-8060                                     Kerry                                              Rowan                                                             2                    403
       121 Zylka Design                                       3467 W Shaw Ave #103                                                                                  Fresno                                             CA 93711                (559) 555-8625                                     Ronaldsen                                          Jaime                                                             3                    403


 VENDOR_ID   TERMS_ID DEFAULT_TERMS_ID
---------- ---------- ----------------
        80          3                2
        80          2                2
        81          3                2
        82          2                2
        83          2                2
        83          2                2
        90          3                2
        94          3                2
        95          1                2
        95          2                2
        95          1                2

 VENDOR_ID   TERMS_ID DEFAULT_TERMS_ID
---------- ---------- ----------------
        95          3                2
        95          2                2
        95          1                2
        96          2                2
        97          4                2
        97          1                2
       119          2                2

18 rows selected. 



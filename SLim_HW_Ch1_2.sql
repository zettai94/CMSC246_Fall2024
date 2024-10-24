--Assignment: Homework Chapters 1&2 Exercises
-- Description(short): In these exercises, I used SQL Developer to
--	review the tables in the AP and MGS schemas.
--	In addition, I also use SQL developer to enter SQL statements and run them against these tables.
--Course: CMSC246
--Student: Silvia Lim Siew Ling
--Professor G Grinberg
--Due Date: 09/09/24


--#6
--Description: Use the technique shown in page 63 to open SQL worksheet for the AP connection.
SELECT vendor_name, vendor_address1, vendor_city, vendor_state,
    vendor_zip_code
FROM vendors
ORDER BY vendor_name;

--Output:


VENDOR_NAME                                        VENDOR_ADDRESS1                                    VENDOR_CITY                                        VE VENDOR_ZIP_CODE     
-------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -- --------------------
ASC Signs                                          1528 N Sierra Vista                                Fresno                                             CA 93703               
AT&T                                               PO Box 78225                                       Phoenix                                            AZ 85062               
Abbey Office Furnishings                           4150 W Shaw Ave                                    Fresno                                             CA 93722               
American Booksellers Assoc                         828 S Broadway                                     Tarrytown                                          NY 10591               
American Express                                   Box 0001                                           Los Angeles                                        CA 90096               
Ascom Hasler Mailing Systems                       PO Box 895                                         Shelton                                            CT 06484               
Aztek Label                                        Accounts Payable                                   Anaheim                                            CA 92807               
BFI Industries                                     PO Box 9369                                        Fresno                                             CA 93792               
Baker & Taylor Books                               Five Lakepointe Plaza, Ste 500                     Charlotte                                          NC 28217               
Bertelsmann Industry Svcs. Inc                     28210 N Avenue Stanford                            Valencia                                           CA 91355               
Bill Jones                                         Secretary Of State                                 Sacramento                                         CA 94244               

VENDOR_NAME                                        VENDOR_ADDRESS1                                    VENDOR_CITY                                        VE VENDOR_ZIP_CODE     
-------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -- --------------------
Bill Marvin Electric Inc                           4583 E Home                                        Fresno                                             CA 93703               
Blanchard & Johnson Associates                     27371 Valderas                                     Mission Viejo                                      CA 92691               
Blue Cross                                         PO Box 9061                                        Oxnard                                             CA 93031               
Blue Shield of California                          PO Box 7021                                        Anaheim                                            CA 92850               
Boucher Communications Inc                         1300 Virginia Dr. Ste 400                          Fort Washington                                    PA 19034               
Cahners Publishing Company                         Citibank Lock Box 4026                             The Lake                                           NV 89163               
Cal State Termite                                  PO Box 956                                         Selma                                              CA 93662               
California Business Machines                       Gallery Plz                                        Fresno                                             CA 93710               
California Chamber Of Commerce                     3255 Ramos Cir                                     Sacramento                                         CA 95827               
California Data Marketing                          2818 E Hamilton                                    Fresno                                             CA 93721               
Capital Resource Credit                            PO Box 39046                                       Minneapolis                                        MN 55439               

VENDOR_NAME                                        VENDOR_ADDRESS1                                    VENDOR_CITY                                        VE VENDOR_ZIP_CODE     
-------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -- --------------------
Cardinal Business Media, Inc.                      P O Box 7247-7844                                  Philadelphia                                       PA 19170               
Champion Printing Company                          3250 Spring Grove Ave                              Cincinnati                                         OH 45225               
City Of Fresno                                     PO Box 2069                                        Fresno                                             CA 93718               
Cmg Information Services                           PO Box 2283                                        Boston                                             MA 02107               
Coffee Break Service                               PO Box 1091                                        Fresno                                             CA 93714               
Compuserve                                         Dept L-742                                         Columbus                                           OH 43260               
Computer Library                                   3502 W Greenway #7                                 Phoenix                                            AZ 85023               
Computerworld                                      Department #1872                                   San Francisco                                      CA 94161               
Costco                                             Fresno Warehouse                                   Fresno                                             CA 93711               
Courier Companies, Inc                             PO Box 5317                                        Boston                                             MA 02206               
Crown Printing                                     1730 "H" St                                        Fresno                                             CA 93721               

VENDOR_NAME                                        VENDOR_ADDRESS1                                    VENDOR_CITY                                        VE VENDOR_ZIP_CODE     
-------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -- --------------------
Custom Printing Company                            PO Box 7028                                        St Louis                                           MO 63177               
DMV Renewal                                        PO Box 942894                                      Sacramento                                         CA 94294               
Data Reproductions Corp                            4545 Glenmeade Lane                                Auburn Hills                                       MI 48326               
Dataforms/West                                     1617 W. Shaw Avenue                                Fresno                                             CA 93711               
Dean Witter Reynolds                               9 River Pk Pl E 400                                Boston                                             MA 02134               
Digital Dreamworks                                 5070 N Sixth Ste. 71                               Fresno                                             CA 93711               
Diversified Printing & Pub                         2632 Saturn St                                     Brea                                               CA 92621               
Dristas Groom & McCormick                          7112 N Fresno St Ste 200                           Fresno                                             CA 93720               
Edward Data Services                               4775 E Miami River Rd                              Cleves                                             OH 45002               
Enterprise Communications Inc                      1483 Chain Bridge Rd, Ste 202                      Mclean                                             VA 22101               
Evans Executone Inc                                4918 Taylor Ct                                     Turlock                                            CA 95380               

VENDOR_NAME                                        VENDOR_ADDRESS1                                    VENDOR_CITY                                        VE VENDOR_ZIP_CODE     
-------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -- --------------------
Executive Office Products                          353 E Shaw Ave                                     Fresno                                             CA 93710               
Expedata Inc                                       4420 N. First Street, Suite 108                    Fresno                                             CA 93726               
Federal Express Corporation                        P.O. Box 1140                                      Memphis                                            TN 38101               
Ford Motor Credit Company                          Dept 0419                                          Los Angeles                                        CA 90084               
Franchise Tax Board                                PO Box 942857                                      Sacramento                                         CA 94257               
Frank E Wilber Co                                  2437 N Sunnyside                                   Fresno                                             CA 93727               
Fresno County Tax Collector                        PO Box 1192                                        Fresno                                             CA 93715               
Fresno Credit Bureau                               PO Box 942                                         Fresno                                             CA 93714               
Fresno Photoengraving Company                      1952 "H" Street                                    Fresno                                             CA 93718               
Fresno Rack & Shelving Inc                         4718 N Bendel Ave                                  Fresno                                             CA 93722               
Gary McKeighan Insurance                           3649 W Beechwood Ave #101                          Fresno                                             CA 93711               

VENDOR_NAME                                        VENDOR_ADDRESS1                                    VENDOR_CITY                                        VE VENDOR_ZIP_CODE     
-------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -- --------------------
Golden Eagle Insurance Co                          PO Box 85826                                       San Diego                                          CA 92186               
Gostanian General Building                         427 W Bedford #102                                 Fresno                                             CA 93711               
Graylift                                           PO Box 2808                                        Fresno                                             CA 93745               
IBM                                                PO Box 61000                                       San Francisco                                      CA 94161               
Ingram                                             PO Box 845361                                      Dallas                                             TX 75284               
Internal Revenue Service                                                                              Fresno                                             CA 93888               
Jobtrak                                            1990 Westwood Blvd Ste 260                         Los Angeles                                        CA 90025               
Kent H Landsberg Co                                File No 72686                                      San Francisco                                      CA 94160               
Leslie Company                                     PO Box 610                                         Olathe                                             KS 66061               
Lou Gentile's Flower Basket                        722 E Olive Ave                                    Fresno                                             CA 93728               
Malloy Lithographing Inc                           5411 Jackson Road                                  Ann Arbor                                          MI 48106               

VENDOR_NAME                                        VENDOR_ADDRESS1                                    VENDOR_CITY                                        VE VENDOR_ZIP_CODE     
-------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -- --------------------
McKesson Water Products                            P O Box 7126                                       Pasadena                                           CA 91109               
Mcgraw Hill Companies                              PO Box 87373                                       Chicago                                            IL 60680               
Micro Center                                       1555 W Lane Ave                                    Columbus                                           OH 43221               
Nat Assoc of College Stores                        500 East Lorain Street                             Oberlin                                            OH 44074               
National Information Data Ctr                      PO Box 96621                                       Washington                                         DC 20090               
Naylor Publications Inc                            PO Box 40513                                       Jacksonville                                       FL 32231               
Net Asset, Llc                                     1315 Van Ness Ave Ste. 103                         Fresno                                             CA 93721               
Newbrige Book Clubs                                3000 Cindel Drive                                  Washington                                         NJ 07882               
Nielson                                            Ohio Valley Litho Division                         Cincinnati                                         OH 45264               
Office Depot                                       File No 81901                                      Los Angeles                                        CA 90074               
Opamp Technical Books                              1033 N Sycamore Ave.                               Los Angeles                                        CA 90038               

VENDOR_NAME                                        VENDOR_ADDRESS1                                    VENDOR_CITY                                        VE VENDOR_ZIP_CODE     
-------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -- --------------------
Open Horizons Publishing                           Book Marketing Update                              Fairfield                                          IA 52556               
Pacific Bell                                                                                          Sacramento                                         CA 95887               
Pacific Gas & Electric                             Box 52001                                          San Francisco                                      CA 94152               
Ph Photographic Services                           2384 E Gettysburg                                  Fresno                                             CA 93726               
Pollstar                                           4697 W Jacquelyn Ave                               Fresno                                             CA 93722               
Postmaster                                         Postage Due Technician                             Fresno                                             CA 93706               
Publishers Marketing Assoc                         627 Aviation Way                                   Manhatttan Beach                                   CA 90266               
Publishers Weekly                                  Box 1979                                           Marion                                             OH 43305               
Quality Education Data                             PO Box 95857                                       Chicago                                            IL 60694               
RR Bowker                                          PO Box 31                                          East Brunswick                                     NJ 08810               
Register of Copyrights                             Library Of Congress                                Washington                                         DC 20559               

VENDOR_NAME                                        VENDOR_ADDRESS1                                    VENDOR_CITY                                        VE VENDOR_ZIP_CODE     
-------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -- --------------------
Reiter's Scientific & Pro Books                    2021 K Street Nw                                   Washington                                         DC 20006               
Retirement Plan Consultants                        6435 North Palm Ave, Ste 101                       Fresno                                             CA 93704               
Rich Advertising                                   12 Daniel Road                                     Fairfield                                          NJ 07004               
Roadway Package System, Inc                        Dept La 21095                                      Pasadena                                           CA 91185               
Robbins Mobile Lock And Key                        4669 N Fresno                                      Fresno                                             CA 93726               
Shields Design                                     415 E Olive Ave                                    Fresno                                             CA 93728               
Simon Direct Inc                                   4 Cornwall Dr Ste 102                              East Brunswick                                     NJ 08816               
Small Press                                        121 E Front St - 4th Floor                         Traverse City                                      MI 49684               
Springhouse Corp                                   PO Box 7247-7051                                   Philadelphia                                       PA 19170               
State Board Of Equalization                        PO Box 942808                                      Sacramento                                         CA 94208               
State of California                                Employment Development Dept                        Sacramento                                         CA 94230               

VENDOR_NAME                                        VENDOR_ADDRESS1                                    VENDOR_CITY                                        VE VENDOR_ZIP_CODE     
-------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -- --------------------
Suburban Propane                                   2874 S Cherry Ave                                  Fresno                                             CA 93706               
Texaco                                             PO Box 6070                                        Inglewood                                          CA 90312               
The Drawing Board                                  PO Box 4758                                        Carol Stream                                       IL 60197               
The Fresno Bee                                     1626 E Street                                      Fresno                                             CA 93786               
The Library Ltd                                    7700 Forsyth                                       St Louis                                           MO 63105               
The Mailers Guide Co                               PO Box 1550                                        New Rochelle                                       NY 10802               
The Presort Center                                 1627 "E" Street                                    Fresno                                             CA 93706               
The Windows Deck                                   117 W Micheltorena Top Floor                       Santa Barbara                                      CA 93101               
Towne Advertiser's Mailing Svcs                    Kevin Minder                                       Santa Ana                                          CA 92704               
US Postal Service                                  Attn:  Supt. Window Services                       Madison                                            WI 53707               
United Parcel Service                              P.O. Box 505820                                    Reno                                               NV 88905               

VENDOR_NAME                                        VENDOR_ADDRESS1                                    VENDOR_CITY                                        VE VENDOR_ZIP_CODE     
-------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -- --------------------
Unocal                                             P.O. Box 860070                                    Pasadena                                           CA 91186               
Valprint                                           PO Box 12332                                       Fresno                                             CA 93777               
Venture Communications Int'l                       60 Madison Ave                                     New York                                           NY 10010               
Vision Envelope & Printing                         PO Box 3100                                        Gardena                                            CA 90247               
Wakefield Co                                       295 W Cromwell Ave Ste 106                         Fresno                                             CA 93711               
Wang Laboratories, Inc.                            P.O. Box 21209                                     Pasadena                                           CA 91185               
Wells Fargo Bank                                   Business Mastercard                                Phoenix                                            AZ 85038               
Yale Industrial Trucks-Fresno                      3711 W Franklin                                    Fresno                                             CA 93706               
Yesmed, Inc                                        PO Box 2061                                        Fresno                                             CA 93718               
Zee Medical Service Co                             4221 W Sierra Madre #104                           Washington                                         IA 52353               
Zip Print & Copy Center                            PO Box 12332                                       Fresno                                             CA 93777               

VENDOR_NAME                                        VENDOR_ADDRESS1                                    VENDOR_CITY                                        VE VENDOR_ZIP_CODE     
-------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -- --------------------
Zylka Design                                       3467 W Shaw Ave #103                               Fresno                                             CA 93711               

122 rows selected. 


--------------------------------------------------
--#9
--Description: Open another worksheet window, and use COUNT and SUM snippets as shown in figure 2-9.

SELECT COUNT(*) AS number_of_invoices,
    SUM(invoice_total) AS grand_invoice_total
FROM invoices;

--Output:

NUMBER_OF_INVOICES GRAND_INVOICE_TOTAL
------------------ -------------------
               114           214290.51



--------------------------------------------------
--#11
--Description: Open the select_vendor_city_state.sql and run the statement. 

SELECT vendor_name, vendor_city, vendor_state
FROM vendors
ORDER BY vendor_name;

--Output:

VENDOR_NAME                                        VENDOR_CITY                                        VE
-------------------------------------------------- -------------------------------------------------- --
ASC Signs                                          Fresno                                             CA
AT&T                                               Phoenix                                            AZ
Abbey Office Furnishings                           Fresno                                             CA
American Booksellers Assoc                         Tarrytown                                          NY
American Express                                   Los Angeles                                        CA
Ascom Hasler Mailing Systems                       Shelton                                            CT
Aztek Label                                        Anaheim                                            CA
BFI Industries                                     Fresno                                             CA
Baker & Taylor Books                               Charlotte                                          NC
Bertelsmann Industry Svcs. Inc                     Valencia                                           CA
Bill Jones                                         Sacramento                                         CA

VENDOR_NAME                                        VENDOR_CITY                                        VE
-------------------------------------------------- -------------------------------------------------- --
Bill Marvin Electric Inc                           Fresno                                             CA
Blanchard & Johnson Associates                     Mission Viejo                                      CA
Blue Cross                                         Oxnard                                             CA
Blue Shield of California                          Anaheim                                            CA
Boucher Communications Inc                         Fort Washington                                    PA
Cahners Publishing Company                         The Lake                                           NV
Cal State Termite                                  Selma                                              CA
California Business Machines                       Fresno                                             CA
California Chamber Of Commerce                     Sacramento                                         CA
California Data Marketing                          Fresno                                             CA
Capital Resource Credit                            Minneapolis                                        MN

VENDOR_NAME                                        VENDOR_CITY                                        VE
-------------------------------------------------- -------------------------------------------------- --
Cardinal Business Media, Inc.                      Philadelphia                                       PA
Champion Printing Company                          Cincinnati                                         OH
City Of Fresno                                     Fresno                                             CA
Cmg Information Services                           Boston                                             MA
Coffee Break Service                               Fresno                                             CA
Compuserve                                         Columbus                                           OH
Computer Library                                   Phoenix                                            AZ
Computerworld                                      San Francisco                                      CA
Costco                                             Fresno                                             CA
Courier Companies, Inc                             Boston                                             MA
Crown Printing                                     Fresno                                             CA

VENDOR_NAME                                        VENDOR_CITY                                        VE
-------------------------------------------------- -------------------------------------------------- --
Custom Printing Company                            St Louis                                           MO
DMV Renewal                                        Sacramento                                         CA
Data Reproductions Corp                            Auburn Hills                                       MI
Dataforms/West                                     Fresno                                             CA
Dean Witter Reynolds                               Boston                                             MA
Digital Dreamworks                                 Fresno                                             CA
Diversified Printing & Pub                         Brea                                               CA
Dristas Groom & McCormick                          Fresno                                             CA
Edward Data Services                               Cleves                                             OH
Enterprise Communications Inc                      Mclean                                             VA
Evans Executone Inc                                Turlock                                            CA

VENDOR_NAME                                        VENDOR_CITY                                        VE
-------------------------------------------------- -------------------------------------------------- --
Executive Office Products                          Fresno                                             CA
Expedata Inc                                       Fresno                                             CA
Federal Express Corporation                        Memphis                                            TN
Ford Motor Credit Company                          Los Angeles                                        CA
Franchise Tax Board                                Sacramento                                         CA
Frank E Wilber Co                                  Fresno                                             CA
Fresno County Tax Collector                        Fresno                                             CA
Fresno Credit Bureau                               Fresno                                             CA
Fresno Photoengraving Company                      Fresno                                             CA
Fresno Rack & Shelving Inc                         Fresno                                             CA
Gary McKeighan Insurance                           Fresno                                             CA

VENDOR_NAME                                        VENDOR_CITY                                        VE
-------------------------------------------------- -------------------------------------------------- --
Golden Eagle Insurance Co                          San Diego                                          CA
Gostanian General Building                         Fresno                                             CA
Graylift                                           Fresno                                             CA
IBM                                                San Francisco                                      CA
Ingram                                             Dallas                                             TX
Internal Revenue Service                           Fresno                                             CA
Jobtrak                                            Los Angeles                                        CA
Kent H Landsberg Co                                San Francisco                                      CA
Leslie Company                                     Olathe                                             KS
Lou Gentile's Flower Basket                        Fresno                                             CA
Malloy Lithographing Inc                           Ann Arbor                                          MI

VENDOR_NAME                                        VENDOR_CITY                                        VE
-------------------------------------------------- -------------------------------------------------- --
McKesson Water Products                            Pasadena                                           CA
Mcgraw Hill Companies                              Chicago                                            IL
Micro Center                                       Columbus                                           OH
Nat Assoc of College Stores                        Oberlin                                            OH
National Information Data Ctr                      Washington                                         DC
Naylor Publications Inc                            Jacksonville                                       FL
Net Asset, Llc                                     Fresno                                             CA
Newbrige Book Clubs                                Washington                                         NJ
Nielson                                            Cincinnati                                         OH
Office Depot                                       Los Angeles                                        CA
Opamp Technical Books                              Los Angeles                                        CA

VENDOR_NAME                                        VENDOR_CITY                                        VE
-------------------------------------------------- -------------------------------------------------- --
Open Horizons Publishing                           Fairfield                                          IA
Pacific Bell                                       Sacramento                                         CA
Pacific Gas & Electric                             San Francisco                                      CA
Ph Photographic Services                           Fresno                                             CA
Pollstar                                           Fresno                                             CA
Postmaster                                         Fresno                                             CA
Publishers Marketing Assoc                         Manhatttan Beach                                   CA
Publishers Weekly                                  Marion                                             OH
Quality Education Data                             Chicago                                            IL
RR Bowker                                          East Brunswick                                     NJ
Register of Copyrights                             Washington                                         DC

VENDOR_NAME                                        VENDOR_CITY                                        VE
-------------------------------------------------- -------------------------------------------------- --
Reiter's Scientific & Pro Books                    Washington                                         DC
Retirement Plan Consultants                        Fresno                                             CA
Rich Advertising                                   Fairfield                                          NJ
Roadway Package System, Inc                        Pasadena                                           CA
Robbins Mobile Lock And Key                        Fresno                                             CA
Shields Design                                     Fresno                                             CA
Simon Direct Inc                                   East Brunswick                                     NJ
Small Press                                        Traverse City                                      MI
Springhouse Corp                                   Philadelphia                                       PA
State Board Of Equalization                        Sacramento                                         CA
State of California                                Sacramento                                         CA

VENDOR_NAME                                        VENDOR_CITY                                        VE
-------------------------------------------------- -------------------------------------------------- --
Suburban Propane                                   Fresno                                             CA
Texaco                                             Inglewood                                          CA
The Drawing Board                                  Carol Stream                                       IL
The Fresno Bee                                     Fresno                                             CA
The Library Ltd                                    St Louis                                           MO
The Mailers Guide Co                               New Rochelle                                       NY
The Presort Center                                 Fresno                                             CA
The Windows Deck                                   Santa Barbara                                      CA
Towne Advertiser's Mailing Svcs                    Santa Ana                                          CA
US Postal Service                                  Madison                                            WI
United Parcel Service                              Reno                                               NV

VENDOR_NAME                                        VENDOR_CITY                                        VE
-------------------------------------------------- -------------------------------------------------- --
Unocal                                             Pasadena                                           CA
Valprint                                           Fresno                                             CA
Venture Communications Int'l                       New York                                           NY
Vision Envelope & Printing                         Gardena                                            CA
Wakefield Co                                       Fresno                                             CA
Wang Laboratories, Inc.                            Pasadena                                           CA
Wells Fargo Bank                                   Phoenix                                            AZ
Yale Industrial Trucks-Fresno                      Fresno                                             CA
Yesmed, Inc                                        Fresno                                             CA
Zee Medical Service Co                             Washington                                         IA
Zip Print & Copy Center                            Fresno                                             CA

VENDOR_NAME                                        VENDOR_CITY                                        VE
-------------------------------------------------- -------------------------------------------------- --
Zylka Design                                       Fresno                                             CA

122 rows selected. 

--------------------------------------------------
--#14
--Description: Open the select_vendor_information.sql and run the statement. Each statement ends with a semicolon. Run each statement seperately with F9.
--	Lastly, press F5 or click Run Script button to run both statements in the script.

SELECT vendor_name, vendor_city
FROM vendors
WHERE vendor_id = 34;

SELECT COUNT(*) AS number_of_invoices,
    SUM(invoice_total - payment_total - credit_total) AS total_due
FROM invoices
WHERE vendor_id = 34;

--Output: 

VENDOR_NAME                                        VENDOR_CITY                                       
-------------------------------------------------- --------------------------------------------------
IBM                                                San Francisco                                     


NUMBER_OF_INVOICES  TOTAL_DUE
------------------ ----------
                 2          0

--------------------------------------------------
--#19
--Description: Create connection with MGS and open a new SQL worksheet and run the following statement:

SELECT product_name 
FROM products;

--Output:

PRODUCT_NAME                                                                                                                                                                                                                                                   
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Fender Stratocaster
Gibson Les Paul
Gibson SG
Yamaha FG700S
Washburn D10S
Rodriguez Caballero 11
Fender Precision
Hofner Icon
Ludwig 5-piece Drum Set with Cymbals
Tama 5-Piece Drum Set with Cymbals

10 rows selected. 

--------------------------------------------------
--#20
--Description: Delete the e at the end of product_name, and run the statement again. An error will show. 

SELECT product_nam 
FROM products;

--Output: under query result
ORA-00904: "PRODUCT_NAM": invalid identifier
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
Error at Line: 1 Column: 8

--------------------------------------------------
--#21
--Description: Open another SQL worksheet. Then run the following statement: 

SELECT COUNT(*) AS number_of_products
FROM products;

--Output:

NUMBER_OF_PRODUCTS
------------------
                10

--------------------------------------------------
--#25
--Description: Run F5 or click the Run Script button to run both statemetn in product_statements.sql

SELECT product_name, list_price, date_added
FROM products
ORDER BY product_name;

SELECT COUNT(*) AS number_of_products,
       MAX(list_price) AS most_expensive_product,
       MIN(date_added) AS oldest_product
FROM products;

--Output:


PRODUCT_NAME                                                                                                                                                                                                                                                    LIST_PRICE DATE_ADDE
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------- ---------
Fender Precision                                                                                                                                                                                                                                                    799.99 01-JUN-12
Fender Stratocaster                                                                                                                                                                                                                                                    699 30-OCT-11
Gibson Les Paul                                                                                                                                                                                                                                                       1199 05-DEC-11
Gibson SG                                                                                                                                                                                                                                                             2517 04-FEB-12
Hofner Icon                                                                                                                                                                                                                                                         499.99 30-JUL-12
Ludwig 5-piece Drum Set with Cymbals                                                                                                                                                                                                                                699.99 30-JUL-12
Rodriguez Caballero 11                                                                                                                                                                                                                                                 415 30-JUL-12
Tama 5-Piece Drum Set with Cymbals                                                                                                                                                                                                                                  799.99 30-JUL-12
Washburn D10S                                                                                                                                                                                                                                                          299 30-JUL-12
Yamaha FG700S                                                                                                                                                                                                                                                       489.99 01-JUN-12

10 rows selected. 


NUMBER_OF_PRODUCTS MOST_EXPENSIVE_PRODUCT OLDEST_PR
------------------ ---------------------- ---------
                10                   2517 30-OCT-11


--------------------------------------------------
--#26
--Description: Move the insertion pointer to the first statement in product_statements.sql and press CTRL Enter to run just the statement

--Output: under query result

Fender Precision	799.99	01-JUN-12
Fender Stratocaster	699	30-OCT-11
Gibson Les Paul	1199	05-DEC-11
Gibson SG	2517	04-FEB-12
Hofner Icon	499.99	30-JUL-12
Ludwig 5-piece Drum Set with Cymbals	699.99	30-JUL-12
Rodriguez Caballero 11	415	30-JUL-12
Tama 5-Piece Drum Set with Cymbals	799.99	30-JUL-12
Washburn D10S	299	30-JUL-12
Yamaha FG700S	489.99	01-JUN-12

--------------------------------------------------
--#27
--Description: Move the insertion pointer to the second statement in product_statements.sql and press CTRL Enter to run just the statement

--Output: under query result

10	2517	30-OCT-11
-- Jacob Kapusta C14 --
-- COSC 3380 FALL 2014 --


CREATE TABLE Customers(
C_ID INT PRIMARY KEY,
Last_Name CHAR(25),
First_Name CHAR(25),
M_Name CHAR(1),
DOB DATE,
Address CHAR(25),
City CHAR(25),
State CHAR(25),
Zip CHAR(5),
Dphone CHAR(10),
Email CHAR(25),
Userid CHAR(25),
Customer_Password CHAR(25)
);

CREATE TABLE Testimonial(
T_ID INT PRIMARY KEY,
Content CHAR(255),
T_Date DATE,
C_ID INT,
FOREIGN KEY (C_ID) REFERENCES Customers(C_ID)
);

CREATE TABLE Catalog(
OS_ID INT PRIMARY KEY,
OS_Desc CHAR(255)
);

CREATE TABLE Categories(
Cat_ID INT PRIMARY KEY,
Cat_Desc CHAR(255)
);

CREATE TABLE Item(
Item_ID INT PRIMARY KEY,
Item_Desc CHAR(255),
Item_Image CHAR(20),
Cat_ID INT,
FOREIGN KEY (Cat_ID) REFERENCES Categories(Cat_ID)
);

CREATE TABLE Colors(
Color CHAR(20) PRIMARY KEY
);

CREATE TABLE Inventory(
Inv_ID INT PRIMARY KEY,
Inv_Price NUMBER,
Inv_Qoh INT,
Inv_Size CHAR(2),
Color CHAR(20),
Item_ID INT,
FOREIGN KEY (Color) REFERENCES Colors(Color),
FOREIGN KEY (Item_ID) REFERENCES Item(Item_ID)
);

CREATE TABLE Orders(
O_ID INT PRIMARY KEY,
O_Date DATE,
Methpmt CHAR(255),
C_ID INT,
OS_ID INT,
FOREIGN KEY (C_ID) REFERENCES Customers(C_ID),
FOREIGN KEY (OS_ID) REFERENCES Catalog(OS_ID)
);

CREATE TABLE Order_Line(
O_ID INT,
Inv_ID INT,
OL_Quantity INT,
OL_Price NUMBER,
PRIMARY KEY(O_ID, Inv_ID),
FOREIGN KEY (O_ID) REFERENCES Orders,
FOREIGN KEY (Inv_ID) REFERENCES Inventory
);

CREATE TABLE Shipment(
Ship_ID INT PRIMARY KEY,
Ship_Date_Expected DATE
);

CREATE TABLE Shipment_Line(
Ship_ID INT,
Inv_ID INT,
SL_Quantity INT,
SL_Date_Received DATE,
PRIMARY KEY(Ship_ID, Inv_ID),
FOREIGN KEY (Ship_ID) REFERENCES Shipment,
FOREIGN KEY (Inv_ID) REFERENCES Inventory
);

CREATE TABLE Discount(
D_ID INT,
Ori_Amt NUMBER,
Dis_Amt NUMBER,
O_ID INT,
FOREIGN KEY (O_ID) REFERENCES Orders
);

CREATE TABLE Employee(
E_ID NUMBER,
Role VARCHAR2(2),
Userid NUMBER,
Password VARCHAR2(20),
Email VARCHAR2(20)
);


--Customer Data Entry--
INSERT INTO Customers
VALUES('1', 'Graham', 'Neal', 'R', to_date('12/10/1967', 'mm/dd/yyyy'), '9815 Circle Dr.', 'Tallahassee', 'FL', '32308', '9045551897', 'GrahamN@gmail.com', 'grahamn', 'barbiecar');
INSERT INTO Customers
VALUES('2', 'Sanchez', 'Myra', 'T', to_date('08/14/1958', 'mm/dd/yyyy'), '172 Alto Park', 'Seattle', 'WA', '42180', '4185551791', 'SanchezM@gmail.com', 'sanchezmt', 'qwert5');
INSERT INTO Customers
VALUES('3', 'Smith', 'Lisa', 'M', to_date('04/12/1960', 'mm/dd/yyyy'), '850 East Main', 'Santa Ana', 'CA', '51875', '3075557841', 'SmithL@gmail.com', 'smithlm', 'joshua5');
INSERT INTO Customers
VALUES('4', 'Phelp', 'Paul', NULL, to_date('01/18/1981', 'mm/dd/yyyy'), '994 Kirkman Rd.', 'Houston', 'TX', '11795', '4825554788', 'TEAM?OSGSC4@gmail.com', 'TEAMOSGSC4', 'TEAMOSGSC4');
INSERT INTO Customers
VALUES('5', 'Lewis', 'Sheila', 'A', to_date('08/30/1978', 'mm/dd/yyyy'), '195 College Blvd.', 'Newton', 'GA', '37812', '3525554972', 'LewisS@gmail.com', 'lewissa', '125pass');
INSERT INTO Customers
VALUES('6', 'James', 'Thomas', 'E', to_date('06/01/1973', 'mm/dd/yyyy'), '348 Rice Lane', 'Radcliff', 'WY', '87195', '7615553485', 'JamesT@gmail.com', 'jamest', 'nok$tell');

--Testimonial Data Entry--
INSERT INTO Testimonial
VALUES('1', 'I really like TEAM?OSCS Online Sport Clothing System!', to_date('03/31/2012', 'mm/dd/yyyy'), '1');
INSERT INTO Testimonial
VALUES('2', 'I think that this TEAM?OSCS website can be improved!', to_date('04/09/2012', 'mm/dd/yyyy'), '4');
INSERT INTO Testimonial
VALUES('3', 'I believe that the Customers and Visitors will like TEAM?OSCS since they can purchase sport clothing from home.', to_date('04/25/2012', 'mm/dd/yyyy'), '6');

--Catalog Data Entry--
INSERT INTO Catalog
VALUES('1', 'Winter 2011');
INSERT INTO Catalog
VALUES('2', 'Spring 2012');
INSERT INTO Catalog
VALUES('3', 'Summer 2012');
INSERT INTO Catalog
VALUES('4', 'Outdoor 2012');
INSERT INTO Catalog
VALUES('5', 'Childrens 2012');
INSERT INTO Catalog
VALUES('6', 'Web Site');

--Category Data Entry--
INSERT INTO Categories
VALUES('1', 'Women"s Clothing');
INSERT INTO Categories
VALUES('2', 'Children"s Clothing');
INSERT INTO Categories
VALUES('3', 'Men"s Clothing');
INSERT INTO Categories
VALUES('4', 'Outdoor Gear');

--Item Data Entry--
INSERT INTO Item
VALUES('1', 'Men"s Expedition Parka', 'parka.jpg', '3');
INSERT INTO Item
VALUES('2', '3-Season Tent', 'tents.jpg', '4');
INSERT INTO Item
VALUES('3', 'Women"s Hiking Shorts', 'shorts.jpg', '1');
INSERT INTO Item
VALUES('4', 'Women"s Fleece Pullover', 'fleece.jpg', '1');
INSERT INTO Item
VALUES('5', 'Children"s Beachcomber Sandals', 'sandal.jpg', '2');
INSERT INTO Item
VALUES('6', 'Boy"s Surf Shorts', 'surfshorts.jpg', '2');
INSERT INTO Item
VALUES('7', 'Girl"s Soccer Tee', 'girlstee.jpg', '2');

--Colors Data Entry--
INSERT INTO Colors
VALUES('Sky Blue');
INSERT INTO Colors
VALUES('Light Grey');
INSERT INTO Colors
VALUES('Khaki');
INSERT INTO Colors
VALUES('Navy');
INSERT INTO Colors
VALUES('Royal');
INSERT INTO Colors
VALUES('Eggplant');
INSERT INTO Colors
VALUES('Blue');
INSERT INTO Colors
VALUES('Red');
INSERT INTO Colors
VALUES('Spruce');
INSERT INTO Colors
VALUES('Turquoise');
INSERT INTO Colors
VALUES('Bright Pink');
INSERT INTO Colors
VALUES('White');

--Inventory Data Entry--
INSERT INTO Inventory
VALUES('1', '259.99', '16', NULL, 'Sky Blue', '2');
INSERT INTO Inventory
VALUES('2', '259.99', '12', NULL, 'Light Grey', '2');
INSERT INTO Inventory
VALUES('3', '29.95', '150', 'S', 'Khaki', '3');
INSERT INTO Inventory
VALUES('4', '29.95', '147', 'M', 'Khaki', '3');
INSERT INTO Inventory
VALUES('5', '29.95', '0', 'L', 'Khaki', '3');
INSERT INTO Inventory
VALUES('6', '29.95', '139', 'S', 'Navy', '3');
INSERT INTO Inventory
VALUES('7', '29.95', '137', 'M', 'Navy', '3');
INSERT INTO Inventory
VALUES('8', '29.95', '115', 'L', 'Navy', '3');
INSERT INTO Inventory
VALUES('9', '59.95', '135', 'S', 'Eggplant', '4');
INSERT INTO Inventory
VALUES('10', '59.95', '168', 'M', 'Eggplant', '4');
INSERT INTO Inventory
VALUES('11', '59.95', '187', 'L', 'Eggplant', '4');
INSERT INTO Inventory
VALUES('12', '59.95', '0', 'S', 'Royal', '4');
INSERT INTO Inventory
VALUES('13', '59.95', '124', 'M', 'Royal', '4');
INSERT INTO Inventory
VALUES('14', '59.95', '112', 'L', 'Royal', '4');
INSERT INTO Inventory
VALUES('15', '15.99', '121', '10', 'Turquoise', '5');
INSERT INTO Inventory
VALUES('16', '15.99', '111', '11', 'Turquoise', '5');
INSERT INTO Inventory
VALUES('17', '15.99', '113', '12', 'Turquoise', '5');
INSERT INTO Inventory
VALUES('18', '15.99', '121', '1', 'Turquoise', '5');
INSERT INTO Inventory
VALUES('19', '15.99', '148', '10', 'Bright Pink', '5');
INSERT INTO Inventory
VALUES('20', '15.99', '137', '11', 'Bright Pink', '5');
INSERT INTO Inventory
VALUES('21', '15.99', '134', '12', 'Bright Pink', '5');
INSERT INTO Inventory
VALUES('22', '15.99', '123', '1', 'Bright Pink', '5');
INSERT INTO Inventory
VALUES('23', '199.95', '114', 'S', 'Spruce', '1');
INSERT INTO Inventory
VALUES('24', '199.95', '17', 'M', 'Spruce', '1');
INSERT INTO Inventory
VALUES('25', '209.95', '0', 'L', 'Spruce', '1');
INSERT INTO Inventory
VALUES('26', '209.95', '12', 'XL', 'Spruce', '1');
INSERT INTO Inventory
VALUES('27', '15.95', '50', 'S', 'Blue', '6');
INSERT INTO Inventory
VALUES('28', '15.95', '100', 'M', 'Blue', '6');
INSERT INTO Inventory
VALUES('29', '15.95', '100', 'L', 'Blue', '6');
INSERT INTO Inventory
VALUES('30', '19.99', '100', 'S', 'White', '7');
INSERT INTO Inventory
VALUES('31', '19.99', '100', 'M', 'White', '7');
INSERT INTO Inventory
VALUES('32', '19.99', '100', 'L', 'White', '7');

--Orders Data Entry--
INSERT INTO Orders
VALUES('1', TO_DATE('01/29/2012', 'MM/DD/YYYY'), 'CC', '1', '2');
INSERT INTO Orders
VALUES('2', TO_DATE('02/29/2012', 'MM/DD/YYYY'), 'CC', '6', '6');
INSERT INTO Orders
VALUES('3', TO_DATE('03/31/2012', 'MM/DD/YYYY'), 'CHECK', '2', '2');
INSERT INTO Orders
VALUES('4', TO_DATE('03/31/2012', 'MM/DD/YYYY'), 'CC', '3', '3');
INSERT INTO Orders
VALUES('5', TO_DATE('04/23/2012', 'MM/DD/YYYY'), 'CC', '4', '6');
INSERT INTO Orders
VALUES('6', TO_DATE('04/23/2012', 'MM/DD/YYYY'), 'CC', '4', '3');

--Order_Line Data Entry--
INSERT INTO Order_Line
VALUES('1', '1', '1', '259.99');
INSERT INTO Order_Line
VALUES('1', '14', '2', '59.99');
INSERT INTO Order_Line
VALUES('2', '19', '1', '15.99');
INSERT INTO Order_Line
VALUES('3', '24', '1', '199.95');
INSERT INTO Order_Line
VALUES('3', '26', '1', '209.95');
INSERT INTO Order_Line
VALUES('4', '12', '2', '59.95');
INSERT INTO Order_Line
VALUES('5', '8', '1', '29.95');
INSERT INTO Order_Line
VALUES('5', '13', '1', '59.95');
INSERT INTO Order_Line
VALUES('6', '2', '1', '259.99');
INSERT INTO Order_Line
VALUES('6', '7', '3', '29.95');

--Shipment Data Entry--
INSERT INTO Shipment
VALUES('1', TO_DATE('03/15/2012', 'MM/DD/YYYY'));
INSERT INTO Shipment
VALUES('2', TO_DATE('05/15/2012', 'MM/DD/YYYY'));
INSERT INTO Shipment
VALUES('3', TO_DATE('04/25/2012', 'MM/DD/YYYY'));
INSERT INTO Shipment
VALUES('4', TO_DATE('04/25/2012', 'MM/DD/YYYY'));
INSERT INTO Shipment
VALUES('5', TO_DATE('06/15/2012', 'MM/DD/YYYY'));

--Shipment_Line Data Entry--
INSERT INTO Shipment_Line
VALUES('1', '1', '25', TO_DATE('02/10/2012', 'MM/DD/YYYY'));
INSERT INTO Shipment_Line
VALUES('1', '2', '25', TO_DATE('02/10/2012', 'MM/DD/YYYY'));
INSERT INTO Shipment_Line
VALUES('2', '2', '25', NULL);
INSERT INTO Shipment_Line
VALUES('3', '5', '200', NULL);
INSERT INTO Shipment_Line
VALUES('3', '6', '200', NULL);
INSERT INTO Shipment_Line
VALUES('3', '7', '200', NULL);
INSERT INTO Shipment_Line
VALUES('4', '12', '100', TO_DATE('04/15/2012', 'MM/DD/YYYY'));
INSERT INTO Shipment_Line
VALUES('4', '13', '100', TO_DATE('04/25/2012', 'MM/DD/YYYY'));
INSERT INTO Shipment_Line
VALUES('5', '23', '50', TO_DATE('04/15/2012', 'MM/DD/YYYY'));
INSERT INTO Shipment_Line
VALUES('5', '24', '100', TO_DATE('04/15/2012', 'MM/DD/YYYY'));
INSERT INTO Shipment_Line
VALUES('5', '25', '100', TO_DATE('04/15/2012', 'MM/DD/YYYY'));

--C-1-1--
SELECT Inv_Price AS Inv_Price_ID1 FROM Inventory
WHERE Inv_ID=1;
--C-1-2--
SELECT * FROM Customers
WHERE DOB >= TO_DATE ('01/01/1970', 'mm/dd/yyyy') AND DOB <= TO_DATE ('12/31/1979', 'mm/dd/yyyy');
--C-1-3--
SELECT MAX(Cat_ID) AS Number_Of_Categories FROM Categories; 
--C-1-4--
SELECT COUNT(*) FROM Shipment_Line
WHERE SL_Date_Received IS NULL;
--C-1-5
SELECT SUM(Inv_QOH) AS Item1 FROM Inventory WHERE Item_ID=1;
SELECT SUM(Inv_QOH) AS Item2 FROM Inventory WHERE Item_ID=2;
SELECT SUM(Inv_QOH) AS Item3 FROM Inventory WHERE Item_ID=3;
SELECT SUM(Inv_QOH) AS Item4 FROM Inventory WHERE Item_ID=4;
SELECT SUM(Inv_QOH) AS Item5 FROM Inventory WHERE Item_ID=5;
SELECT SUM(Inv_QOH) AS Item6 FROM Inventory WHERE Item_ID=6;
SELECT SUM(Inv_QOH) AS Item7 FROM Inventory WHERE Item_ID=7;
--C-1-6--
SELECT COUNT(*) FROM Shipment_Line
WHERE SL_Date_Received = TO_DATE ('05/29/2006', 'mm/dd/yyyy');
--C-1-7--
SELECT COUNT(*) FROM Orders
WHERE O_Date = TO_DATE ('05/31/2006', 'mm/dd/yyyy') AND METHPMT = 'CC';
--C-1-8--
SELECT * FROM Customers
WHERE State='FL' OR State='GA';
--C-1-9--
SELECT * FROM Inventory
WHERE Inv_Size is NULL;
--C-1-10--
SELECT * FROM Shipment
WHERE Ship_Date_Expected = TO_DATE('09/01/2006', 'mm/dd/yyyy');
--C-1-11--
SELECT COUNT(*) FROM Inventory
WHERE Inv_Price >= '60.00' AND (Inv_Size = 'L' OR Inv_Size = 'XL');
--C-1-12--
SELECT COUNT(DISTINCT Color) FROM Inventory
WHERE Item_ID = '5';
--C-1-13--
SELECT COUNT(DISTINCT Inv_Size) FROM Inventory
WHERE Item_ID = '5';
--C-1-14--
SELECT First_Name, Last_Name, FLOOR((sysdate-to_date(DOB))/365) AS Age FROM Customers;
--C-1-15--
SELECT Ship_ID, to_char(Ship_Date_Expected, 'MONTH DD, YYYY') AS Ship_Date_Expected FROM Shipment;
--C-1-16--
SELECT COUNT(*) AS Orders_From_Source1 FROM Orders WHERE OS_ID = 1;
SELECT COUNT(*) AS Orders_From_Source2 FROM Orders WHERE OS_ID = 2;
SELECT COUNT(*) AS Orders_From_Source3 FROM Orders WHERE OS_ID = 3;
SELECT COUNT(*) AS Orders_From_Source4 FROM Orders WHERE OS_ID = 4;
SELECT COUNT(*) AS Orders_From_Source5 FROM Orders WHERE OS_ID = 5;
SELECT COUNT(*) AS Orders_From_Source6 FROM Orders WHERE OS_ID = 6;
--C-1-17--
SELECT * FROM Inventory
WHERE Inv_QOH > 0 AND (Color = 'Royal' OR Color = 'Bright Pink' OR Color = 'Spruce') AND (Inv_Size = 'M' OR Inv_Size = 'L');
--C-1-18--
SELECT DISTINCT Item_ID AS Item_ID, COUNT(Color) as   ColorCount FROM Inventory GROUP BY Item_ID;
--C-1-19--
SELECT COUNT(*) FROM Item
WHERE Cat_ID != '2' AND Cat_ID != '4';
--C-1-20--
SELECT Item_ID, TO_CHAR(Inv_Price, '$999.99') AS Price FROM Inventory;

--C-2-1--
SELECT I.Item_Desc
FROM Item I
WHERE I.Item_ID IN
(SELECT Inv.Item_ID
FROM Inventory Inv
WHERE Inv.Inv_ID IN
(SELECT OL.Inv_ID
FROM Order_Line OL
WHERE OL.O_ID = 1));
--C-2-2--
SELECT CU.C_ID AS Order1_CID, CU.Last_Name, CU.First_Name
FROM Customers CU
WHERE CU.C_ID IN
(SELECT O.C_ID
FROM Orders O
WHERE O.O_ID = 1);
SELECT SUM(OL_Price) AS Order1_Price FROM Order_Line
WHERE O_ID = 1;
--C-2-3--
SELECT CU.C_ID, CU.Last_Name, CU.First_Name
FROM Customers CU
WHERE CU.C_ID IN
(SELECT O.C_ID
FROM Orders O
WHERE O.O_ID IN
(SELECT OL.O_ID
FROM Order_Line OL
WHERE OL.Inv_ID IN
(SELECT Inv.Inv_ID
FROM Inventory Inv
WHERE Inv.Item_ID = 6)));
SELECT SUM(OL_Quantity) AS Item7_Quantity_Purchased
FROM Order_Line
WHERE Inv_ID = 27 OR Inv_ID = 28 OR Inv_ID = 29;
--C-2-4--
SELECT DISTINCT(Ship_ID) AS Ship_ID_Not_Received FROM Shipment_Line WHERE SL_Date_Received IS NULL;
SELECT *
FROM Item I
WHERE I.Item_ID IN
(SELECT Inv.Item_ID
FROM Inventory Inv
WHERE Inv.Inv_ID IN
(SELECT SL.Inv_ID
FROM Shipment_Line SL
WHERE SL.SL_Date_Received IS NULL));
--C-2-5--
SELECT Item_ID, Inv_Price, Inv_QOH FROM Inventory;
--C-2-6--
SELECT SUM(Inv_Price*Inv_QOH) AS Inventory_Investment FROM Inventory;
--C-2-7--
Select *
FROM Inventory Inv
WHERE Inv.Inv_ID IN
(SELECT OL.Inv_ID
FROM Order_Line OL
WHERE OL.O_ID IN
(SELECT O.O_ID
FROM Orders O
WHERE C_ID = 3));
SELECT * 
FROM Customers CU
WHERE CU.C_ID IN
(SELECT O.C_ID
FROM Orders O
WHERE O.O_ID IN
(SELECT OL.O_ID
FROM Order_Line OL
WHERE OL.Inv_ID = 12));
--C-2-8--
SELECT Shipment.Ship_ID, Shipment.Ship_Date_Expected, Shipment_Line.SL_Date_Received 
FROM Shipment
INNER JOIN Shipment_Line
ON Shipment.Ship_ID = Shipment_Line.Ship_ID;
--C-2-9--
SELECT SUM(OL.OL_Quantity*OL.OL_Price) AS Outdoor_Gear_Sales
FROM Order_Line OL
WHERE OL.Inv_ID IN
(SELECT Inv.Inv_ID
FROM Inventory Inv
WHERE Inv.Item_ID IN
(SELECT I.Item_ID
FROM Item I
WHERE I.Cat_ID = 4));
--C-2-10--
SELECT SUM(OL_Quantity*OL_Price) AS Tot_Website_Sales FROM Order_Line;
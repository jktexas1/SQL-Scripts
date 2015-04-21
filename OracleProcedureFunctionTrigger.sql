-- Jacob Kapusta C14 --
-- COSC 3380 FALL 2014 --


--Procedure, Function and Trigger are near the end of this document.

CREATE TABLE Customers(
C_ID INT PRIMARY KEY,
Last_Name CHAR(25),
First_Name CHAR(25),
M_Name CHAR(1),
DOB CHAR(10),
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
Content VARCHAR2(255),
T_Date CHAR(10),
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
E_ID INT PRIMARY KEY,
Role CHAR(2),
Userid CHAR(20),
Password CHAR(20),
Email CHAR(25)
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

--Employee Data Entry--
INSERT INTO Employee
VALUES('1', 'WM', '1181827', 'password', 'jktexas1@gmail.com');



--Procedure

CREATE OR REPLACE PROCEDURE Search_Testimonials(keyword IN VARCHAR2) IS
  cursor ByCompare is
  select * from Testimonial where T_Content like '%' || Keyword || '%';
  ByCompareRow ByCompare%ROWTYPE;
begin
  open ByCompare;
  fetch ByCompare into ByCompareRow;
  
  while ByCompare%FOUND loop
    dbms_output.put_line(ByCompareRow.T_Content);
    fetch ByCompare into ByCompareRow;
  end loop;
  close ByCompare;
end;

EXECUTE Search_Testimonials('like');


--Function

CREATE OR REPLACE 
FUNCTION DiscountReport
(Order_ID IN NUMBER)
RETURN NUMBER
IS
Discount NUMBER;
BEGIN
SELECT SUM(OL_Price)
INTO Discount
FROM Order_Line
WHERE O_ID = Order_ID;
--Order >= 100, 10% discount
IF Discount >= 100 AND Discount < 200 THEN
  Discount := Discount*0.20;
--Order >= 200, 20% discount
ELSIF Discount >= 200 THEN
  Discount := Discount*0.10;
--Order < 100, 0% discount
ELSE
  Discount := 0;
END IF;
ROUND(Discount, 2);
RETURN Discount;
END;

SELECT DiscountReport(1) AS Order_Discount FROM DUAL;


--Mail Procedure Used in Trigger
create or replace 
PROCEDURE SEND_MAIL(
product number, product_des varchar2, WMan_Email varchar2)
IS
c utl_smtp.connection;
msg_from varchar2(50) := 'team5olss@gmail.com';
msg_to varchar2(50) := WMan_Email;
msg_subject varchar2(50) := 'Inventory Order';
mailhost varchar2(30) := 'smtp.cs.uh.edu';

BEGIN

c:= utl_smtp.open_connection(mailhost,25);
utl_smtp.helo(c, mailhost);
utl_smtp.mail(c,msg_from);
utl_smtp.rcpt(c,msg_to);

utl_smtp.data(c,'From: ' || msg_from || utl_tcp.crlf ||
'To: ' || msg_to || utl_tcp.crlf ||
'Subject: ' || msg_subject ||
utl_tcp.crlf || 'Quantity on Hand for product "' || product_des ||
'" has reached critical low level. Please order more.');
utl_smtp.quit(c);

EXCEPTION
WHEN UTL_SMTP.INVALID_OPERATION THEN
dbms_output.put_line('Invalid Operation in Mail attempt.');
WHEN UTL_SMTP.TRANSIENT_ERROR THEN
dbms_output.put_line('Temporary issue with email - try again later');
WHEN UTL_SMTP.PERMANENT_ERROR THEN
dbms_output.put_line('Permanent Error Encountered. Mail attempt failed.'||sqlerrm);
END;

--Trigger
create or replace 
trigger ItemOutOfStock
AFTER UPDATE ON Inventory 
FOR EACH ROW
DECLARE
WM_Email VARCHAR2(20);
Item_Description VARCHAR2(255);
Item_Number NUMBER;
BEGIN
IF :new.Inv_Qoh <= 3 THEN
Item_Number := :new.Item_ID;
SELECT Email INTO WM_Email FROM Employee WHERE Role = 'WM';
SELECT Item_Desc INTO Item_Description From Item WHERE Item_ID = Item_Number AND Rownum <= 1;
dbms_output.put_line('Inv_Qoh' || :new.Inv_Qoh || ' WM_Email = ' || WM_Email);
dbms_output.put_line('Inventory_ID: ' || :new.Inv_ID);
BEGIN
 Send_Mail(:new.Inv_ID, Item_Description, WM_Email);
END;
END IF;
END;

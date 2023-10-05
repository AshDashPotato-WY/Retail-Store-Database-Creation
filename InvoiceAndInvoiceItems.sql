/*
This query creates Invoice table and constraints for it 
*/
USE Caps_Retail_Company;

DROP TABLE IF EXISTS Invoice;
CREATE TABLE Invoice (
InvoiceID                   INT                 IDENTITY(4000,1), -- PK
Order_Date                  date				not null                default getdate(), -- Default of current date
CustomerID                  INT					not null, -- FK
EmployeeID                  INT					not null, -- FK
Subtotal                    VARCHAR(35)         not null,
Discount                    decimal(9,2)        not null                default 1.00, -- Discounts are at most 1.00 (100%), sets default.
Tax                         decimal(9,2)        not null, 
Total                       decimal(9,2)        not null  
-- CONSTRAINTS
CONSTRAINT Invoice_InvoiceID_PK PRIMARY KEY (InvoiceID),
CONSTRAINT Invoice_Discount_CK CHECK (Discount <= 1.00),
CONSTRAINT Invoice_EmployeeID_fk FOREIGN KEY (EmployeeID) REFERENCES Contacts(ContactID) 			
            ON UPDATE CASCADE
            ON DELETE NO ACTION,																  
CONSTRAINT Invoice_CustomerID_fk FOREIGN KEY (CustomerID) REFERENCES Contacts(ContactID)		
);




/*
This query creates  Invoice Item table and constraints for it
*/
USE Caps_Retail_Company;

DROP TABLE IF EXISTS Invoice_Items;
CREATE TABLE Invoice_Items (
InvoiceID                   INT,
ProductID                   INT,
Quantity					int					 not null,
Row_Total					decimal(9,2)		 not null,
-- CONSTRAINTS
CONSTRAINT InvoiceItem_CompKey_InvoiceProd_PFK PRIMARY KEY (InvoiceID, ProductID),					
CONSTRAINT InvoiceItem_Qty_CK CHECK (Quantity >= 1),												    
CONSTRAINT InvoiceItem_InvoiceID_FK FOREIGN KEY (InvoiceID) REFERENCES Invoice(InvoiceID) 			
            ON UPDATE CASCADE
            ON DELETE NO ACTION,

CONSTRAINT InvoiceItem_ProductID_FK FOREIGN KEY (ProductID) REFERENCES Product(ProductID) 			
            ON UPDATE CASCADE
            ON DELETE NO ACTION,
);
-- Inserts data into invoice 
use Caps_Retail_Company

INSERT INTO Invoice
( Order_date, CustomerID, EmployeeID,Subtotal,Discount,TAX,Total)
values('2020-10-29',3029,3008,0,1,0.045,5),
( '2021-10-17',3027,3008,0,1,0.045,5),
( '2020-08-27',3022,3018,0,1,0.045,5),
('2020-06-12',3013,3018,0,.30,0.045,5),
( '2021-06-16',3017,3011,0,.40,0.045,5),
( '2021-09-26',3034,3018,0,1,0.045,5),
( '2022-04-30',3010,3011,0,.80,0.045,5),
( '2020-05-01',3023,3018,0,1,0.045,5),
( '2020-04-04',3032,3011,0,1,0.045,5),
('2020-06-26',3036,3011,0,1,0.045,5),
( '2020-02-24',3009,3011,0,.25,0.045,5),
( '2021-12-28',3004,3011,0,1,0.045,5),
( '2022-03-02',3012,3008,0,.25,0.045,5),
( '2021-09-24',3033,3003,0,1,0.045,5),
( '2020-03-24',3002,3008,0,1,0.045,5),
( '2021-07-24',3030,3018,0,1,0.045,5),
( '2021-03-13',3000,3003,0,1,0.045,5),
('2021-08-09',3031,3018,0,.06,0.045,5),
( '2020-02-15',3020,3003,0,1,0.045,5),
( '2020-04-04',3028,3003,0,.23,0.045,5),
( '2021-10-21',3035,3018,0,1,0.045,5),
( '2022-01-18',3005,3003,0,1,0.045,5),
( '2022-03-15',3019,3011,0,.9,0.045,5),
( '2020-01-22',3021,3003,0,1,0.045,5),
( '2021-04-21',3016,3008,0,1,0.045,5),
( '2020-01-16',3006,3003,0,1,0.045,5),
('2020-10-17',3001,3008,0,1,0.045,5),
('2021-02-28',3024,3011,0,1,0.045,5),
('2020-04-11',3014,3003,0,1,0.045,5),
('2020-07-03',3025,3008,0,1,0.045,5),
( '2020-04-03',3015,3008,0,1,0.045,5),
( '2021-05-28',3026,3003,0,1,0.045,5),
( '2020-04-22',3007,3018,0,1,0.045,5),
( '2020-04-22',3012,3018,0,1,0.045,5);
go

-- Inserts data into invoice items

use Caps_Retail_Company
INSERT INTO Invoice_items
(InvoiceId, ProductID, Quantity, Row_Total)
Values
( 4000,1010,15,108.99),
( 4001,1017,15,105.62),
( 4002,1044,15,103.24),
( 4003,1030,15,100.63),
( 4004,1148,13,100.27),
( 4005,1069,13,98.21),
( 4006,1174,11,94.6),
( 4007,1043,11,91.81),
( 4008,1024,11,91.65),
( 4009,1009,10,88.86),
( 4010,1068,10,81.73),
( 4011,1116,10,73.84),
( 4012,1076,9,72.7),
( 4013,1096,8,67.62),
( 4014,1104,8,61.61),
( 4015,1020,8,57.01),
( 4016,1029,8,56.39),
( 4017,1060,7,56.1),
( 4018,1143,7,55.34),
( 4019,1071,6,52.25),
( 4020,1161,6,43.84),
( 4021,1120,5,43.72),
( 4022,1035,5,41.62),
( 4023,1109,4,34.94),
( 4024,1144,4,27.27),
( 4025,1055,4,22.73),
( 4026,1000,4,21.56),
( 4027,1082,4,15.97),
( 4028,1036,3,14.91),
( 4029,1023,3,12.94),
( 4030,1015,3,9.3),
( 4031,1058,1,8.73),
( 4032,1019,1,6.94),
( 4033,1010,23,1),
( 4033,1011,4,1),
( 4033,1016,19,1),
( 4029,1016,4,1),
( 4027,1016,14,1),
( 4024,1016,4,1),
( 4021,1016,4,1),
( 4026,1016,4,1),
( 4027,1116,4,1),
( 4021,1100,4,1),
( 4020,1140,6,1);
--- 1000 to 1174
go
select * from Invoice_items;
go

/*
Update query updates subtotal, tax and total in Invoice table based on details from Invoice_Items table
*/
UPDATE [Invoice_Items]
SET Row_total = Quantity * (SELECT Retail_Price FROM Product WHERE Product.ProductID=Invoice_Items.ProductID);

go
UPDATE [Invoice]
SET SubTotal = (SELECT sum(Row_total) FROM Invoice_items i WHERE invoice.InvoiceID = i.InvoiceId);

go
UPDATE [Invoice]
SET TAX = ([Subtotal] * [Discount]) *.06 

go
UPDATE [Invoice]
SET Total = [Subtotal] + [Tax]
go


---- Select query to show who ordered what.
select Concat('No.', InvoiceId) as [Reciept#],
Order_Date as [Date Ordered],
CONCAT('Client: ', fname,' ',lname) as [Customer Name],
concat('Cust# ', CustomerID) as [Customer #],
(SELECT CONCAT('Employee: ',fname,' ',lname) thename FROM Contacts c WHERE EmployeeID = c.ContactID) as [Serviced By], -- C
concat('EID# ', EmployeeID) as [Employee #],
concat('$', total) as [Total]

from Invoice i join Contacts c
on c.ContactID = i.CustomerID
group by InvoiceID, Order_Date, fname, customerid, lname, EmployeeID, Total
order by Order_Date;

go

/*
This query creates constraints for Contacts Table
*/
USE Caps_Retail_Company;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Contacts;
CREATE TABLE Contacts (
ContactID                   INT                 IDENTITY(3000,1),
FName                       VARCHAR(35)         not null,
LName                       VARCHAR(35)         not null,
CellPhone                   VARCHAR(11)         not null            DEFAULT 'No Phone',
Email                       VARCHAR(45)         not null            DEFAULT 'No Email',
Address                     VARCHAR(35)         not null,
City                        VARCHAR(35)         not null,
Zip                         INT                 not null,
State                       VARCHAR(3)          not null            DEFAULT 'MI', 
PersonType                  VARCHAR(2)          not null            DEFAULT 'CU',  -- Person Type 'Emloyee' and 'Customer'
-- CONSTRAINTS
CONSTRAINT Contacts_ContactID_pk PRIMARY KEY (ContactID),
CONSTRAINT Contacts_PersonType_ck CHECK (PersonType in ('CU', 'EM')),
);

/*
This query creates constraints for Employee Table
*/
USE Caps_Retail_Company;

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
ContactID           INT                     not null,
JobTitle            VARCHAR(50)             not null            DEFAULT 'Not Employee',
SSN                 VARCHAR(14)             not null            DEFAULT 'Not Employee',
HireDate            Date,
-- CONSTRAINTS
CONSTRAINT Employee_ContactID_pk PRIMARY KEY (ContactID),
CONSTRAINT Employee_ContactID_fk FOREIGN KEY (ContactID) REFERENCES Contacts(ContactID)
            ON UPDATE CASCADE
            ON DELETE NO ACTION,
CONSTRAINT Employee_SSN_ck UNIQUE(SSN),
);


/*
This query creates constraints for Customer Table
*/
USE Caps_Retail_Company;

DROP TABLE IF EXISTS Customer;
CREATE TABLE Customer (
ContactID               INT                 not null,
CustomerSince           DATE,
-- CONSTRAINTS
CONSTRAINT Customer_ContactID_pk PRIMARY KEY (ContactID),
CONSTRAINT Customer_ContactID_fk FOREIGN KEY (ContactID) REFERENCES Contacts(ContactID)
            ON UPDATE CASCADE
            On DELETE NO ACTION,
);

/*
This query inserts values into Contact Table
*/
USE Caps_Retail_Company;

INSERT INTO Contacts
(FName, LName, CellPhone, Email, Address, Zip, City, PersonType)
VALUES
('Stevie', 'Dave', '4148889845', 'carolanne14@leannon.org', '12 Main Street', 49660, 'Manistee', 'CU'),
('Troy ', 'Fletcher', '8130497327', 'mary.hermiston@hotmail.com', '24 Huttenlocker Road', 49259, 'Munith', 'CU'),
('Lindsey', 'Sanders', '9494849682', 'damore.evans@gmail.com', '24 W Bridge Street NE', 49341, 'Rockford', 'CU'),
('Julie', 'Shepard', '1541416628', 'lockman.ulises@yahoo.com', '9 Knickerbocker Ct SW', 49519, 'Wyoming', 'EM'),
('Christina ', 'Armstrong', '3395145632', 'imelda07@welch.biz', '35 Knickerbocker Ct SW', 49519, 'Wyoming', 'CU'),
('Joseph', 'Johnson', '7241077438', 'abernathy.jettie@hyatt.com', '30 Kildeer', 49649, 'Kingsley', 'CU'),
('Abigail', 'Wheeler', '6618570157', 'psmitham@hotmail.com', '34 Hessler Drive NE', 49341, 'Rockford', 'CU'),
('Matthew', 'Knight', '5927244897', 'kayli32@hotmail.com', '393 HildrethStreet Jerome', 49249, 'Jerome', 'CU'),
('Carlos', 'Lee', '5373014649', 'dylan86@nienow.com', '6195 Margaret Lane West', 49042, 'West Constantine', 'EM'),
('Troy ', 'Ross', '1526774424', 'lea.bernhard@gmail.com', '7206 Van Northwick Drive', 49321, 'Comstock Park', 'CU'),
('Rodney', 'Freeman', '6714651399', 'gerson64@yahoo.com', '3942 Turnbridge Way', 49723, 'Cross Village', 'CU'),
('David', 'Bonilla', '6982400899', 'marty10@hyatt.net', '7449 Hiridge Road', 49430, 'Lamont', 'EM'),
('Christina ', 'Kelly', '2994472389', 'fern.robel@hotmail.com', '2036 Cottrell Street', 48036, 'Clinton Township', 'CU'),
('Karen', 'Barnes', '4199568051', 'vonrueden.torrance@gmail.com', '1766 Franck Street', 49253, 'West Manitou Beach', 'CU'),
('Mark', 'Ramos', '5093250832', 'emory04@yahoo.com', '4377 Barbara Ann Blvd', 49880, 'Rock', 'CU'),
('Barbara', 'Nichols', '6996304811', 'nitzsche.norene@yahoo.com', '8985 South 630 East Port', 48467, 'Austin', 'CU'),
('Monica', 'Ryan', '5137824211', 'ernestina.lemke@williamson.com', '2081 Romana Way', 49107, 'Buchanan', 'CU'),
('Brenda', 'Henry', '8594347682', 'quitzon.dejon@gmail.com', '1105 Vista Circle', 49129, 'Union Pier', 'CU'),
('Allison', 'Reyes', '4743867127', 'yvette.lueilwitz@hotmail.com', '6029 106th Circle', 48150, 'South Livonia', 'EM'),
('Andrea', 'Perry', '8170979932', 'prosacco.myrtis@stanton.com', '6957 119th Street', 49077, 'West Oshtemo', 'CU'),
('Christie', 'Levy', '4224882389', 'jovanny55@marquardt.net', '5776 Nutmeg Court', 49970, 'Watton', 'CU'),
('Hedvig', 'Shavonne', '9758262925', 'judah42@zboncak.com', '9700 Wistar Road', 48873, 'Pewamo', 'CU'),
('Chris', 'Strong', '1535494529', 'tessie22@hotmail.com', '2595 Ben Tirran Court', 49718, 'Carp Lake', 'CU'),
('Dina', 'Moses', '9754195036', 'iyost@dietrich.net', '7404 Aviary Court', 49268, 'Palmyra', 'CU'),
('Ronda', 'Fields', '1020106384', 'smurphy@gmail.com', '1948 Lake Nokomis Parkway', 49743, 'West Hawks', 'CU'),
('Xavier', 'Cooper', '4913704241', 'hodkiewicz.kenny@considine.biz', '1100 Laguna Boulevard', 48061, 'Port Huron', 'CU'),
('Fermin', 'Woodard', '3409975834', 'valerie.beahan@hotmail.com', '1228 Pecan Hollow Drive', 48611, 'Auburn Hills', 'CU'),
('Kip', 'Hobbs', '7343715449', 'monahan.letitia@yahoo.com', '6779 Botany Circle', 48027, 'Goodells', 'CU'),
('Lizzie', 'Salas', '3975407099', 'winona40@gmail.com', '6887 Liberty Road', 49095, 'Vandalia', 'CU'),
('May', 'Ray', '6029112167', 'robbie.boyle@metz.net', '2644 Minnies Lane', 48911, 'Lansing', 'CU'),
('Cary', 'Tapia', '6360336831', 'devyn.jacobi@gmail.com', '9795 Winthrop Court', 48449, 'Lennon', 'CU'),
('Suzette', 'Leach', '1189585022', 'marilie23@gmail.com', '6596 Oakmont Road', 49611, 'Alba', 'CU'),
('Jeanie', 'Christian', '2300488826', 'benton98@yahoo.com', '2273 Maison Place', 49833, ' Little Lake', 'CU'),
('Marsha', 'Solomon', '3013145491', 'hills.montana@schimmel.org', '3278 Bernheim Lane', 48401, 'Applegate', 'CU'),
('Asa', 'Alvarado', '4750732133', 'darryl17@marvin.org', '1969 Lower Market Street', 49127, 'Stevensville', 'CU'),
('Jake', 'Allison', '7237150773', 'cassandre.towne@halvorson.com', '1404 Church Street NW', 49705, 'Afton', 'CU'),
('Rufus', 'Parker', '3613805275', 'hessel.javonte@hotmail.com', '3840 Arbor Ridge Drive', 48721, 'Black River', 'CU');

/*
This query inserts values into Employee Table
*/
USE Caps_Retail_Company;

INSERT INTO Employee 
(ContactID, JobTitle, SSN, HireDate)
VALUES
(3003, 'Cashier', '523-56-7270', '11/15/09'),
(3008, 'Inventory support', '407-71-2437', '1/2/20'),
(3011, 'Inventory support', '110-34-3204', '4/5/15'),
(3018, 'Store Owner', '530-57-8453', '2/9/08');


/*
This query inserts values into Customer Table
*/
USE Caps_Retail_Company;

INSERT INTO Customer
(ContactID, CustomerSince)
VALUES
(3000, '01/03/18'),
(3001, '03/19/19'),
(3002, '04/12/18'),
(3004, '06/19/20'),
(3005, '09/10/19'),
(3006, '09/22/21'),
(3007, '10/11/18'),
(3009, '09/08/19'),
(3010, '03/07/19'),
(3012, '07/29/20'),
(3013, '09/20/21'),
(3014, '06/04/21'),
(3015, '08/02/19'),
(3016, '09/15/21'),
(3017, '11/19/21'),
(3019, '08/19/20'),
(3020, '06/18/20'),
(3021, '07/10/19'),
(3022, '08/24/19'),
(3023, '12/11/19'),
(3024, '03/17/21'),
(3025, '05/31/19'),
(3026, '03/16/18'),
(3027, '05/16/19'),
(3028, '08/21/19'),
(3029, '09/16/21'),
(3030, '08/02/20'),
(3031, '04/02/22'),
(3032, '04/07/21'),
(3033, '06/01/19'),
(3034, '05/13/19'),
(3035, '05/02/18'),
(3036, '04/09/20');

/*
This query alters Contacts table by adding one column and updates Contacts table
*/
USE Caps_Retail_Company;
ALTER TABLE Contacts
ADD BillingAddress char(500) NULL;

USE Caps_Retail_Company;
UPDATE Contacts
SET BillingAddress = CONCAT(Address, ', ', City, ', ', State, ' ', Zip);

SELECT CONCAT(FName, ' ', LName) as [Client Name]
     , BillingAddress
FROM Customer cu JOIN Contacts co
    ON cu.ContactID = co.ContactID
ORDER BY FName ASC;
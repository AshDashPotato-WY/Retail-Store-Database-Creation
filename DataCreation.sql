/*
This query creates constraints for Vendor Table
*/
USE Caps_Retail_Company;
DROP TABLE IF EXISTS Inventory;
DROP TABLE IF EXISTS Product;


DROP TABLE IF EXISTS Vendor;
CREATE TABLE Vendor (
VendorID                int                 identity(2000,1),
Vendor_Name             VARCHAR(20)         not null,
Company_Address         VARCHAR(50)         not null,
City                    VARCHAR(20)         not null,
State                   VARCHAR(5)          not null,
Zip                     VARCHAR(10)         not null,
Contact_Person_Name     VARCHAR(20)         null            DEFAULT 'No Name',
Contact_Phone_Number    VARCHAR(15)         null            DEFAULT 'No Phone',
Contact_Email           VARCHAR(30)         null            DEFAULT 'No Email',
-- CONSTRAINTS
CONSTRAINT Vendor_VendorID_pk PRIMARY KEY (VendorID),
);


/* 
This query creates constraints for Product table
*/
USE Caps_Retail_Company;

DROP TABLE IF EXISTS Product;
CREATE TABLE Product (
ProductID		        int                     identity(1000,1), 
Product_Name	        VARCHAR(50)				not null,
Product_Description		Varchar(500)		    null,
Color                   varchar(35)             not null,
Wholesale_Price     	Decimal(9,2)	        not null,
Retail_Price	        Decimal(9,2)	        not null,
VendorID		        int				        not null,
-- CONSTRAINTS
CONSTRAINT Product_ProductID_pk PRIMARY KEY (ProductID),
CONSTRAINT Product_VendorID_fk FOREIGN KEY (VendorID) references Vendor(VendorID)
            on update cascade
		    on delete no action,
);


/*
This query creates constraints for Inventory table
*/
USE Caps_Retail_Company;

DROP TABLE IF EXISTS Inventory;
CREATE TABLE Inventory (
ProductID                   int             not null,
Current_Stock_Level         INT             null,
Reorder_Level               int             null            DEFAULT 2,
Reorder_Quantity            INT             null            DEFAULT 2,
-- CONSTRAINTS
CONSTRAINT Inventory_ProductID_pk PRIMARY KEY (ProductID),
CONSTRAINT Inventory_ProductID_pfk FOREIGN KEY (ProductID) references Product(ProductID)
);

/*
This query insert data values into Vendor table
*/
INSERT INTO Vendor 
(Vendor_Name, Company_Address, City, State, Zip, Contact_Person_Name, Contact_Phone_Number, Contact_Email)
VALUES
('Nike', 'One Bowerman Drive', 'Beaverton',	'OR', '97005', 'Jeff Smith', '(503) 671-6453',	'media.relations@nike.com'),
('Carhartt', '5750 Mercury Drive','Dearborn', 'MI',	'48126', 'Peter Parker', '(800) 833-3118', 'just_ask_us@carhartt.com' ),
('The North Face', '2701 Harbor Bay Pkwy', 'Alameda', 'CA',	'94502', 'Todd Downey', '(888) 863-1968', 'tnfsupport@vfc.com');

/*
This query inserts data into Product Table
*/
INSERT INTO Product 
(Product_Name, Product_Description, Color, Wholesale_Price, Retail_Price, VendorID)
VALUES
('Nike Sphere Dry Cap. 247077', 'Nike Sphere Dry technology ensures maximum moisture control and quick-drying performance. This cap has an unstructured low-profile design with a hook and loop closure. The contrast Swoosh design trademark is embroidered on the bill and center back. Made of 100% polyester. ','Navy', 10.25, 20.5, 2000),
('Nike Sphere Dry Cap. 247077', 'Nike Sphere Dry technology ensures maximum moisture control and quick-drying performance. This cap has an unstructured low-profile design with a hook and loop closure. The contrast Swoosh design trademark is embroidered on the bill and center back. Made of 100% polyester. ','Birch', 10.25, 20.5, 2000),
('Nike Sphere Dry Cap. 247077', 'Nike Sphere Dry technology ensures maximum moisture control and quick-drying performance. This cap has an unstructured low-profile design with a hook and loop closure. The contrast Swoosh design trademark is embroidered on the bill and center back. Made of 100% polyester. ','White', 10.25, 20.5, 2000),
('Nike Sphere Dry Cap. 247077', 'Nike Sphere Dry technology ensures maximum moisture control and quick-drying performance. This cap has an unstructured low-profile design with a hook and loop closure. The contrast Swoosh design trademark is embroidered on the bill and center back. Made of 100% polyester. ','Black', 10.25, 20.5, 2000),
('Nike Swoosh Front Cap. 333114', 'Contrast stitching makes this cap stand out while a water-resistant finish combats moisture. This cap has an unstructured low-profile design and a hook and loop closure. The contrast Swoosh design trademark is embroidered on the front. Made of 100% polyester. ','Black', 10.25, 20.5, 2000),
('Nike Swoosh Front Cap. 333114', 'Contrast stitching makes this cap stand out while a water-resistant finish combats moisture. This cap has an unstructured low-profile design and a hook and loop closure. The contrast Swoosh design trademark is embroidered on the front. Made of 100% polyester. ','Midnight Navy', 10.25, 20.5, 2000),
('Nike Swoosh Front Cap. 333114', 'Contrast stitching makes this cap stand out while a water-resistant finish combats moisture. This cap has an unstructured low-profile design and a hook and loop closure. The contrast Swoosh design trademark is embroidered on the front. Made of 100% polyester. ','Pinenut', 10.25, 20.5, 2000),
('Nike Swoosh Front Cap. 333114', 'Contrast stitching makes this cap stand out while a water-resistant finish combats moisture. This cap has an unstructured low-profile design and a hook and loop closure. The contrast Swoosh design trademark is embroidered on the front. Made of 100% polyester. ','Varsity Royal', 10.25, 20.5, 2000),
('Nike Swoosh Front Cap. 333114', 'Contrast stitching makes this cap stand out while a water-resistant finish combats moisture. This cap has an unstructured low-profile design and a hook and loop closure. The contrast Swoosh design trademark is embroidered on the front. Made of 100% polyester. ','Vivid Green', 9.99, 19.98, 2000),
('Nike Swoosh Front Cap. 333114', 'Contrast stitching makes this cap stand out while a water-resistant finish combats moisture. This cap has an unstructured low-profile design and a hook and loop closure. The contrast Swoosh design trademark is embroidered on the front. Made of 100% polyester. ','White', 10.25, 20.5, 2000),
('Nike Dri-FIT Swoosh Visor. 429466', 'A high-performance three-panel visor built with Dri-FIT moisture management technology. Contrast stitching adds interest while the hook and loop closure ensures a custom fit. The contrast Swoosh design trademark is embroidered on the bill. Front panel measures approximately 1.875 h x 10 w. Made of 100% Dri-FIT polyester twill. ','Black', 9.25, 18.5, 2000),
('Nike Dri-FIT Swoosh Visor. 429466', 'A high-performance three-panel visor built with Dri-FIT moisture management technology. Contrast stitching adds interest while the hook and loop closure ensures a custom fit. The contrast Swoosh design trademark is embroidered on the bill. Front panel measures approximately 1.875 h x 10 w. Made of 100% Dri-FIT polyester twill. ','Navy', 9.25, 18.5, 2000),
('Nike Dri-FIT Swoosh Visor. 429466', 'A high-performance three-panel visor built with Dri-FIT moisture management technology. Contrast stitching adds interest while the hook and loop closure ensures a custom fit. The contrast Swoosh design trademark is embroidered on the bill. Front panel measures approximately 1.875 h x 10 w. Made of 100% Dri-FIT polyester twill. ','White', 9.25, 18.5, 2000),
('Nike Dri-FIT Swoosh Perforated Cap. 429467', 'Maximum breathability is achieved with Dri-FIT moisture management technology and perforated mid and back panels. A contrast underbill reduces sun glare. This 6-panel cap has an unstructured low-profile design with a hook and loop closure. The contrast Swoosh design trademark is embroidered on the bill and center back. Made of 100% Dri-FIT polyester. ','Black', 12.25, 24.5, 2000),
('Nike Dri-FIT Swoosh Perforated Cap. 429467', 'Maximum breathability is achieved with Dri-FIT moisture management technology and perforated mid and back panels. A contrast underbill reduces sun glare. This 6-panel cap has an unstructured low-profile design with a hook and loop closure. The contrast Swoosh design trademark is embroidered on the bill and center back. Made of 100% Dri-FIT polyester. ','Navy', 12.25, 24.5, 2000),
('Nike Dri-FIT Swoosh Perforated Cap. 429467', 'Maximum breathability is achieved with Dri-FIT moisture management technology and perforated mid and back panels. A contrast underbill reduces sun glare. This 6-panel cap has an unstructured low-profile design with a hook and loop closure. The contrast Swoosh design trademark is embroidered on the bill and center back. Made of 100% Dri-FIT polyester. ','White', 12.25, 24.5, 2000),
('Nike Unstructured Twill Cap. 580087', 'The perfect classic look with a contrast underbill as engineered by Nike. This cap has an unstructured mid-profile design and a self-fabric closure with buckle. The contrast Swoosh design trademark is embroidered on the center back. Made of 58/42 cotton/poly twill. ','Deep Black', 7.25, 14.5, 2000),
('Nike Unstructured Twill Cap. 580087', 'The perfect classic look with a contrast underbill as engineered by Nike. This cap has an unstructured mid-profile design and a self-fabric closure with buckle. The contrast Swoosh design trademark is embroidered on the center back. Made of 58/42 cotton/poly twill. ','True White', 7.25, 14.5, 2000),
('Nike Unstructured Twill Cap. 580087', 'The perfect classic look with a contrast underbill as engineered by Nike. This cap has an unstructured mid-profile design and a self-fabric closure with buckle. The contrast Swoosh design trademark is embroidered on the center back. Made of 58/42 cotton/poly twill. ','Deep Navy', 7.25, 14.5, 2000),
('Nike Unstructured Twill Cap. 580087', 'The perfect classic look with a contrast underbill as engineered by Nike. This cap has an unstructured mid-profile design and a self-fabric closure with buckle. The contrast Swoosh design trademark is embroidered on the center back. Made of 58/42 cotton/poly twill. ','Dark Khaki', 7.25, 14.5, 2000),
('Nike Dri-FIT Swoosh Front Cap. 548533', 'The contrast welded Swoosh design trademark takes front and center on this unstructured moisture-wicking cap. A low-profile contrast underbill and hook and loop closure complete this sporty design. Made of 100% Dri-FIT polyester. ','Anthracite/ Black', 10.25, 20.5, 2000),
('Nike Dri-FIT Swoosh Front Cap. 548533', 'The contrast welded Swoosh design trademark takes front and center on this unstructured moisture-wicking cap. A low-profile contrast underbill and hook and loop closure complete this sporty design. Made of 100% Dri-FIT polyester. ','Black/ White', 10.25, 20.5, 2000),
('Nike Dri-FIT Swoosh Front Cap. 548533', 'The contrast welded Swoosh design trademark takes front and center on this unstructured moisture-wicking cap. A low-profile contrast underbill and hook and loop closure complete this sporty design. Made of 100% Dri-FIT polyester. ','Game Royal/ White', 10.25, 20.5, 2000),
('Nike Dri-FIT Swoosh Front Cap. 548533', 'The contrast welded Swoosh design trademark takes front and center on this unstructured moisture-wicking cap. A low-profile contrast underbill and hook and loop closure complete this sporty design. Made of 100% Dri-FIT polyester. ','Lucky Green/ White', 10.25, 20.5, 2000),
('Nike Dri-FIT Swoosh Front Cap. 548533', 'The contrast welded Swoosh design trademark takes front and center on this unstructured moisture-wicking cap. A low-profile contrast underbill and hook and loop closure complete this sporty design. Made of 100% Dri-FIT polyester. ','White/ Black', 10.25, 20.5, 2000),
('Nike Swoosh Legacy 91 Cap. 779797', 'With a smooth front panel and stretch for comfort this moisture-wicking cap continues a legacy of performance. This popular cap has been modernized from its original 1991 design with an unstructured mid-profile and a hook and loop closure. The contrast Swoosh design trademark is embroidered on the bill. Made of 5.6-ounce 90/10 polyester/spandex. ','Cool Grey/ Dark Grey', 11.25, 22.5, 2000),
('Nike Swoosh Legacy 91 Cap. 779797', 'With a smooth front panel and stretch for comfort this moisture-wicking cap continues a legacy of performance. This popular cap has been modernized from its original 1991 design with an unstructured mid-profile and a hook and loop closure. The contrast Swoosh design trademark is embroidered on the bill. Made of 5.6-ounce 90/10 polyester/spandex. ','White/ White', 11.25, 22.5, 2000),
('Nike Swoosh Legacy 91 Cap. 779797', 'With a smooth front panel and stretch for comfort this moisture-wicking cap continues a legacy of performance. This popular cap has been modernized from its original 1991 design with an unstructured mid-profile and a hook and loop closure. The contrast Swoosh design trademark is embroidered on the bill. Made of 5.6-ounce 90/10 polyester/spandex. ','Game Royal/ White', 11.25, 22.5, 2000),
('Nike Swoosh Legacy 91 Cap. 779797', 'With a smooth front panel and stretch for comfort this moisture-wicking cap continues a legacy of performance. This popular cap has been modernized from its original 1991 design with an unstructured mid-profile and a hook and loop closure. The contrast Swoosh design trademark is embroidered on the bill. Made of 5.6-ounce 90/10 polyester/spandex. ','Dark Grey/ White', 11.25, 22.5, 2000),
('Nike Swoosh Legacy 91 Cap. 779797', 'With a smooth front panel and stretch for comfort this moisture-wicking cap continues a legacy of performance. This popular cap has been modernized from its original 1991 design with an unstructured mid-profile and a hook and loop closure. The contrast Swoosh design trademark is embroidered on the bill. Made of 5.6-ounce 90/10 polyester/spandex. ','Black/ Black', 11.25, 22.5, 2000),
('Nike Swoosh Legacy 91 Cap. 779797', 'With a smooth front panel and stretch for comfort this moisture-wicking cap continues a legacy of performance. This popular cap has been modernized from its original 1991 design with an unstructured mid-profile and a hook and loop closure. The contrast Swoosh design trademark is embroidered on the bill. Made of 5.6-ounce 90/10 polyester/spandex. ','Navy/ Navy', 11.25, 22.5, 2000),
('Nike Sphere Dry Cap. 247077', 'Nike Sphere Dry technology ensures maximum moisture control and quick-drying performance. This cap has an unstructured low-profile design with a hook and loop closure. The contrast Swoosh design trademark is embroidered on the bill and center back. Made of 100% polyester. ','Game Royal/ White', 10.25, 20.5, 2000),
('Nike Sphere Dry Cap. 247077', 'Nike Sphere Dry technology ensures maximum moisture control and quick-drying performance. This cap has an unstructured low-profile design with a hook and loop closure. The contrast Swoosh design trademark is embroidered on the bill and center back. Made of 100% polyester. ','Black/ Gym Red', 10.25, 20.5, 2000),
('Nike Sphere Dry Cap. 247077', 'Nike Sphere Dry technology ensures maximum moisture control and quick-drying performance. This cap has an unstructured low-profile design with a hook and loop closure. The contrast Swoosh design trademark is embroidered on the bill and center back. Made of 100% polyester. ','Anthracite/ Anthracite', 10.25, 20.5, 2000),
('Nike Sphere Dry Cap. 247077', 'Nike Sphere Dry technology ensures maximum moisture control and quick-drying performance. This cap has an unstructured low-profile design with a hook and loop closure. The contrast Swoosh design trademark is embroidered on the bill and center back. Made of 100% polyester. ','Black/ White', 10.25, 20.5, 2000),
('Nike Sphere Dry Cap. 247077', 'Nike Sphere Dry technology ensures maximum moisture control and quick-drying performance. This cap has an unstructured low-profile design with a hook and loop closure. The contrast Swoosh design trademark is embroidered on the bill and center back. Made of 100% polyester. ','White/ Black', 10.25, 20.5, 2000),
('Nike Unstructured Twill Cap. 580087', 'The perfect classic look with a contrast underbill as engineered by Nike. This cap has an unstructured mid-profile design and a self-fabric closure with buckle. The contrast Swoosh design trademark is embroidered on the center back. Made of 58/42 cotton/poly twill. ','Mean Green', 6.99, 13.98, 2000),
('Nike Unstructured Twill Cap. 580087', 'The perfect classic look with a contrast underbill as engineered by Nike. This cap has an unstructured mid-profile design and a self-fabric closure with buckle. The contrast Swoosh design trademark is embroidered on the center back. Made of 58/42 cotton/poly twill. ','Fusion Pink', 7.25, 14.5, 2000),
('Nike Unstructured Twill Cap. 580087', 'The perfect classic look with a contrast underbill as engineered by Nike. This cap has an unstructured mid-profile design and a self-fabric closure with buckle. The contrast Swoosh design trademark is embroidered on the center back. Made of 58/42 cotton/poly twill. ','Dark Grey', 7.25, 14.5, 2000),
('Nike Unstructured Twill Cap. 580087', 'The perfect classic look with a contrast underbill as engineered by Nike. This cap has an unstructured mid-profile design and a self-fabric closure with buckle. The contrast Swoosh design trademark is embroidered on the center back. Made of 58/42 cotton/poly twill. ','Game Royal', 7.25, 14.5, 2000),
('Nike Unstructured Twill Cap. 580087', 'The perfect classic look with a contrast underbill as engineered by Nike. This cap has an unstructured mid-profile design and a self-fabric closure with buckle. The contrast Swoosh design trademark is embroidered on the center back. Made of 58/42 cotton/poly twill. ','Gym Red', 7.25, 14.5, 2000),
('Nike Dri-FIT Swoosh Perforated Cap. 429467', 'Maximum breathability is achieved with Dri-FIT moisture management technology and perforated mid and back panels. A contrast underbill reduces sun glare. This 6-panel cap has an unstructured low-profile design with a hook and loop closure. The contrast Swoosh design trademark is embroidered on the bill and center back. Made of 100% Dri-FIT polyester. ','Anthracite', 12.25, 24.5, 2000),
('Nike Dri-FIT Swoosh Perforated Cap. 429467', 'Maximum breathability is achieved with Dri-FIT moisture management technology and perforated mid and back panels. A contrast underbill reduces sun glare. This 6-panel cap has an unstructured low-profile design with a hook and loop closure. The contrast Swoosh design trademark is embroidered on the bill and center back. Made of 100% Dri-FIT polyester. ','Blue Sapphire', 12.25, 24.5, 2000),
('Nike Dri-FIT Swoosh Perforated Cap. 429467', 'Maximum breathability is achieved with Dri-FIT moisture management technology and perforated mid and back panels. A contrast underbill reduces sun glare. This 6-panel cap has an unstructured low-profile design with a hook and loop closure. The contrast Swoosh design trademark is embroidered on the bill and center back. Made of 100% Dri-FIT polyester. ','University Red', 12.25, 24.5, 2000),
('Nike Dri-FIT Swoosh Perforated Cap. 429467', 'Maximum breathability is achieved with Dri-FIT moisture management technology and perforated mid and back panels. A contrast underbill reduces sun glare. This 6-panel cap has an unstructured low-profile design with a hook and loop closure. The contrast Swoosh design trademark is embroidered on the bill and center back. Made of 100% Dri-FIT polyester. ','Lucky Green', 12.25, 24.5, 2000),
('Nike Dri-FIT Tech Cap. NKAA1859', 'This durable lightly structured low-profile ripstop cap delivers ultimate comfort thanks to Dri-FIT moisture-wicking technology embroidered eyelets for enhanced breathability and a soft hook and loop closure. The contrast Swoosh design trademark is embroidered on center back. Made of 91/9 polyester ripstop/spandex. ','Black/ White', 11.25, 22.5, 2000),
('Nike Dri-FIT Tech Cap. NKAA1859', 'This durable lightly structured low-profile ripstop cap delivers ultimate comfort thanks to Dri-FIT moisture-wicking technology embroidered eyelets for enhanced breathability and a soft hook and loop closure. The contrast Swoosh design trademark is embroidered on center back. Made of 91/9 polyester ripstop/spandex. ','White/ Black', 11.25, 22.5, 2000),
('Nike Dri-FIT Tech Cap. NKAA1859', 'This durable lightly structured low-profile ripstop cap delivers ultimate comfort thanks to Dri-FIT moisture-wicking technology embroidered eyelets for enhanced breathability and a soft hook and loop closure. The contrast Swoosh design trademark is embroidered on center back. Made of 91/9 polyester ripstop/spandex. ','Navy/ White', 11.25, 22.5, 2000),
('Nike Dri-FIT Tech Cap. NKAA1859', 'This durable lightly structured low-profile ripstop cap delivers ultimate comfort thanks to Dri-FIT moisture-wicking technology embroidered eyelets for enhanced breathability and a soft hook and loop closure. The contrast Swoosh design trademark is embroidered on center back. Made of 91/9 polyester ripstop/spandex. ','Cool Grey/ White', 11.25, 22.5, 2000),
('Nike Dri-FIT Tech Cap. NKAA1859', 'This durable lightly structured low-profile ripstop cap delivers ultimate comfort thanks to Dri-FIT moisture-wicking technology embroidered eyelets for enhanced breathability and a soft hook and loop closure. The contrast Swoosh design trademark is embroidered on center back. Made of 91/9 polyester ripstop/spandex. ','Photo Blue/ White', 11.25, 22.5, 2000),
('Nike Dri-FIT Tech Cap. NKAA1859', 'This durable lightly structured low-profile ripstop cap delivers ultimate comfort thanks to Dri-FIT moisture-wicking technology embroidered eyelets for enhanced breathability and a soft hook and loop closure. The contrast Swoosh design trademark is embroidered on center back. Made of 91/9 polyester ripstop/spandex. ','Anthracite/ White', 11.25, 22.5, 2000),
('Carhartt Odessa Cap. CT100289', 'This top-selling classic cap is tried-and-true Carhartt. 100% cotton washed canvas Carhartt Force  sweatband fights odors; FastDry  technology wicks away sweat for comfort Lightly structured Mid profile Pre-curved visor Adjustable fit with hook and loop closure Leatherette Carhartt label sewn on front Carhartt embroidered on back ','Carhartt Brown', 10.2, 18.55, 2001),
('Carhartt Odessa Cap. CT100289', 'This top-selling classic cap is tried-and-true Carhartt. 100% cotton washed canvas Carhartt Force  sweatband fights odors; FastDry  technology wicks away sweat for comfort Lightly structured Mid profile Pre-curved visor Adjustable fit with hook and loop closure Leatherette Carhartt label sewn on front Carhartt embroidered on back ','Army Green', 10.2, 18.55, 2001),
('Carhartt Rugged Professional Series Cap. CT103056', 'This all-star canvas hat has stretch technology and a sweat-fighting band. 59/39/2 cotton/poly/spandex with 100% polyester mesh back Carhartt Force  sweatband fights odors; FastDry  technology wicks away sweat for comfort Structured Mid profile Pre-curved visor Adjustable fit with plastic closure Carhartt label sewn on side ','Navy', 10.2, 17, 2001),
('Carhartt Rugged Professional Series Cap. CT103056', 'This all-star canvas hat has stretch technology and a sweat-fighting band. 59/39/2 cotton/poly/spandex with 100% polyester mesh back Carhartt Force  sweatband fights odors; FastDry  technology wicks away sweat for comfort Structured Mid profile Pre-curved visor Adjustable fit with plastic closure Carhartt label sewn on side ','Dark Khaki', 10.2, 17, 2001),
('Carhartt Rugged Professional Series Cap. CT103056', 'This all-star canvas hat has stretch technology and a sweat-fighting band. 59/39/2 cotton/poly/spandex with 100% polyester mesh back Carhartt Force  sweatband fights odors; FastDry  technology wicks away sweat for comfort Structured Mid profile Pre-curved visor Adjustable fit with plastic closure Carhartt label sewn on side ','Black', 10.2, 17, 2001),
('Carhartt Ashland Cap. CT101604', 'Featuring cotton duck construction this cap delivers the incredible toughness you expect from Carhartt. 100% firm hand cotton duck canvas Carhartt Force  sweatband fights odors; FastDry  technology wicks away sweat for comfort Structured High profile Flat brim visor Adjustable fit with plastic closure Carhartt label sewn on front Carhartt embroidered on back ','Black', 11, 20, 2001),
('Carhartt Ashland Cap. CT101604', 'Featuring cotton duck construction this cap delivers the incredible toughness you expect from Carhartt. 100% firm hand cotton duck canvas Carhartt Force  sweatband fights odors; FastDry  technology wicks away sweat for comfort Structured High profile Flat brim visor Adjustable fit with plastic closure Carhartt label sewn on front Carhartt embroidered on back ','Carhartt Brown', 11, 20, 2001),
('Carhartt Ashland Cap. CT101604', 'Featuring cotton duck construction this cap delivers the incredible toughness you expect from Carhartt. 100% firm hand cotton duck canvas Carhartt Force  sweatband fights odors; FastDry  technology wicks away sweat for comfort Structured High profile Flat brim visor Adjustable fit with plastic closure Carhartt label sewn on front Carhartt embroidered on back ','Gravel', 11, 20, 2001),
('Carhartt Fleece Hat. CTA207', 'Wear it with pride. Wear it when the icy wind blows on the job site. 100% polyester fleece for warmth Carhartt label sewn on front ','Black', 8.25, 16.5, 2001),
('Carhartt Fleece Hat. CTA207', 'Wear it with pride. Wear it when the icy wind blows on the job site. 100% polyester fleece for warmth Carhartt label sewn on front ','Charcoal Heather', 8.25, 16.5, 2001),
('Carhartt Fleece Hat. CTA207', 'Wear it with pride. Wear it when the icy wind blows on the job site. 100% polyester fleece for warmth Carhartt label sewn on front ','Dark Brown', 8.25, 16.5, 2001),
('Carhartt Fleece 2-In-1 Headwear. CTA202', 'If you work and play outdoors in the winter you need this 2-in-1 hat and face mask. Hat: 100% polyester fleece for warmth Pull-down face mask: 92/8 poly/spandex Carhartt Force  fabric fights odors; FastDry  technology wicks away sweat for comfort Mask can be tucked up into hat when not in use Carhartt label sewn on front ','Black', 15, 25, 2001),
('Carhartt Fleece 2-In-1 Headwear. CTA202', 'If you work and play outdoors in the winter you need this 2-in-1 hat and face mask. Hat: 100% polyester fleece for warmth Pull-down face mask: 92/8 poly/spandex Carhartt Force  fabric fights odors; FastDry  technology wicks away sweat for comfort Mask can be tucked up into hat when not in use Carhartt label sewn on front ','Charcoal Heather', 15, 25, 2001),
('Carhartt Fleece 2-In-1 Headwear. CTA202', 'If you work and play outdoors in the winter you need this 2-in-1 hat and face mask. Hat: 100% polyester fleece for warmth Pull-down face mask: 92/8 poly/spandex Carhartt Force  fabric fights odors; FastDry  technology wicks away sweat for comfort Mask can be tucked up into hat when not in use Carhartt label sewn on front ','Dark Brown', 15, 25, 2001),
('Carhartt Force Helmet-Liner Mask. CTA267', 'Be warm in the bitter cold. Wicks sweat takes the fight to odor and wins in a technical knockout. 92/8 poly/spandex blend with fleeced interior for comfort and warmth Carhartt Force  fabric fights odors; FastDry  technology wicks away sweat for comfort Full facial protection that extends below the neckline Face mask pulls down below the chin when not needed Flat seam construction enhances comfort Carhartt label printed on front Carhartt Force  logo printed on back ','Black', 15, 25, 2001),
('Carhartt Force Helmet-Liner Mask. CTA267', 'Be warm in the bitter cold. Wicks sweat takes the fight to odor and wins in a technical knockout. 92/8 poly/spandex blend with fleeced interior for comfort and warmth Carhartt Force  fabric fights odors; FastDry  technology wicks away sweat for comfort Full facial protection that extends below the neckline Face mask pulls down below the chin when not needed Flat seam construction enhances comfort Carhartt label printed on front Carhartt Force  logo printed on back ','Shadow', 15, 25, 2001),
('Carhartt Acrylic Knit Hat. CTA205', 'Warm and snug this beanie comes in enough colors to wear a new one every day of the week. 100% acrylic rib knit fabric Traditional beanie styling Carhartt label sewn on front ','Black', 10.2, 17, 2001),
('Carhartt Acrylic Knit Hat. CTA205', 'Warm and snug this beanie comes in enough colors to wear a new one every day of the week. 100% acrylic rib knit fabric Traditional beanie styling Carhartt label sewn on front ','Heather Grey', 10.2, 17, 2001),
('Carhartt Acrylic Knit Hat. CTA205', 'Warm and snug this beanie comes in enough colors to wear a new one every day of the week. 100% acrylic rib knit fabric Traditional beanie styling Carhartt label sewn on front ','Canyon Brown', 10.2, 17, 2001),
('Carhartt Acrylic Knit Hat. CTA205', 'Warm and snug this beanie comes in enough colors to wear a new one every day of the week. 100% acrylic rib knit fabric Traditional beanie styling Carhartt label sewn on front ','Heather Grey/ Coal Heather', 10.2, 17, 2001),
('Carhartt Acrylic Knit Hat. CTA205', 'Warm and snug this beanie comes in enough colors to wear a new one every day of the week. 100% acrylic rib knit fabric Traditional beanie styling Carhartt label sewn on front ','Dark Green', 10.2, 17, 2001),
('Carhartt Acrylic Knit Hat. CTA205', 'Warm and snug this beanie comes in enough colors to wear a new one every day of the week. 100% acrylic rib knit fabric Traditional beanie styling Carhartt label sewn on front ','Navy', 10.2, 17, 2001),
('Carhartt Acrylic Knit Hat. CTA205', 'Warm and snug this beanie comes in enough colors to wear a new one every day of the week. 100% acrylic rib knit fabric Traditional beanie styling Carhartt label sewn on front ','Carhartt Brown', 10.2, 17, 2001),
('Carhartt Cotton Canvas Cap CT103938', 'With its sweat-wicking odor-fighting sweatband this cap is ready to get to work. 100% cotton washed canvas Carhartt Force sweatband fights odors; FastDry technology wicks away sweat for comfort Lightly structuredMid profile Pre-curved visor Adjustable fit with hook and loop closure Carhartt label sewn on side Carhartt embroidered on back ','Black', 10.2, 17, 2001),
('Carhartt Cotton Canvas Cap CT103938', 'With its sweat-wicking odor-fighting sweatband this cap is ready to get to work. 100% cotton washed canvas Carhartt Force sweatband fights odors; FastDry technology wicks away sweat for comfort Lightly structuredMid profile Pre-curved visor Adjustable fit with hook and loop closure Carhartt label sewn on side Carhartt embroidered on back ','Gravel', 10.2, 17, 2001),
('Carhartt Cotton Canvas Cap CT103938', 'With its sweat-wicking odor-fighting sweatband this cap is ready to get to work. 100% cotton washed canvas Carhartt Force sweatband fights odors; FastDry technology wicks away sweat for comfort Lightly structuredMid profile Pre-curved visor Adjustable fit with hook and loop closure Carhartt label sewn on side Carhartt embroidered on back ','Carhartt Brown', 10.2, 17, 2001),
('Carhartt Cotton Canvas Cap CT103938', 'With its sweat-wicking odor-fighting sweatband this cap is ready to get to work. 100% cotton washed canvas Carhartt Force sweatband fights odors; FastDry technology wicks away sweat for comfort Lightly structuredMid profile Pre-curved visor Adjustable fit with hook and loop closure Carhartt label sewn on side Carhartt embroidered on back ','Navy', 10.2, 17, 2001),
('Nike Heritage 86 Cap 102699', 'Made from durable cotton twill this unstructured mid-profile cap has embroidered eyelets for enhanced breathability. Interior taping gives a comfortable fit. Closes with an adjustable self-fabric strap with metal slider. The contrast Swoosh design trademark is embroidered on the left-side middle panel. Made of 100% cotton twill. ','Black', 9.3, 18.6, 2000),
('Nike Heritage 86 Cap 102699', 'Made from durable cotton twill this unstructured mid-profile cap has embroidered eyelets for enhanced breathability. Interior taping gives a comfortable fit. Closes with an adjustable self-fabric strap with metal slider. The contrast Swoosh design trademark is embroidered on the left-side middle panel. Made of 100% cotton twill. ','White', 9.3, 18.6, 2000),
('Nike Heritage 86 Cap 102699', 'Made from durable cotton twill this unstructured mid-profile cap has embroidered eyelets for enhanced breathability. Interior taping gives a comfortable fit. Closes with an adjustable self-fabric strap with metal slider. The contrast Swoosh design trademark is embroidered on the left-side middle panel. Made of 100% cotton twill. ','College Navy', 9.3, 18.6, 2000),
('Nike Heritage 86 Cap 102699', 'Made from durable cotton twill this unstructured mid-profile cap has embroidered eyelets for enhanced breathability. Interior taping gives a comfortable fit. Closes with an adjustable self-fabric strap with metal slider. The contrast Swoosh design trademark is embroidered on the left-side middle panel. Made of 100% cotton twill. ','Game Royal', 9.3, 18.6, 2000),
('Nike Heritage 86 Cap 102699', 'Made from durable cotton twill this unstructured mid-profile cap has embroidered eyelets for enhanced breathability. Interior taping gives a comfortable fit. Closes with an adjustable self-fabric strap with metal slider. The contrast Swoosh design trademark is embroidered on the left-side middle panel. Made of 100% cotton twill. ','Anthracite', 9.3, 18.6, 2000),
('Nike Heritage 86 Cap 102699', 'Made from durable cotton twill this unstructured mid-profile cap has embroidered eyelets for enhanced breathability. Interior taping gives a comfortable fit. Closes with an adjustable self-fabric strap with metal slider. The contrast Swoosh design trademark is embroidered on the left-side middle panel. Made of 100% cotton twill. ','University Red', 9.3, 18.6, 2000),
('Nike Heritage 86 Cap 102699', 'Made from durable cotton twill this unstructured mid-profile cap has embroidered eyelets for enhanced breathability. Interior taping gives a comfortable fit. Closes with an adjustable self-fabric strap with metal slider. The contrast Swoosh design trademark is embroidered on the left-side middle panel. Made of 100% cotton twill. ','Khaki', 9.3, 18.6, 2000),
('Nike Heritage 86 Cap 102699', 'Made from durable cotton twill this unstructured mid-profile cap has embroidered eyelets for enhanced breathability. Interior taping gives a comfortable fit. Closes with an adjustable self-fabric strap with metal slider. The contrast Swoosh design trademark is embroidered on the left-side middle panel. Made of 100% cotton twill. ','Gorge Green', 9.3, 18.6, 2000),
('Nike Heritage 86 Cap 102699', 'Made from durable cotton twill this unstructured mid-profile cap has embroidered eyelets for enhanced breathability. Interior taping gives a comfortable fit. Closes with an adjustable self-fabric strap with metal slider. The contrast Swoosh design trademark is embroidered on the left-side middle panel. Made of 100% cotton twill. ','Apple Green', 9.3, 18.6, 2000),
('Nike Heritage 86 Cap 102699', 'Made from durable cotton twill this unstructured mid-profile cap has embroidered eyelets for enhanced breathability. Interior taping gives a comfortable fit. Closes with an adjustable self-fabric strap with metal slider. The contrast Swoosh design trademark is embroidered on the left-side middle panel. Made of 100% cotton twill. ','Valor Blue', 9.3, 18.6, 2000),
('Nike Heritage 86 Cap 102699', 'Made from durable cotton twill this unstructured mid-profile cap has embroidered eyelets for enhanced breathability. Interior taping gives a comfortable fit. Closes with an adjustable self-fabric strap with metal slider. The contrast Swoosh design trademark is embroidered on the left-side middle panel. Made of 100% cotton twill. ','Court Purple', 9.3, 18.6, 2000),
('Nike Heritage 86 Cap 102699', 'Made from durable cotton twill this unstructured mid-profile cap has embroidered eyelets for enhanced breathability. Interior taping gives a comfortable fit. Closes with an adjustable self-fabric strap with metal slider. The contrast Swoosh design trademark is embroidered on the left-side middle panel. Made of 100% cotton twill. ','Team Maroon', 9.3, 18.6, 2000),
('Nike Heritage 86 Cap 102699', 'Made from durable cotton twill this unstructured mid-profile cap has embroidered eyelets for enhanced breathability. Interior taping gives a comfortable fit. Closes with an adjustable self-fabric strap with metal slider. The contrast Swoosh design trademark is embroidered on the left-side middle panel. Made of 100% cotton twill. ','Deep Maroon', 9.3, 18.6, 2000),
('Nike Heritage 86 Cap 102699', 'Made from durable cotton twill this unstructured mid-profile cap has embroidered eyelets for enhanced breathability. Interior taping gives a comfortable fit. Closes with an adjustable self-fabric strap with metal slider. The contrast Swoosh design trademark is embroidered on the left-side middle panel. Made of 100% cotton twill. ','Desert Orange', 9.3, 18.6, 2000),
('Nike Dry Visor AV9754', 'This lightweight three-panel visor features a pre-curved bill and an interior Dri-FIT performance sweatband that folds down for easy embroidery. Hook and loop with silicone pull tab closure. The contrast Swoosh design trademark is embroidered on the left-side panel. Made of 100% Dri-FIT polyester twill. ','College Navy', 10.8, 21.6, 2000),
('Nike Dry Visor AV9754', 'This lightweight three-panel visor features a pre-curved bill and an interior Dri-FIT performance sweatband that folds down for easy embroidery. Hook and loop with silicone pull tab closure. The contrast Swoosh design trademark is embroidered on the left-side panel. Made of 100% Dri-FIT polyester twill. ','Game Royal', 10.8, 21.6, 2000),
('Nike Dry Visor AV9754', 'This lightweight three-panel visor features a pre-curved bill and an interior Dri-FIT performance sweatband that folds down for easy embroidery. Hook and loop with silicone pull tab closure. The contrast Swoosh design trademark is embroidered on the left-side panel. Made of 100% Dri-FIT polyester twill. ','Anthracite', 10.8, 21.6, 2000),
('Nike Dry Visor AV9754', 'This lightweight three-panel visor features a pre-curved bill and an interior Dri-FIT performance sweatband that folds down for easy embroidery. Hook and loop with silicone pull tab closure. The contrast Swoosh design trademark is embroidered on the left-side panel. Made of 100% Dri-FIT polyester twill. ','Khaki', 10.8, 21.6, 2000),
('Nike Dry Visor AV9754', 'This lightweight three-panel visor features a pre-curved bill and an interior Dri-FIT performance sweatband that folds down for easy embroidery. Hook and loop with silicone pull tab closure. The contrast Swoosh design trademark is embroidered on the left-side panel. Made of 100% Dri-FIT polyester twill. ','University Red', 10.8, 21.6, 2000),
('Nike Dry Visor AV9754', 'This lightweight three-panel visor features a pre-curved bill and an interior Dri-FIT performance sweatband that folds down for easy embroidery. Hook and loop with silicone pull tab closure. The contrast Swoosh design trademark is embroidered on the left-side panel. Made of 100% Dri-FIT polyester twill. ','Gorge Green', 10.8, 21.6, 2000),
('Nike Dry Visor AV9754', 'This lightweight three-panel visor features a pre-curved bill and an interior Dri-FIT performance sweatband that folds down for easy embroidery. Hook and loop with silicone pull tab closure. The contrast Swoosh design trademark is embroidered on the left-side panel. Made of 100% Dri-FIT polyester twill. ','Valor Blue', 10.8, 21.6, 2000),
('Nike Dry Visor AV9754', 'This lightweight three-panel visor features a pre-curved bill and an interior Dri-FIT performance sweatband that folds down for easy embroidery. Hook and loop with silicone pull tab closure. The contrast Swoosh design trademark is embroidered on the left-side panel. Made of 100% Dri-FIT polyester twill. ','Court Purple', 10.8, 21.6, 2000),
('Nike Dry Visor AV9754', 'This lightweight three-panel visor features a pre-curved bill and an interior Dri-FIT performance sweatband that folds down for easy embroidery. Hook and loop with silicone pull tab closure. The contrast Swoosh design trademark is embroidered on the left-side panel. Made of 100% Dri-FIT polyester twill. ','Deep Maroon', 10.8, 21.6, 2000),
('Nike Dry Visor AV9754', 'This lightweight three-panel visor features a pre-curved bill and an interior Dri-FIT performance sweatband that folds down for easy embroidery. Hook and loop with silicone pull tab closure. The contrast Swoosh design trademark is embroidered on the left-side panel. Made of 100% Dri-FIT polyester twill. ','Desert Orange', 10.8, 21.6, 2000),
('Nike Sideline Beanie 867309', 'This warm cuffed beanie is perfect for the stands or the street. The contrast high-density Swoosh design trademark is embroidered on the center front. Made of 100% Dri-FIT acrylic. ','Black', 8.4, 16.8, 2000),
('Nike Sideline Beanie 867309', 'This warm cuffed beanie is perfect for the stands or the street. The contrast high-density Swoosh design trademark is embroidered on the center front. Made of 100% Dri-FIT acrylic. ','Medium Grey', 8.4, 16.8, 2000),
('Nike Featherlight Cap CJ7082', 'Stay cool covered and comfortable in this unstructured low-profile cap. Nike AeroBill technology integrates proprietary lightweight construction with breathable sweat-wicking fabric for enhanced comfort and reduced distraction. A hook and loop closure with pull tab ensures a custom fit. The contrast Swoosh design trademark is embroidered on the left-side middle panel. Made of 100% Dri-FIT polyester twill. ','Black', 14.7, 29.4, 2000),
('Nike Featherlight Cap CJ7082', 'Stay cool covered and comfortable in this unstructured low-profile cap. Nike AeroBill technology integrates proprietary lightweight construction with breathable sweat-wicking fabric for enhanced comfort and reduced distraction. A hook and loop closure with pull tab ensures a custom fit. The contrast Swoosh design trademark is embroidered on the left-side middle panel. Made of 100% Dri-FIT polyester twill. ','White', 14.7, 29.4, 2000),
('Nike Featherlight Cap CJ7082', 'Stay cool covered and comfortable in this unstructured low-profile cap. Nike AeroBill technology integrates proprietary lightweight construction with breathable sweat-wicking fabric for enhanced comfort and reduced distraction. A hook and loop closure with pull tab ensures a custom fit. The contrast Swoosh design trademark is embroidered on the left-side middle panel. Made of 100% Dri-FIT polyester twill. ','College Navy', 14.7, 29.4, 2000),
('Nike Featherlight Cap CJ7082', 'Stay cool covered and comfortable in this unstructured low-profile cap. Nike AeroBill technology integrates proprietary lightweight construction with breathable sweat-wicking fabric for enhanced comfort and reduced distraction. A hook and loop closure with pull tab ensures a custom fit. The contrast Swoosh design trademark is embroidered on the left-side middle panel. Made of 100% Dri-FIT polyester twill. ','Game Royal', 14.7, 29.4, 2000),
('Nike Featherlight Cap CJ7082', 'Stay cool covered and comfortable in this unstructured low-profile cap. Nike AeroBill technology integrates proprietary lightweight construction with breathable sweat-wicking fabric for enhanced comfort and reduced distraction. A hook and loop closure with pull tab ensures a custom fit. The contrast Swoosh design trademark is embroidered on the left-side middle panel. Made of 100% Dri-FIT polyester twill. ','Anthracite', 14.7, 29.4, 2000),
('The North Face Ultimate Trucker Cap. NF0A4VUA', 'Constructed of cotton canvas this cap has a rugged canvas wash for a vintage look. The adjustable snapback closure allows a customized fit while mesh venting and eyelets provide breathability and ventilation on the warmest days. Fabric 100% cotton canvas front panels 100% polyester mesh back panelsStructure Structured Profile MidFeatures Washed-down cotton canvas; contrast embroidered The North Face logo embroidered on left middle panelClosure Adjustable snapback ','Vintage White/ Asphalt Grey', 11.1, 18.5, 2002),
('The North Face Ultimate Trucker Cap. NF0A4VUA', 'Constructed of cotton canvas this cap has a rugged canvas wash for a vintage look. The adjustable snapback closure allows a customized fit while mesh venting and eyelets provide breathability and ventilation on the warmest days. Fabric 100% cotton canvas front panels 100% polyester mesh back panelsStructure Structured Profile MidFeatures Washed-down cotton canvas; contrast embroidered The North Face logo embroidered on left middle panelClosure Adjustable snapback ','TNF Mid Grey Heather/ TNF Black', 11.1, 18.5, 2002),
('The North Face Ultimate Trucker Cap. NF0A4VUA', 'Constructed of cotton canvas this cap has a rugged canvas wash for a vintage look. The adjustable snapback closure allows a customized fit while mesh venting and eyelets provide breathability and ventilation on the warmest days. Fabric 100% cotton canvas front panels 100% polyester mesh back panelsStructure Structured Profile MidFeatures Washed-down cotton canvas; contrast embroidered The North Face logo embroidered on left middle panelClosure Adjustable snapback ','Asphalt Grey/ TNF White', 11.1, 18.5, 2002),
('The North Face Ultimate Trucker Cap. NF0A4VUA', 'Constructed of cotton canvas this cap has a rugged canvas wash for a vintage look. The adjustable snapback closure allows a customized fit while mesh venting and eyelets provide breathability and ventilation on the warmest days. Fabric 100% cotton canvas front panels 100% polyester mesh back panelsStructure Structured Profile MidFeatures Washed-down cotton canvas; contrast embroidered The North Face logo embroidered on left middle panelClosure Adjustable snapback ','TNF Black/ TNF Black', 11.1, 18.5, 2002),
('The North Face Ultimate Trucker Cap. NF0A4VUA', 'Constructed of cotton canvas this cap has a rugged canvas wash for a vintage look. The adjustable snapback closure allows a customized fit while mesh venting and eyelets provide breathability and ventilation on the warmest days. Fabric 100% cotton canvas front panels 100% polyester mesh back panelsStructure Structured Profile MidFeatures Washed-down cotton canvas; contrast embroidered The North Face logo embroidered on left middle panelClosure Adjustable snapback ','Burnt Olive Green/ Asphalt Grey', 11.1, 18.5, 2002),
('The North Face Ultimate Trucker Cap. NF0A4VUA', 'Constructed of cotton canvas this cap has a rugged canvas wash for a vintage look. The adjustable snapback closure allows a customized fit while mesh venting and eyelets provide breathability and ventilation on the warmest days. Fabric 100% cotton canvas front panels 100% polyester mesh back panelsStructure Structured Profile MidFeatures Washed-down cotton canvas; contrast embroidered The North Face logo embroidered on left middle panelClosure Adjustable snapback ','Urban Navy/ TNF White', 11.1, 18.5, 2002),
('The North Face Ultimate Trucker Cap. NF0A4VUA', 'Constructed of cotton canvas this cap has a rugged canvas wash for a vintage look. The adjustable snapback closure allows a customized fit while mesh venting and eyelets provide breathability and ventilation on the warmest days. Fabric 100% cotton canvas front panels 100% polyester mesh back panelsStructure Structured Profile MidFeatures Washed-down cotton canvas; contrast embroidered The North Face logo embroidered on left middle panelClosure Adjustable snapback ','TNF Blue/ TNF Black', 11.1, 18.5, 2002),
('The North Face Ultimate Trucker Cap. NF0A4VUA', 'Constructed of cotton canvas this cap has a rugged canvas wash for a vintage look. The adjustable snapback closure allows a customized fit while mesh venting and eyelets provide breathability and ventilation on the warmest days. Fabric 100% cotton canvas front panels 100% polyester mesh back panelsStructure Structured Profile MidFeatures Washed-down cotton canvas; contrast embroidered The North Face logo embroidered on left middle panelClosure Adjustable snapback ','TNF Black/ TNF White', 11.1, 18.5, 2002),
('The North Face Classic Cap. NF0A4VU9', 'Crafted from 100% recycled fabric for a broken-in look from the start this classic baseball cap keeps up with your outdoor lifestyle. Fabric 100% recycled polyester Structure StructuredProfile MidFeatures Contrast embroidered The North Face logo on left middle panel; woven back label with The North Face logoClosure Adjustable self-fabric strap ','TNF Black', 11.1, 18.5, 2002),
('The North Face Classic Cap. NF0A4VU9', 'Crafted from 100% recycled fabric for a broken-in look from the start this classic baseball cap keeps up with your outdoor lifestyle. Fabric 100% recycled polyester Structure StructuredProfile MidFeatures Contrast embroidered The North Face logo on left middle panel; woven back label with The North Face logoClosure Adjustable self-fabric strap ','Mid Grey', 11.1, 18.5, 2002),
('The North Face Classic Cap. NF0A4VU9', 'Crafted from 100% recycled fabric for a broken-in look from the start this classic baseball cap keeps up with your outdoor lifestyle. Fabric 100% recycled polyester Structure StructuredProfile MidFeatures Contrast embroidered The North Face logo on left middle panel; woven back label with The North Face logoClosure Adjustable self-fabric strap ','Asphalt Grey', 11.1, 18.5, 2002),
('The North Face Classic Cap. NF0A4VU9', 'Crafted from 100% recycled fabric for a broken-in look from the start this classic baseball cap keeps up with your outdoor lifestyle. Fabric 100% recycled polyester Structure StructuredProfile MidFeatures Contrast embroidered The North Face logo on left middle panel; woven back label with The North Face logoClosure Adjustable self-fabric strap ','Urban Navy', 11.1, 18.5, 2002),
('The North Face Classic Cap. NF0A4VU9', 'Crafted from 100% recycled fabric for a broken-in look from the start this classic baseball cap keeps up with your outdoor lifestyle. Fabric 100% recycled polyester Structure StructuredProfile MidFeatures Contrast embroidered The North Face logo on left middle panel; woven back label with The North Face logoClosure Adjustable self-fabric strap ','Timber Tan', 11.1, 18.5, 2002),
('The North Face Classic Cap. NF0A4VU9', 'Crafted from 100% recycled fabric for a broken-in look from the start this classic baseball cap keeps up with your outdoor lifestyle. Fabric 100% recycled polyester Structure StructuredProfile MidFeatures Contrast embroidered The North Face logo on left middle panel; woven back label with The North Face logoClosure Adjustable self-fabric strap ','TNF Blue', 11.1, 18.5, 2002),
('The North Face Mountain Beanie. NF0A4VUB', 'Made of 100% recycled fabric this beanie is made for snow shoveling or just walking in the woods. A fleece liner adds cozy warmth in cold conditions. Fabric 50% recycled polyester body 50% recycled polyester fleece Features Helps reduce landfill waste and the use of virgin materials; woven The North Face logo label ','TNF Black', 9.9, 16.5, 2002),
('The North Face Mountain Beanie. NF0A4VUB', 'Made of 100% recycled fabric this beanie is made for snow shoveling or just walking in the woods. A fleece liner adds cozy warmth in cold conditions. Fabric 50% recycled polyester body 50% recycled polyester fleece Features Helps reduce landfill waste and the use of virgin materials; woven The North Face logo label ','Asphalt Grey', 9.9, 16.5, 2002),
('The North Face Mountain Beanie. NF0A4VUB', 'Made of 100% recycled fabric this beanie is made for snow shoveling or just walking in the woods. A fleece liner adds cozy warmth in cold conditions. Fabric 50% recycled polyester body 50% recycled polyester fleece Features Helps reduce landfill waste and the use of virgin materials; woven The North Face logo label ','TNF Dark Grey Heather', 9.9, 16.5, 2002),
('The North Face Mountain Beanie. NF0A4VUB', 'Made of 100% recycled fabric this beanie is made for snow shoveling or just walking in the woods. A fleece liner adds cozy warmth in cold conditions. Fabric 50% recycled polyester body 50% recycled polyester fleece Features Helps reduce landfill waste and the use of virgin materials; woven The North Face logo label ','Urban Navy', 9.9, 16.5, 2002),
('The North Face Mountain Beanie. NF0A4VUB', 'Made of 100% recycled fabric this beanie is made for snow shoveling or just walking in the woods. A fleece liner adds cozy warmth in cold conditions. Fabric 50% recycled polyester body 50% recycled polyester fleece Features Helps reduce landfill waste and the use of virgin materials; woven The North Face logo label ','TNF Blue', 9.9, 16.5, 2002),
('The North Face Mountain Beanie. NF0A4VUB', 'Made of 100% recycled fabric this beanie is made for snow shoveling or just walking in the woods. A fleece liner adds cozy warmth in cold conditions. Fabric 50% recycled polyester body 50% recycled polyester fleece Features Helps reduce landfill waste and the use of virgin materials; woven The North Face logo label ','Cardinal Red', 9.9, 16.5, 2002),
('The North Face Mountain Beanie. NF0A4VUB', 'Made of 100% recycled fabric this beanie is made for snow shoveling or just walking in the woods. A fleece liner adds cozy warmth in cold conditions. Fabric 50% recycled polyester body 50% recycled polyester fleece Features Helps reduce landfill waste and the use of virgin materials; woven The North Face logo label ','Vintage White', 9.9, 16.5, 2002),
('The North Face Mountain Beanie. NF0A4VUB', 'Made of 100% recycled fabric this beanie is made for snow shoveling or just walking in the woods. A fleece liner adds cozy warmth in cold conditions. Fabric 50% recycled polyester body 50% recycled polyester fleece Features Helps reduce landfill waste and the use of virgin materials; woven The North Face logo label ','Burnt Olive Green', 9.9, 16.5, 2002),
('The North Face Mountain Beanie. NF0A4VUB', 'Made of 100% recycled fabric this beanie is made for snow shoveling or just walking in the woods. A fleece liner adds cozy warmth in cold conditions. Fabric 50% recycled polyester body 50% recycled polyester fleece Features Helps reduce landfill waste and the use of virgin materials; woven The North Face logo label ','Timber Tan', 9.9, 16.5, 2002),
('The North Face Mountain Beanie. NF0A4VUB', 'Made of 100% recycled fabric this beanie is made for snow shoveling or just walking in the woods. A fleece liner adds cozy warmth in cold conditions. Fabric 50% recycled polyester body 50% recycled polyester fleece Features Helps reduce landfill waste and the use of virgin materials; woven The North Face logo label ','Blue Wing', 9.9, 16.5, 2002),
('Carhartt Watch Cap 2.0 CT104597', 'Soft to the touch this timeless cap is stretchy rib knit for a stay-put fit. 100% acrylic stretchable rib knit fabric Carhartt label sewn on left side An updated version of the classic CTA18 Offered in the same colors previously offered in the CTA18 ','Coal Heather', 11.9, 17, 2001),
('Carhartt Watch Cap 2.0 CT104597', 'Soft to the touch this timeless cap is stretchy rib knit for a stay-put fit. 100% acrylic stretchable rib knit fabric Carhartt label sewn on left side An updated version of the classic CTA18 Offered in the same colors previously offered in the CTA18 ','Dark Brown/ Sandstone', 11.9, 17, 2001),
('Carhartt Watch Cap 2.0 CT104597', 'Soft to the touch this timeless cap is stretchy rib knit for a stay-put fit. 100% acrylic stretchable rib knit fabric Carhartt label sewn on left side An updated version of the classic CTA18 Offered in the same colors previously offered in the CTA18 ','Black', 11.9, 17, 2001),
('Carhartt Watch Cap 2.0 CT104597', 'Soft to the touch this timeless cap is stretchy rib knit for a stay-put fit. 100% acrylic stretchable rib knit fabric Carhartt label sewn on left side An updated version of the classic CTA18 Offered in the same colors previously offered in the CTA18 ','Brite Lime', 11.9, 17, 2001),
('Carhartt Watch Cap 2.0 CT104597', 'Soft to the touch this timeless cap is stretchy rib knit for a stay-put fit. 100% acrylic stretchable rib knit fabric Carhartt label sewn on left side An updated version of the classic CTA18 Offered in the same colors previously offered in the CTA18 ','Brite Orange', 11.9, 17, 2001),
('Carhartt Watch Cap 2.0 CT104597', 'Soft to the touch this timeless cap is stretchy rib knit for a stay-put fit. 100% acrylic stretchable rib knit fabric Carhartt label sewn on left side An updated version of the classic CTA18 Offered in the same colors previously offered in the CTA18 ','Navy', 11.9, 17, 2001),
('Carhartt Watch Cap 2.0 CT104597', 'Soft to the touch this timeless cap is stretchy rib knit for a stay-put fit. 100% acrylic stretchable rib knit fabric Carhartt label sewn on left side An updated version of the classic CTA18 Offered in the same colors previously offered in the CTA18 ','Carhartt Brown', 11.9, 17, 2001),
('Carhartt Watch Cap 2.0 CT104597', 'Soft to the touch this timeless cap is stretchy rib knit for a stay-put fit. 100% acrylic stretchable rib knit fabric Carhartt label sewn on left side An updated version of the classic CTA18 Offered in the same colors previously offered in the CTA18 ','Heather Grey', 11.9, 17, 2001),
('Carhartt Watch Cap 2.0 CT104597', 'Soft to the touch this timeless cap is stretchy rib knit for a stay-put fit. 100% acrylic stretchable rib knit fabric Carhartt label sewn on left side An updated version of the classic CTA18 Offered in the same colors previously offered in the CTA18 ','Black/ White', 11.9, 17, 2001),
('Nike Team Beanie. CW6117', 'This warm cuffed beanie is perfect for the stands or the street. The contrast high-density Swoosh logo is embroidered at cuff. Made of 100% Dri-FIT acrylic. ','Anthracite', 9.3, 18.6, 2000),
('Nike Team Beanie. CW6117', 'This warm cuffed beanie is perfect for the stands or the street. The contrast high-density Swoosh logo is embroidered at cuff. Made of 100% Dri-FIT acrylic. ','Black', 9.3, 18.6, 2000),
('Nike Team Beanie. CW6117', 'This warm cuffed beanie is perfect for the stands or the street. The contrast high-density Swoosh logo is embroidered at cuff. Made of 100% Dri-FIT acrylic. ','College Navy', 9.3, 18.6, 2000),
('Nike Team Beanie. CW6117', 'This warm cuffed beanie is perfect for the stands or the street. The contrast high-density Swoosh logo is embroidered at cuff. Made of 100% Dri-FIT acrylic. ','Game Royal', 9.3, 18.6, 2000),
('Nike Team Beanie. CW6117', 'This warm cuffed beanie is perfect for the stands or the street. The contrast high-density Swoosh logo is embroidered at cuff. Made of 100% Dri-FIT acrylic. ','Gorge Green', 9.3, 18.6, 2000),
('Nike Team Beanie. CW6117', 'This warm cuffed beanie is perfect for the stands or the street. The contrast high-density Swoosh logo is embroidered at cuff. Made of 100% Dri-FIT acrylic. ','Medium Grey', 9.3, 18.6, 2000),
('Nike Team Beanie. CW6117', 'This warm cuffed beanie is perfect for the stands or the street. The contrast high-density Swoosh logo is embroidered at cuff. Made of 100% Dri-FIT acrylic. ','University Red', 9.3, 18.6, 2000),
('Carhartt Rugged Professional Series Cap. CT103056', 'This all-star canvas hat has stretch technology and a sweat-fighting band. 59/39/2 cotton/poly/spandex with 100% polyester mesh back Carhartt Force  sweatband fights odors; FastDry  technology wicks away sweat for comfort Structured Mid profile Pre-curved visor Adjustable fit with plastic closure Carhartt label sewn on side ','Shadow Grey', 10.2, 17, 2001),
('Carhartt Knit Insulated Face Mask CT104485', 'Keep your face warm on those brutally cold days when the work still needs to get done. 100% acrylic stretchable rib knit fabric 3M Thinsulate Flex 40-gram insulation for warmth Overlock stitching around eye opening Extra-long neck enhances cold-weather protection Carhartt label sewn on neck ','Black', 15, 25, 2001),
('Carhartt Knit Insulated Face Mask CT104485', 'Keep your face warm on those brutally cold days when the work still needs to get done. 100% acrylic stretchable rib knit fabric 3M Thinsulate Flex 40-gram insulation for warmth Overlock stitching around eye opening Extra-long neck enhances cold-weather protection Carhartt label sewn on neck ','Carhartt Brown', 15, 25, 2001),
('Carhartt Knit Insulated Face Mask CT104485', 'Keep your face warm on those brutally cold days when the work still needs to get done. 100% acrylic stretchable rib knit fabric 3M Thinsulate Flex 40-gram insulation for warmth Overlock stitching around eye opening Extra-long neck enhances cold-weather protection Carhartt label sewn on neck ','Coal Heather', 15, 25, 2001),
('The North Face Truckstop Beanie NF0A5FXY', 'An adjustable cuff means this warm versatile beanie can be worn with a slouchier look. 100% acrylic Adjustable cuff height Woven The North Face fold over label at cuff ','New Taupe Green', 9.9, 16.5, 2002),
('The North Face Truckstop Beanie NF0A5FXY', 'An adjustable cuff means this warm versatile beanie can be worn with a slouchier look. 100% acrylic Adjustable cuff height Woven The North Face fold over label at cuff ','TNF Black', 9.9, 16.5, 2002),
('The North Face Truckstop Beanie NF0A5FXY', 'An adjustable cuff means this warm versatile beanie can be worn with a slouchier look. 100% acrylic Adjustable cuff height Woven The North Face fold over label at cuff ','TNF Black Heather', 9.9, 16.5, 2002),
('The North Face Truckstop Beanie NF0A5FXY', 'An adjustable cuff means this warm versatile beanie can be worn with a slouchier look. 100% acrylic Adjustable cuff height Woven The North Face fold over label at cuff ','Urban Navy Heather', 9.9, 16.5, 2002),
('The North Face Truckstop Beanie NF0A5FXY', 'An adjustable cuff means this warm versatile beanie can be worn with a slouchier look. 100% acrylic Adjustable cuff height Woven The North Face fold over label at cuff ','Asphalt Grey', 9.9, 16.5, 2002),
('The North Face Circular Rib Beanie NF0A7RGH', 'With its circular knit construction this timeless beanie is a cold-weather must-have on the trail or in the streets. An adjustable cuff height leaves your styling options open. A fleece liner helps keep warmth in where you need it most. 100% acrylic Circular rib knit construction with darts for shaping on top of crown Adjustable cuff height Fleece lined Woven The North Face fold over label at cuff ','Asphalt Grey', 9.9, 16.5, 2002),
('The North Face Circular Rib Beanie NF0A7RGH', 'With its circular knit construction this timeless beanie is a cold-weather must-have on the trail or in the streets. An adjustable cuff height leaves your styling options open. A fleece liner helps keep warmth in where you need it most. 100% acrylic Circular rib knit construction with darts for shaping on top of crown Adjustable cuff height Fleece lined Woven The North Face fold over label at cuff ','TNF Black', 9.9, 16.5, 2002),
('The North Face Circular Rib Beanie NF0A7RGH', 'With its circular knit construction this timeless beanie is a cold-weather must-have on the trail or in the streets. An adjustable cuff height leaves your styling options open. A fleece liner helps keep warmth in where you need it most. 100% acrylic Circular rib knit construction with darts for shaping on top of crown Adjustable cuff height Fleece lined Woven The North Face fold over label at cuff ','TNF Medium Grey Heather', 9.9, 16.5, 2002),
('The North Face Circular Rib Beanie NF0A7RGH', 'With its circular knit construction this timeless beanie is a cold-weather must-have on the trail or in the streets. An adjustable cuff height leaves your styling options open. A fleece liner helps keep warmth in where you need it most. 100% acrylic Circular rib knit construction with darts for shaping on top of crown Adjustable cuff height Fleece lined Woven The North Face fold over label at cuff ','TNF Yellow', 9.9, 16.5, 2002),
('The North Face Circular Rib Beanie NF0A7RGH', 'With its circular knit construction this timeless beanie is a cold-weather must-have on the trail or in the streets. An adjustable cuff height leaves your styling options open. A fleece liner helps keep warmth in where you need it most. 100% acrylic Circular rib knit construction with darts for shaping on top of crown Adjustable cuff height Fleece lined Woven The North Face fold over label at cuff ','Urban Navy', 9.9, 16.5, 2002),
('The North Face Pom Beanie NF0A7RGI', 'Complete with a pom this comfortable beanie has a classic look with The North Face sense of adventure. 100% acrylic Thick top pom Woven The North Face fold over label at cuff ','Shady Blue', 11.1, 18.5, 2002),
('The North Face Pom Beanie NF0A7RGI', 'Complete with a pom this comfortable beanie has a classic look with The North Face sense of adventure. 100% acrylic Thick top pom Woven The North Face fold over label at cuff ','TNF Black Heather', 11.1, 18.5, 2002),
('The North Face Pom Beanie NF0A7RGI', 'Complete with a pom this comfortable beanie has a classic look with The North Face sense of adventure. 100% acrylic Thick top pom Woven The North Face fold over label at cuff ','Vintage White', 11.1, 18.5, 2002),
('Nike Dri-FIT Team Visor NKDC4217', 'This lightweight three-panel visor features a pre-curved bill and an interior Dri-FIT performance sweatband that folds down for easy embroidery. Hook and loop closure. The contrast Swoosh logo is embroidered on the left-side panel. Made of 100% Dri-FIT polyester twill.** ','Anthracite', 10.8, 21.6, 2000),
('Nike Dri-FIT Team Visor NKDC4217', 'This lightweight three-panel visor features a pre-curved bill and an interior Dri-FIT performance sweatband that folds down for easy embroidery. Hook and loop closure. The contrast Swoosh logo is embroidered on the left-side panel. Made of 100% Dri-FIT polyester twill.** ','Black', 10.8, 21.6, 2000),
('Nike Dri-FIT Team Visor NKDC4217', 'This lightweight three-panel visor features a pre-curved bill and an interior Dri-FIT performance sweatband that folds down for easy embroidery. Hook and loop closure. The contrast Swoosh logo is embroidered on the left-side panel. Made of 100% Dri-FIT polyester twill.** ','College Navy', 10.8, 21.6, 2000),
('Nike Dri-FIT Team Visor NKDC4217', 'This lightweight three-panel visor features a pre-curved bill and an interior Dri-FIT performance sweatband that folds down for easy embroidery. Hook and loop closure. The contrast Swoosh logo is embroidered on the left-side panel. Made of 100% Dri-FIT polyester twill.** ','Court Purple', 10.8, 21.6, 2000),
('Nike Dri-FIT Team Visor NKDC4217', 'This lightweight three-panel visor features a pre-curved bill and an interior Dri-FIT performance sweatband that folds down for easy embroidery. Hook and loop closure. The contrast Swoosh logo is embroidered on the left-side panel. Made of 100% Dri-FIT polyester twill.** ','Game Royal', 10.8, 21.6, 2000),
('Nike Dri-FIT Team Visor NKDC4217', 'This lightweight three-panel visor features a pre-curved bill and an interior Dri-FIT performance sweatband that folds down for easy embroidery. Hook and loop closure. The contrast Swoosh logo is embroidered on the left-side panel. Made of 100% Dri-FIT polyester twill.** ','Khaki', 10.8, 21.6, 2000),
('Nike Dri-FIT Team Visor NKDC4217', 'This lightweight three-panel visor features a pre-curved bill and an interior Dri-FIT performance sweatband that folds down for easy embroidery. Hook and loop closure. The contrast Swoosh logo is embroidered on the left-side panel. Made of 100% Dri-FIT polyester twill.** ','University Red', 10.8, 21.6, 2000),
('Nike Dri-FIT Team Visor NKDC4217', 'This lightweight three-panel visor features a pre-curved bill and an interior Dri-FIT performance sweatband that folds down for easy embroidery. Hook and loop closure. The contrast Swoosh logo is embroidered on the left-side panel. Made of 100% Dri-FIT polyester twill.** ','Valor Blue', 10.8, 21.6, 2000),
('Nike Dri-FIT Team Visor NKDC4217', 'This lightweight three-panel visor features a pre-curved bill and an interior Dri-FIT performance sweatband that folds down for easy embroidery. Hook and loop closure. The contrast Swoosh logo is embroidered on the left-side panel. Made of 100% Dri-FIT polyester twill.** ','White', 10.8, 21.6, 2000);


/*
This query inserts values into Inventory Table
*/
INSERT INTO Inventory
(ProductID, Current_Stock_Level, Reorder_Level, Reorder_Quantity)
VALUES
(1000, 0, 2, 2),
(1001, 4, 2, 2),
(1002, 3, 2, 2),
(1003, 5, 1, 2),
(1004, 2, 1, 2),
(1005, 5, 2, 2),
(1006, 3, 1, 2),
(1007, 1, 1, 2),
(1008, 3, 1, 2),
(1009, 2, 2, 2),
(1010, 1, 3, 2),
(1011, 3, 3, 2),
(1012, 5, 1, 2),
(1013, 3, 3, 2),
(1014, 1, 2, 2),
(1015, 3, 3, 2),
(1016, 4, 2, 2),
(1017, 2, 1, 2),
(1018, 3, 3, 2),
(1019, 4, 3, 2),
(1020, 5, 2, 2),
(1021, 1, 2, 2),
(1022, 3, 2, 2),
(1023, 5, 2, 2),
(1024, 3, 3, 2),
(1025, 2, 1, 2),
(1026, 1, 1, 2),
(1027, 3, 2, 2),
(1028, 1, 2, 2),
(1029, 4, 1, 2),
(1030, 2, 2, 2),
(1031, 4, 1, 2),
(1032, 4, 1, 2),
(1033, 5, 1, 2),
(1034, 5, 2, 2),
(1035, 2, 1, 2),
(1036, 4, 1, 2),
(1037, 2, 1, 2),
(1038, 3, 3, 2),
(1039, 1, 2, 2),
(1040, 5, 3, 2),
(1041, 2, 2, 2),
(1042, 1, 2, 2),
(1043, 3, 1, 2),
(1044, 1, 1, 2),
(1045, 2, 3, 2),
(1046, 3, 3, 2),
(1047, 3, 3, 2),
(1048, 4, 3, 2),
(1049, 4, 3, 2),
(1050, 5, 3, 2),
(1051, 5, 1, 2),
(1052, 3, 2, 2),
(1053, 1, 1, 2),
(1054, 1, 3, 2),
(1055, 5, 1, 2),
(1056, 1, 2, 2),
(1057, 5, 3, 2),
(1058, 1, 2, 2),
(1059, 4, 1, 2),
(1060, 2, 3, 2),
(1061, 3, 2, 2),
(1062, 3, 3, 2),
(1063, 2, 3, 2),
(1064, 2, 3, 2),
(1065, 5, 3, 2),
(1066, 1, 3, 2),
(1067, 5, 2, 2),
(1068, 0, 0, 0),
(1069, 0, 0, 0),
(1070, 0, 0, 0),
(1071, 4, 3, 2),
(1072, 1, 1, 2),
(1073, 4, 2, 2),
(1074, 1, 2, 2),
(1075, 4, 2, 2),
(1076, 2, 2, 2),
(1077, 2, 2, 2),
(1078, 1, 3, 2),
(1079, 3, 2, 2),
(1080, 5, 1, 2),
(1081, 3, 1, 2),
(1082, 1, 2, 2),
(1083, 4, 2, 2),
(1084, 4, 1, 2),
(1085, 1, 2, 2),
(1086, 4, 3, 2),
(1087, 5, 3, 2),
(1088, 5, 3, 2),
(1089, 2, 3, 2),
(1090, 4, 3, 2),
(1091, 0, 3, 2),
(1092, 3, 3, 2),
(1093, 2, 1, 2),
(1094, 1, 3, 2),
(1095, 5, 2, 2),
(1096, 2, 2, 2),
(1097, 2, 2, 2),
(1098, 2, 1, 2),
(1099, 3, 1, 2),
(1100, 2, 3, 2),
(1101, 3, 2, 2),
(1102, 3, 2, 2),
(1103, 3, 1, 2),
(1104, 5, 1, 2),
(1105, 5, 1, 2),
(1106, 4, 3, 2),
(1107, 4, 3, 2),
(1108, 5, 3, 2),
(1109, 4, 3, 2),
(1110, 3, 1, 2),
(1111, 3, 3, 2),
(1112, 2, 1, 2),
(1113, 3, 3, 2),
(1114, 4, 1, 2),
(1115, 2, 2, 2),
(1116, 3, 2, 2),
(1117, 2, 2, 2),
(1118, 1, 2, 2),
(1119, 2, 2, 2),
(1120, 2, 2, 2),
(1121, 3, 3, 2),
(1122, 4, 2, 2),
(1123, 5, 3, 2),
(1124, 2, 3, 2),
(1125, 2, 1, 2),
(1126, 4, 2, 2),
(1127, 2, 2, 2),
(1128, 3, 1, 2),
(1129, 4, 2, 2),
(1130, 5, 1, 2),
(1131, 2, 1, 2),
(1132, 1, 1, 2),
(1133, 5, 2, 2),
(1134, 2, 1, 2),
(1135, 1, 2, 2),
(1136, 3, 1, 2),
(1137, 4, 1, 2),
(1138, 1, 1, 2),
(1139, 1, 1, 2),
(1140, 1, 2, 2),
(1141, 5, 3, 2),
(1142, 3, 3, 2),
(1143, 2, 1, 2),
(1144, 2, 2, 2),
(1145, 5, 3, 2),
(1146, 2, 2, 2),
(1147, 2, 3, 2),
(1148, 5, 3, 2),
(1149, 3, 2, 2),
(1150, 2, 1, 2),
(1151, 1, 3, 2),
(1152, 3, 3, 2),
(1153, 3, 1, 2),
(1154, 2, 3, 2),
(1155, 5, 2, 2),
(1156, 2, 2, 2),
(1157, 1, 2, 2),
(1158, 2, 3, 2),
(1159, 1, 1, 2),
(1160, 4, 3, 2),
(1161, 2, 1, 2),
(1162, 2, 2, 2),
(1163, 3, 3, 2),
(1164, 1, 1, 2),
(1165, 4, 2, 2),
(1166, 5, 3, 2),
(1167, 1, 3, 2),
(1168, 5, 2, 2),
(1169, 3, 2, 2),
(1170, 4, 2, 2),
(1171, 4, 1, 2),
(1172, 2, 2, 2),
(1173, 2, 1, 2),
(1174, 1, 1, 2);

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


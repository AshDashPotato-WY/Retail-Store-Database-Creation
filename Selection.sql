--Select Statements
use Caps_Retail_Company

--Selecting product based on name alphabetically
/*select product_name
from product
order by Product_Name asc;*/

--Selecting product based on the Nike Vendor
/*select VendorID
	 , product_name
from Product
where VendorID = '2000'
order by product_name;*/

--Selecting product based on Current Stock Level
select current_stock_level
	 , Reorder_level
	 , ProductID
from Inventory
where Reorder_level > current_stock_level
order by ProductID;

/*
This query shows how many products we have from each vendors
It updates along with inventories changes
*/
USE Caps_Retail_Company;

SELECT Vendor_Name as [Vendor Name]
     , COUNT(Current_Stock_Level) as [Inventory Amount]
FROM Vendor v JOIN Product p
    ON v.VendorID = p.VendorID
    JOIN Inventory i
    ON p.ProductID = i.ProductID
GROUP BY Vendor_Name
ORDER BY [Inventory Amount] DESC;

/*
This query shows how many inventories of one color we have
It updates along with inventories changes
*/
USE Caps_Retail_Company;

SELECT ProductID
     , Product_Name
     , Color
     , Vendor_Name
FROM Product p JOIN Vendor v 
    ON p.VendorID = v.VendorID 
WHERE Color like '%Navy%'
ORDER BY ProductID ASC;

/*
This query shows the most sold products
It updates along with inventories and orders changes
*/
USE Caps_Retail_Company;

SELECT Product_Name as [Product Name]
     , Vendor_Name as [Vendor]
     , SUM(Quantity) as [Amount of Sales]
     , SUM(Row_Total) as [Sum of Sales]
FROM Vendor v JOIN PRODUCT p 
    ON v.VendorID = p.VendorID
    JOIN Invoice_Items ii 
    ON p.ProductID = ii.ProductID
GROUP BY Product_Name, Vendor_Name
HAVING SUM(Quantity) > 1
ORDER BY [Amount of Sales] DESC;

/*
This query shows monthly/annual transactions reports
It updates along with inventories and orders changes
*/
USE Caps_Retail_Company;

SELECT Month(Order_Date) as [Month]
     , SUM(Total) as [Total Sales]
     , SUM( Row_Total - Quantity * Wholesale_Price) as [Profits]
FROM Invoice i JOIN Invoice_Items ii 
    ON i.InvoiceID = ii.InvoiceID
    JOIN Product p 
    ON ii.ProductID = p.ProductID
WHERE YEAR(Order_Date) = '2020'
GROUP BY Month(Order_Date)
ORDER BY [Total Sales];

/*
This query shows our loyal customers and their spending report monthly/yearly
It updates along with orders and contacts changes
*/
USE Caps_Retail_Company;

SELECT CONCAT( fname,' ',lname) as [Customer Name]
     , SUM(Total) as [Total Spending]
FROM Contacts c JOIN Invoice i 
    ON c.ContactID = i.CustomerID
    JOIN Invoice_Items ii 
    ON i.InvoiceID = ii.InvoiceID
-- WHERE year(Order_Date) = '2020' AND month(Order_Date) = '10'  -- Adjust date to get monthly and annual report
GROUP BY CONCAT( fname,' ',lname)
ORDER BY [Total Spending] DESC;


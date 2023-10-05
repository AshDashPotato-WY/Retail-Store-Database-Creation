USE master
GO
IF NOT EXISTS (
 SELECT name
 FROM sys.databases
 WHERE name = N'Caps_Retail_Company'
)
 CREATE DATABASE [Caps_Retail_Company];
GO
IF SERVERPROPERTY('ProductVersion') > '12'
 ALTER DATABASE [Caps_Retail_Company] SET QUERY_STORE=ON;
GO
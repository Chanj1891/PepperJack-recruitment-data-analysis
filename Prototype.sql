	IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = N'prototype')
		BEGIN
			CREATE DATABASE prototype
		END;

	USE prototype;
	GO

	sp_configure 'show advanced options', 1;  
	RECONFIGURE;
	GO 
	sp_configure 'Ad Hoc Distributed Queries', 1;  
	GO
	RECONFIGURE; 

	SELECT *
	FROM OPENROWSET(
		'Microsoft.ACE.OLEDB.12.0',
		'Excel 12.0; HDR=YES; Database=C:\Users\Chandan J\Desktop\prototype\Employer.xlsx',
		sheet1$);

	SELECT *
	FROM OPENROWSET(
		'Microsoft.ACE.OLEDB.12.0',
		'Excel 12.0; HDR=YES; Database=C:\Users\Chandan J\Desktop\prototype\Location.xlsx',
		sheet2$);

	SELECT *
	FROM OPENROWSET(
		'Microsoft.ACE.OLEDB.12.0',
		'Excel 12.0; HDR=YES; Database=C:\Users\Chandan J\Desktop\prototype\NAICS.xlsx',
		sheet3$);

	SELECT *
	FROM OPENROWSET(
		'Microsoft.ACE.OLEDB.12.0',
		'Excel 12.0; HDR=YES; Database=C:\Users\Chandan J\Desktop\prototype\Position.xlsx',
		sheet4$);

	EXEC dbo.createTables;
	GO
	EXEC dbo.insertToTables;
	GO


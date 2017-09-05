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

	-- If the table already exists the table will be dropped and a fresh one will be created with new tables 

	IF EXISTS (SELECT * FROM sys.databases WHERE name = N'sheet1$')
	BEGIN
		drop table sheet1$;
	END

	SELECT *
	FROM OPENROWSET(
		'Microsoft.ACE.OLEDB.12.0',
		'Excel 12.0; HDR=YES; Database=C:\Users\Chandan J\Desktop\prototype\Employer.xlsx',
		sheet1$);
	
	IF EXISTS (SELECT * FROM sys.databases WHERE name = N'sheet2$')
	BEGIN
		drop table sheet2$;
	END
	SELECT *
	FROM OPENROWSET(
		'Microsoft.ACE.OLEDB.12.0',
		'Excel 12.0; HDR=YES; Database=C:\Users\Chandan J\Desktop\prototype\Location.xlsx',
		sheet2$);
	
	IF EXISTS (SELECT * FROM sys.databases WHERE name = N'sheet3$')
	BEGIN
		drop table sheet3$;
	END
	SELECT *
	FROM OPENROWSET(
		'Microsoft.ACE.OLEDB.12.0',
		'Excel 12.0; HDR=YES; Database=C:\Users\Chandan J\Desktop\prototype\NAICS.xlsx',
		sheet3$);

	IF EXISTS (SELECT * FROM sys.databases WHERE name = N'sheet4$')
	BEGIN
		drop table sheet4$;
	END
	SELECT *
	FROM OPENROWSET(
		'Microsoft.ACE.OLEDB.12.0',
		'Excel 12.0; HDR=YES; Database=C:\Users\Chandan J\Desktop\prototype\Position.xlsx',
		sheet4$);

	EXEC dbo.createTables;
	GO
	EXEC dbo.insertToTables;
	GO


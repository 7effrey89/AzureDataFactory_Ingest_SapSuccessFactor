-----------------------------Creating schemas for framework----------------------------------
CREATE SCHEMA etl
GO
-----------------------------Creating sample schemas for sinking data----------------------------------
CREATE SCHEMA STG_SCSFCTR
GO
CREATE SCHEMA SRC_SCSFCTR
GO
------------------------------Table to contain list of tables to be extracted---------------------------------
create table [etl].watermark (
	srcSystem varchar(150),
	srcTableName varchar(150),
	srcSchemaName varchar(150),
	stgTableName varchar(150),
	stgSchemaName varchar(150),
	baseTableName varchar(150),
	baseSchemaName varchar(150),
	destinationDB varchar(150),
	lastLoadDateTime datetime,
	lastLoadDouble numeric(18,0),
	isEnabled bit
) 
------------------------------Table to contain mapping between source and destination column----------------------------------
Create table [etl].ColumnMapping  (
	[srcSystem] VARCHAR(100),
	[schema_name] VARCHAR(100),
	[table_name] VARCHAR(100),
	[source_column] VARCHAR(100),
	[target_column]VARCHAR(100),
	[LastUpdate_column]VARCHAR(100),
	[primaryKey]VARCHAR(100)
)
Go
----------------------------Procedure to retrieve column mapping----------------------------------
CREATE OR ALTER PROCEDURE [etl].[sp_getColumnMapping_SAP_SuccessFactor]
  @table_name VARCHAR(100),
  @schema_name VARCHAR(100)
AS
BEGIN
  DECLARE @json_construct varchar(MAX) = '{"type": "TabularTranslator", "mappings": {X}, "collectionReference": "$[''d''][''results'']"}';
  DECLARE @json VARCHAR(MAX);
    
  SET @json = (
    SELECT
        '[''' + c.[source_column] + ''']' AS 'source.path', 
        c.[target_column] AS 'sink.path' 
    FROM [etl].ColumnMapping as c
  WHERE c.[schema_name] = @schema_name
    AND c.[table_name] = @table_name
	--AND c.[source_column] = 'userid'
    FOR JSON PATH );
 
    SELECT REPLACE(@json_construct,'{X}', @json) AS json_output;
END
GO
--Example of a proc call
--EXEC [etl].[sp_getColumnMapping_SAP_SuccessFactor] @schema_name='SRC_JDEE1', @table_name='F0005_2'
------------------------------Example----------------------------------
--{
--	"type": "TabularTranslator", 
--	"mappings": [
--		{"source":{"path":"['addressLine1']"},"sink":{"path":"ADDRESSLINE1"}}
--		,{"source":{"path":"['addressLine2']"},"sink":{"path":"ADDRESSLINE2"}}
--		,{"source":{"path":"['addressLine3']"},"sink":{"path":"ADDRESSLINE3"}}
--		,{"source":{"path":"['zipCode']"},"sink":{"path":"ZIPCODE"}}
--	],
--	"collectionReference": "$['d']['results']"
--}

--Creating destination tables for sinking SAP success factor data
Create table STG_SCSFCTR.[user](
	addressLine1 varchar(150),
	addressLine2 varchar(150),
	addressLine3 varchar(150)
)
Create table STG_SCSFCTR.[EMPJOB](
	jobTitle varchar(150),
	userId varchar(150)
)
Create table STG_SCSFCTR.[PERPERSONAL](
	firstName varchar(150),
	formalName varchar(150)
)
Create table STG_SCSFCTR.[FODEPARTMENT](
	[name] varchar(150),
	costCenter varchar(150)
)

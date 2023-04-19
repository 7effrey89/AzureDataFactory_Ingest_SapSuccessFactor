INSERT INTO etl.watermark (srcSystem, srcSchemaName, srcTableName,stgSchemaName, stgTableName, baseSchemaName, baseTableName, destinationDB, lastLoadDouble, isEnabled) VALUES ('SCSFCTR','','User','STG_SCSFCTR','USER','SRC_SCSFCTR','USER','DEV_ADF_RL_DB',0,1)
INSERT INTO etl.watermark (srcSystem, srcSchemaName, srcTableName,stgSchemaName, stgTableName, baseSchemaName, baseTableName, destinationDB, lastLoadDouble, isEnabled) VALUES ('SCSFCTR','','EmpJob','STG_SCSFCTR','EMPJOB','SRC_SCSFCTR','EMPJOB','DEV_ADF_RL_DB',0,1)
INSERT INTO etl.watermark (srcSystem, srcSchemaName, srcTableName,stgSchemaName, stgTableName, baseSchemaName, baseTableName, destinationDB, lastLoadDouble, isEnabled) VALUES ('SCSFCTR','','FODepartment','STG_SCSFCTR','FODEPARTMENT','SRC_SCSFCTR','FODEPARTMENT','DEV_ADF_RL_DB',0,1)
INSERT INTO etl.watermark (srcSystem, srcSchemaName, srcTableName,stgSchemaName, stgTableName, baseSchemaName, baseTableName, destinationDB, lastLoadDouble, isEnabled) VALUES ('SCSFCTR','','PerPersonal','STG_SCSFCTR','PERPERSONAL','SRC_SCSFCTR','PERPERSONAL','DEV_ADF_RL_DB',0,1)
	
insert into [etl].[ColumnMapping] ([srcSystem],[schema_name],[table_name],[source_column],[target_column]) values ('SCSFCTR','SRC_SCSFCTR', 'USER', 'addressLine1','ADDRESSLINE1')
insert into [etl].[ColumnMapping] ([srcSystem],[schema_name],[table_name],[source_column],[target_column]) values ('SCSFCTR','SRC_SCSFCTR', 'USER', 'addressLine2','ADDRESSLINE2')
insert into [etl].[ColumnMapping] ([srcSystem],[schema_name],[table_name],[source_column],[target_column]) values ('SCSFCTR','SRC_SCSFCTR', 'USER', 'addressLine3','ADDRESSLINE3')

insert into [etl].[ColumnMapping] ([srcSystem],[schema_name],[table_name],[source_column],[target_column]) values ('SCSFCTR','SRC_SCSFCTR', 'EMPJOB', 'jobTitle','JOBTITLE')
insert into [etl].[ColumnMapping] ([srcSystem],[schema_name],[table_name],[source_column],[target_column]) values ('SCSFCTR','SRC_SCSFCTR', 'EMPJOB', 'userId','USERID')

insert into [etl].[ColumnMapping] ([srcSystem],[schema_name],[table_name],[source_column],[target_column]) values ('SCSFCTR','SRC_SCSFCTR', 'PERPERSONAL', 'firstName','FIRSTNAME')
insert into [etl].[ColumnMapping] ([srcSystem],[schema_name],[table_name],[source_column],[target_column]) values ('SCSFCTR','SRC_SCSFCTR', 'PERPERSONAL', 'formalName','FORMALNAME')

insert into [etl].[ColumnMapping] ([srcSystem],[schema_name],[table_name],[source_column],[target_column]) values ('SCSFCTR','SRC_SCSFCTR', 'FODEPARTMENT', 'name','NAME')
insert into [etl].[ColumnMapping] ([srcSystem],[schema_name],[table_name],[source_column],[target_column]) values ('SCSFCTR','SRC_SCSFCTR', 'FODEPARTMENT', 'costCenter','COSTCENTER')



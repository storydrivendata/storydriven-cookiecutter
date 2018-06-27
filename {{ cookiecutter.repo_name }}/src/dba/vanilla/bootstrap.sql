.mode csv
.bail on
.echo on

-- drop/create new tables
.open ./data/processed/__DATABASE_NAME__.vanilla.sqlite
.read ./src/dba/vanilla/schema.sql

-- import the data
.changes on
.import ./data/raw/__DATAFILE_NAME__.csv __TABLE_NAME__

-- index the data
.read ./src/dba/vanilla/indexes.sql


-- remove the repeated headers
DELETE FROM __TABLE_NAME__ WHERE __SOME_ID_COL__ = '__SOME_ID_COL__';

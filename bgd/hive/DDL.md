## Data Definition Language

- Create
    ````sql
    Create table if not exists dbname.tablename(
        id int Comment 'id comment',
        name string comment 'name comment',
        records array<string>,
        deductions map<string, float>
        adgress struct<street: string, city: string, state: string, zip: int> 
    )
    Comment 'this is comment about table'
    TBLPROPERTIES ('creator=user', 'created_at=2020-01-01')
    LOCATION '/user/hive/dbname.db/tablename;
    ````
    - If not exists: if the new schema differ from the current hive will not warn you
    - **TBLPROPERTIES** serves as additional info about table and in some cases can be used as table metadata
    - Default warehouse location ``/user/hive/warehouse``
      - Use external table avoid using default location 
    - Copy the schema of existing table
        ```
        create table if not exists dbname.tablename2
        like dbname.tablename1
        ```
- Alter
    - Modify only table metadata

- Drop

- Rename
# Databases

1. [Cloud SQL](#cloudsql)
2. [Cloud Datestore](#datastore)
3. [Bigtable](#bigtable)
4. [Cloud Spanner](#spanner)

## Cloud SQL <a name="cloudsql"></a>

- Postgresql
- Myqsl
- SQL Server
- Read replicas: used in case a read throughtput

## Cloud Datestore <a name="datastore"></a>
  
- No relational database
- NoSQL
- Transactional
- ACID support
- Is schema-less
- Uses SQL lile langangue **GQL**
- One Datastore per project
- ***Data structure***
  - Kind <=> Table
  - Entity <=> Row
  - Property <=> Column
  - Key <=> Primary Key
- Consistency:
  - How up to date are the results ?
  - Does the order matter ?
  - Two types of consistencies:
    - ***Strongly:*** order matter but quries are long
    - ***Enventualy:*** order not matter but quries are very fast

## Cloud Spanner <a name="spanner"></a>

- **Feature**
    - Fully managed
    - Highly scalable and available
    - Relational database
- **What is used for**
    - Mission critical databases which needs strong ACID
    - Wide scale availability
    - Support SQL
    - It's ***horizontaly*** scalable (more node) vs Vertical (RAM and CPU)
- **IAM**
    - Project, instance or database level
    - Role/Spanner
        - Admin
        - Database Admin: create/edit/delete and grant access to databases
        - Reader: read/execute database/schema
        - Viewer: view instances and databases
- Interleave table
- Avoid hotspoting
    - No sequential numbers with ID
    - No timestamps (also sequential)
    - Use descenfing order timestamp if is required

- Distingued from Cloud SQL by its **global consistent and size**
- Secondry indexes ?? 
# Databases

1. [Cloud SQL](#cloudsql)
2. [Cloud Datestore](#datastore)
3. [Bigtable](#bigtable)
4. [Cloud Spanner](#spanner)

## Cloud SQL <a name="cloudsql"></a>

- Postgresql
- Myqsl
- SQL Server

## Cloud Datestore <a name="datastore"></a>
  
- No relational database
- NoSQL
- One Datastore per project
- Data structure:
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

## Bigtable <a name="bigtable"></a>

- High performance and massively scalable NoSQL database
- ... for analytic workload
- What is sed for ?
    - High throughtput analytic
    - Huge datasets
- Access contorl
    - Project level or instance level
    - Read/Write/Manage access

## Cloud Spanner <a name="spanner"></a>

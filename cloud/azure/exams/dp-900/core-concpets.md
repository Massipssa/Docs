# Core concepts

## Data format
- Structured (relational db)
- Semi-structured (json, csv, ...)
- Unstructured (images, videos, audios, binary files, ...)

## Databases
- Relational
- NoSql
  - Key-value
  - Document: a specific form of key-value 
  - Column oriented: uses column family to group a set of columns
  - Graph: store entities as nodes and links to define relationship between them  

## Transactional processing 
- Online Transactional Processing (OLTP)
  -  Uses databases optimized for read and write
  -  Require system with ACID 
  -  Used to support live application called (LOB: line of busniss)

# Analytic processing 

- Read only 
- Rely on vast volumes of historical data or system metrics  
- **Data warehouses** are an established way to store data in a relational schema that is optimized for read operations – primarily queries to support reporting and data visualization. The data warehouse schema may require some denormalization of data in an OLTP data source (introducing some duplication to make queries perform faster) (Source Azure)
- online analytical processing (OLAP)

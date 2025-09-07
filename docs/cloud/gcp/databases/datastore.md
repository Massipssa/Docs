# Cloud Datastore
  
- No relational database
- NoSQL
- Transactional
- ACID support
- Is schema-less
- Uses SQL like language **GQL**
- One Datastore per project
- ***Data structure***
  - Kind ``<=>`` Table
  - Entity ``<=>`` Row
  - Property ``<=>`` Column
  - Key ``<=>`` Primary Key
- Consistency:
  - How up to date are the results ?
  - Does the order matter ?
  - Two types of consistencies:
    - ***Strongly:*** order matter but queries are long
    - ***Eventually:*** order not matter but queries are very fast

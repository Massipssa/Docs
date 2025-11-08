# Data Transformation

## Querying

- Allows to retrieve data and act on data
- DDL, DML, DCL, and TCL
- Life cycle
  - Query issued
  - Parsing and conversion to byte code
  - Query planning and optimization
  - Query execution
  - Result returned
- Query optimizer
  - It breaks the query into a step into an efficient manner
  - It assess joins, indexes, data size and other factors
  - Attempts to exectute the query in the latest expensive manner
  - Every database (execution engine) is different and execute query in its proper way
  - You need to know how to analyze query's performence
- Improving query performance
  - Optimize the join strategy and schema
  - Joins types: inner, outer, left and cross
  - Methods
    - Prejoin data
    - Consider the details and the complexity of the joins conditions (complex joins may consumer significate computational resources)
    - Use CTEs instead of subqueries or temporary tables
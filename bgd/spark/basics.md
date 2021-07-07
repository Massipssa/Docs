## Why spark ? 
- In-memory 
- Lazy evaluation
- DAG for fault-tolerance and disaster recovery

## Transformations
- Narrow transformations
- Large transformations

## Action
There are three type of actions in spark
- Action to write to console (show, explain, ...)
- Action to collect data (collect, count, ...)
- Action to write to external data storage (write)

## Execution steps

- User code --> Logical plan --> Physical plan --> Execution (RDD manipulations)

- Unresolved Logical Plan 
  - Verify syntactic field
  - Semantic analysis
  
- Logical Plan
  - Check data structure, schema and types
  - It resolves types using Catalog
  
- Optimized Logical Plan
  - Apply some rules to optimize the logical plan
  - Reorder the logical operations to perform some optimizations

- Physical Plan
  - Catalyst Optimizer will generate many Physical Plans base on execution time and resource cosumption.
    Only one with the best cost performance will be chosen.  


## Notes
- For production, it's recommended to define a schema when we're dealing with untyped
  data sources like CSV and JSON.
- The most flexible way when dealing with selects in df is to use ``selectExpr``.  
- **Query Pushdown:** With JDBC Spark makes best-effort attempt to filter data in database itself before creating 
  the dataframe.
- Parquet with **GZIP** compression is recommended.   

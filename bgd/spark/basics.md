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

## Notes
- For production, it's recommended to define a schema when we're dealing with untyped
  data sources like CSV and JSON.
- The most flexible way when dealing with selects in df is to use ``selectExpr``.  
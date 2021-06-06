## View vs Materialized View

- View:
    - Never stored
    - Is a virtual copy of one or more base tables or views
    - Updated each time base table is update
    - Slow processing
    - Do not require disk space
    
- Materialized View
    - Is stored on the disk
    - Is a copy of physical base table
    - Has to be updated manually or using trigger
    - Fast processing
    - Requires disk space
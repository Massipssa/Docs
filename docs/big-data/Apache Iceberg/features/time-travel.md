# Time travel

Apache Iceberg provides two ways to run time-travel queries: using a timestamp and using a snapshot ID.


- Time travel using timestamp

```sql
SELECT *
FROM orders
TIMESTAMP AS OF '2023-03-07 20:45:08.914'
```

- Time travel using snapshot ID

```sql
SELECT *
FROM orders
VERSION AS OF 8333017788700497002
```

:::info

If you don’t provide the exact timestamp value, Iceberg will look for snapshots older than the specified value and return the results. If no older snapshots exist, Iceberg will throw an exception such as this:
IllegalArgumentException: Cannot find a snapshot older than ``<timestamp-value>``.

:::
## SQL

- Small table instead or larger ones (data denormalization)
- Select with fields names instead of SELECT *
- Use INNER JOIN instead of WHERE (Where creates more combinaison = more work)
- Do biggest join and filter per join
- Filter early and big with WHERE
- Partiton data (For BigQuery)
  - Partition by ingest time
  - Partition by specied data columns
- LIMIT does not affect performance

## Dataflow

- Handles errors
  - Gracefully catch errors using **Try-Catch** blocks
    - Output errors to **PCollection** and set the collector for the later analysis
    - Think about it as **recyling** the **bad** data
  - **How to update exiting code ?**
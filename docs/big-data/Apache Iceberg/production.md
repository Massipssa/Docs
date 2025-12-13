# Internal Iceberg Metadata ables

- [Internal Iceberg Metadata ables](#internal-iceberg-metadata-ables)
  - [history metadata table](#history-metadata-table)
  - [metadata\_log\_entries metadata table](#metadata_log_entries-metadata-table)
  - [snapshot metadata table](#snapshot-metadata-table)
  - [files table](#files-table)
  - [manifests metadata table](#manifests-metadata-table)
  - [partitions  metadata table](#partitions--metadata-table)
  - [all\_data\_files metadata table](#all_data_files-metadata-table)
  - [all\_manifests metadata table](#all_manifests-metadata-table)
  - [ref metadata table](#ref-metadata-table)
  - [entries metadata table](#entries-metadata-table)

## history metadata table

Records the table's evolution. It can be used for data recovery and version control and as well as to indentify table rollbacks.
In case of errors of issues users can refer to snapshot history table to retrieve the ealier versions of data. By querying the table to get the snapshot before the disaster. The table can be rollback using the snapshot id.

```markdonw
+-----------------------+-------------------+---------+-------------------+
|made_current_at        |snapshot_id        |parent_id|is_current_ancestor|
+-----------------------+-------------------+---------+-------------------+
|2025-11-02 18:56:18.548|8206813798540384639|null     |true               |
+-----------------------+-------------------+---------+-------------------+
```

| Column  | Definition   |
|---|---|
| made_current_at  | timestamp when the snapshots was made. Gives a precise marker when the changes to the table were committed  |
|snapshot_id   | unique identifier for each snapshot. It enables to track and reference a specific  snapshos within table's hsitory  |
| parent_id  | unique id of parent snapshot of the current snapshot. This allows you to visualize how each snapshot is connected, making it easier to follow the table’s evolution over time.  |
| is_current_ancestor  | indicates whether the snapshot is an ancetor of the table or not  |

## metadata_log_entries metadata table

Track the evolution of the table by logging the metadata generated during table updates.

```
+-----------------------+-------------------------------------------------------------------------------------------+-------------------+----------------+----------------------+
|timestamp              |file                                                                                       |latest_snapshot_id |latest_schema_id|latest_sequence_number|
+-----------------------+-------------------------------------------------------------------------------------------+-------------------+----------------+----------------------+
|2025-11-02 18:56:18.548|warehouse/ecommerce_db/consumers1/metadata/v1.metadata.json                                |8206813798540384639|0               |1                     |
+-----------------------+-------------------------------------------------------------------------------------------+-------------------+----------------+----------------------+
```

- **timestamp**
- **file**
- **latest_snapshot_id**
- **latest_schema_id**
- **latest_sequence_number**

## snapshot metadata table

Tracks datasets **versions** and **histories**

## files table

The Files Metadata Table lists all current data files in an Iceberg table and provides rich details about each one—including file location, format, size, partition values, and content metadata.
This table is a core component of Iceberg, enabling fine-grained data processing, precise schema management, robust lineage tracking, and strong data-quality controls. It gives users deep visibility into how data is physically stored and managed.

Typical use cases include:

- Determining whether a partition needs to be rewritten
- Identifying partitions that require repair
- Calculating the total size of a snapshot
- Retrieving the list of files belonging to a previous snapshot

| Column  |  Description  |
|---|---|
| content  | type of the file (0: for data file, 1 position delete file, 2 for equality delete file)  |
| file_path  | exacte location of data file to facilitate access to file when needed  |
| file_format  | indicates the format of the file  like PARQUET, AVRO, ORC  |
| spec_id  | indicates the format of the file  like PARQUET, AVRO, ORC  |
| partition  | indicates the format of the file  like PARQUET, AVRO, ORC  |
| record_count  | the number of records contained within each file  |
| file_size_in_bytes  | the total size of file in bytes  |
| column_sizes  | the size of each individual column  |
| value_counts  | provides count of **non-null** values in each column  |
| null_value_counts  | provides count of **nnull** values in each column |
| nan_value_counts  | provides count of **NaN (Not a Number)** values in each column |
| lower_bounds  | minumun values in each column  |
| upper_bounds  | maximum values in each column  |
| key_metadata  | indicates the format of the file  like PARQUET, AVRO, ORC  |
| split_offsets  | indicates the format of the file  like PARQUET, AVRO, ORC  |
| equality_ids  | indicates the format of the file  like PARQUET, AVRO, ORC  |
| sort_order_id  | indicates the format of the file  like PARQUET, AVRO, ORC  |
| readable_metrics  |  human-readable representation of the file’s metadata including **column size**, **value counts**, **null counts**, and **lower and upper bounds**|

## manifests metadata table

## partitions  metadata table

## all_data_files metadata table

Provides  comprehensive details about every datafile across all valid snapshots in the table  
Helps to:

- Finding the largest table across all snapshots,
- Finding the total file size across all snapshots,
- Assessing partitions across snapshots

## all_manifests metadata table

## ref metadata table

List all named references within Iceberg table
Helps to understand and manage your table’ snapshot history and retention policy, making it a crucial part of maintaining data versioning and ensuring that your table’s size is under control

Use cases

- finding references at risk of losing snapshots
- finding the latest snapshot of a particular reference.

|Column   | Description   |
|---|---|
|  name | unique identifier for the reference    |
|  type | BRANCH: mutable, TAG: immutable  |
|  snapshot_id |   |
|  max_reference_age_in_ms |  the maximum duration in milliscondes that a snapshot can be referenced, if the age exceeded the snapshot will be candidates for cleaup during maintenance operation |
|  min_snapshots_to_keep |  lower limit on the number of snapshot to keep in history table. The number is always maintained even if the **max_reference_age_in_ms** exceeded |
|  max_snapshot_age_in_ms | the maximum age in milliseconds for any snapshot in the table. Snapshots that exceed this age could be removed by the maintenance operations,  unless  they  are  protected  by  the  **min_snapshots_to_keep** setting|

## entries metadata table

Offers  insightful  details  about  each operation  that  has  been  performed on  the  table’s  data  and  deletes  files  across  all snapshots

Use cases
- identifying files added in a particular snapshot
-  tracking changes to a file over time
-  tracking table size changes over time

| Column  | Description  |
|---|---|
| status  |  is an integer that indicates whether a file was added or deleted in the snapshot. A value of 0 represents an existing file, while 1 indicates an added file and 2 a deleted file |
| snapshot_id  | unique  identifier  of  the  snapshot  in  which  the  operation took place  |
| sequence_number  | indicates the order of operations  |
| file_sequence_number  |   |
| data_file  |   |
| readable_metrics  |   |
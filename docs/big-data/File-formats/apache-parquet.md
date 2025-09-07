# Apache Parquet

- Columnar oriented
- Self-describing: metadata including schema and structure is embedded within a file
- Advantages:
  - Compression
  - Encoding
  - Optimize I/O

## File Structure

A Parquet file is divided into row groups, column chunks, and pages:

```
Parquet File
 ├── Row Group 1
 │     ├── Column Chunk (col1)
 │     │      ├── Page 1
 │     │      ├── Page 2
 │     │      ...
 │     ├── Column Chunk (col2)
 │     │      ├── Page 1
 │     │      ├── Page 2
 │     ...
 ├── Row Group 2
 │     ├── Column Chunk (col1)
 │     ├── Column Chunk (col2)
 │     ...
 └── File Footer (schema + metadata)
```

- **Row group**
A horizontal partition of the data. Typically, a few MBs (default ~128MB). Each row group contains all the columns for a 
subset of rows.

!!! info
    This allows parallelism: different executors can process different row groups.

- **Column chunk**

Within a row group, each column is stored separately in a column chunk.

- **Page**

The smallest unit of storage. Usually 8KB–1MB. Two main types:

- **Data Page:** actual values. 
- **Dictionary Page:** optional; maps repeated values to dictionary indexes for compression.

- **File footer**

Stored at the end of the file. Contains schema, metadata (e.g., column types, encoding, statistics like min/max/null counts).

!!! tip
    This metadata is powerful: query engines can use it for predicate pushdown 
    (skip reading row groups where min > filter_value or max < filter_value).
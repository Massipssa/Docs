# Apache Parquet

Apache Parquet is a popular open-source columnar storage format optimized for analytical workloads in big data environments.

## Key Features

- **Columnar oriented:** Data is stored by column, enabling efficient compression and query performance.
- **Self-describing:** Metadata, including schema and structure, is embedded within each file.
- **Efficient compression and encoding:** Columnar storage allows for advanced compression and encoding techniques.
- **Optimized I/O:** Only relevant columns and row groups are read, reducing disk and network usage.
- **Interoperability:** Supported by many big data tools (Spark, Hive, Presto, Trino, Dremio, etc.).

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

### Components

- **Row Group:**  
  A horizontal partition of the data, typically a few MBs (default ~128MB). Each row group contains all columns for a subset of rows.

  !!! info
      Row groups enable parallelism: different executors can process different row groups independently.

- **Column Chunk:**  
  Within each row group, data for each column is stored separately as a column chunk. This layout enables efficient columnar reads and compression.

- **Page:**  
  The smallest unit of storage, usually 8KB–1MB. Two main types:
  - **Data Page:** Contains actual column values.
  - **Dictionary Page:** Optional; maps repeated values to dictionary indexes for better compression.

- **File Footer:**  
  Stored at the end of the file. Contains schema, metadata (column types, encoding, statistics like min/max/null counts).

  !!! tip
      Rich metadata enables query engines to perform predicate pushdown—skipping row groups where min/max values do not match filter criteria, greatly improving query performance.

## Advantages

- **Compression:** Columnar layout allows for highly efficient compression algorithms.
- **Encoding:** Supports multiple encoding schemes (e.g., dictionary, bit packing, run-length).
- **Predicate pushdown:** Query engines can skip irrelevant data using embedded statistics.
- **Schema evolution:** Supports adding or removing columns without rewriting entire datasets.
- **Splittable:** Large files can be split for parallel processing.

## Use Cases

- Data warehousing and analytics
- ETL pipelines
- Data lake storage
- Machine learning feature stores

---

*Parquet’s columnar design and rich metadata make it a foundational format for scalable, high-performance analytics in modern data architectures.*
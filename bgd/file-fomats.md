## Parquet
- Columnar oriented
- Self-describing: metadata including schema and structure is embedded within a file
- Advantages:
  - Compression
  - Encoding
  - Optimize I/O
  
## Avro

- Row based
- Schema-based serialization library
- Uses JSON to specify data format
- Keeps data along with a schema in its metadata section
- Supports two type of serialization
  - JSON format
  - Binary format
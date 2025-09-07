---
sidebar_position: 3
---

# Reading and Writing in Apache Iceberg

Apache Iceberg provides a robust process for reading and writing data, ensuring consistency, scalability, and efficient query performance.

## Writing Data in Iceberg

The writing workflow in Iceberg involves several coordinated steps:

1. **Submit the query:** The query engine receives an insert, update, or delete request.
2. **Fetch the latest metadata file:** The engine retrieves the most recent metadata file to ensure it operates on the latest table state.
3. **Write data files:** New or updated data is written to data files in supported formats (e.g., Parquet, Avro, ORC).
4. **Create manifest files:** Manifest files are generated to track the new data and delete files, including relevant statistics.
5. **Create manifest list:** A manifest list is assembled, referencing all manifest files for the current operation.
6. **Write new metadata file:** A new metadata file is created, capturing the updated table schema, partitioning, and snapshot information.
7. **Update the metadata pointer:** The catalog is updated to point to the latest metadata file, making the changes visible to readers.

## Reading Data in Iceberg

The reading workflow ensures that queries access the most up-to-date and relevant data:

1. **Query the catalog:** The query engine requests the current metadata file from the catalog.
2. **Retrieve the current snapshot:** The engine obtains the current snapshot ID and the location of its manifest list.
3. **Access manifest files:** Manifest files are read from the manifest list to identify relevant data and delete files.
4. **Apply partition filters:** The engine uses partition information and statistics from manifest files to prune unnecessary data files.
5. **Read matching data files:** Only the required data files are read, returning the filtered results to the user.

---

Iceberg’s read and write processes are designed for reliability, atomicity, and performance, supporting concurrent operations and efficient analytics at scale.

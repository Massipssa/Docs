---
sidebar_position: 1
---

# Apache Iceberg Architecture

Apache Iceberg is designed with a layered architecture to efficiently manage large analytic datasets, support schema evolution, and enable features like time travel and concurrent writes.

## Layers Overview

Iceberg consists of three main layers:

1. **Catalog Layer** – Manages table locations and metadata pointers.
2. **Metadata Layer** – Tracks table metadata, schema, partitioning, and file statistics.
3. **Data Layer** – Stores the actual table data and delete information.

![iceberg-archi](/img/bigdata/iceberg/00-layers.png)

---

### Catalog Layer

The catalog layer maps fully qualified table names (namespace + table) to their current metadata file (**metadata pointer**). It ensures atomic updates to the metadata pointer, so all readers and writers see a consistent table state.

Depending on the catalog implementation, the metadata pointer is stored differently:

- **S3:** Uses a file named `version-hint.text` in the table’s metadata folder, containing the current metadata file version.
- **AWS Glue:** Stores the pointer as a table property called `metadata_location`, holding the full path to the current metadata file.
- **Apache Hive:** Uses the `location` table property to point to the current metadata file.

---

## Metadata Layer

The metadata layer contains all metadata files for an Iceberg table. It forms a tree structure that tracks data files, delete files, and the operations that created them. This layer is essential for efficient data management and enables features like time travel and schema evolution.

**Three key file types:**

- [Manifest files](#manifest-file)
- [Manifest lists](#manifest-list)
- [Metadata files](#metadata-file)

### Manifest File

Manifest files track data files and delete files, along with statistics such as minimum and maximum column values. These files are generated incrementally during writes, making statistics collection efficient compared to legacy formats like Hive.

:::info
    - Separate manifest files track data files and delete files, but both use the same schema.
    - Manifest files store statistics at write time, avoiding expensive full-table scans required by older formats.
    - Query engines use manifest file statistics (e.g., upper/lower bounds, null counts, partition data) for file pruning, improving query performance.
:::

```json
{
  "manifest_path": "warehouse/db/persons/metadata/d9b53757-55a3-4f7e-80b6-926ce7edac4b-m0.avro",
  "manifest_length": 6930,
  "partition_spec_id": 0,
  "content": 0,
  "sequence_number": 1,
  "min_sequence_number": 1,
  "added_snapshot_id": 2093926769621697207,
  "added_data_files_count": 1,
  "existing_data_files_count": 0,
  "deleted_data_files_count": 0,
  "added_rows_count": 1,
  "existing_rows_count": 0,
  "deleted_rows_count": 0,
  "partitions": {
    "array": [
      {
        "contains_null": false,
        "contains_nan": {
          "boolean": false
        },
        "lower_bound": {
          "bytes": "2\u0000\u0000\u0000"
        },
        "upper_bound": {
          "bytes": "2\u0000\u0000\u0000"
        }
      }
    ]
  }
}
```

### Manifest List

A manifest list captures the state of an Iceberg table at a specific point in time. It contains a list of manifest files, each describing:

- Data file locations
- Partition information
- Upper and lower bounds of partition columns

Query engines use manifest lists to evaluate partition specs and skip irrelevant files, enabling fast, efficient reads.

```json
{
  "status": 1,
  "snapshot_id": {
    "long": 2093926769621697207
  },
  "sequence_number": null,
  "file_sequence_number": null,
  "data_file": {
    "content": 0,
    "file_path": "warehouse/db/persons/data/age=50/00000-1-a3af8354-0914-4e6f-a7a6-82c980a4cfc1-00001.parquet",
    "file_format": "PARQUET",
    "partition": {
      "age": {
        "int": 50
      }
    },
    "record_count": 1,
    "file_size_in_bytes": 907,
    "column_sizes": {
      "array": [
        {
          "key": 1,
          "value": 43
        },
        {
          "key": 2,
          "value": 36
        },
        {
          "key": 3,
          "value": 43
        }
      ]
    },
    "value_counts": {
      "array": [
        {
          "key": 1,
          "value": 1
        },
        {
          "key": 2,
          "value": 1
        },
        {
          "key": 3,
          "value": 1
        }
      ]
    },
    "null_value_counts": {
      "array": [
        {
          "key": 1,
          "value": 0
        },
        {
          "key": 2,
          "value": 0
        },
        {
          "key": 3,
          "value": 0
        }
      ]
    },
    "nan_value_counts": {
      "array": []
    },
    "lower_bounds": {
      "array": [
        {
          "key": 1,
          "value": "Charlie"
        },
        {
          "key": 2,
          "value": "2\u0000\u0000\u0000"
        },
        {
          "key": 3,
          "value": "Teacher"
        }
      ]
    },
    "upper_bounds": {
      "array": [
        {
          "key": 1,
          "value": "Charlie"
        },
        {
          "key": 2,
          "value": "2\u0000\u0000\u0000"
        },
        {
          "key": 3,
          "value": "Teacher"
        }
      ]
    },
    "key_metadata": null,
    "split_offsets": {
      "array": [
        4
      ]
    },
    "equality_ids": null,
    "sort_order_id": {
      "int": 0
    }
  }
}
```

### Metadata File

The metadata file tracks manifest lists and contains the table’s schema, partitioning details, snapshots, and the identifier of the current snapshot. Each table modification creates a new metadata file, registered as the latest version.

This design supports:

- **Concurrent writes:** Multiple engines can write data simultaneously without conflict.
- **Consistent reads:** Readers always access the latest committed version of the table.

---

## Data Layer

The data layer holds the actual table data, consisting of **data files** and **delete files**. It is typically backed by distributed storage systems such as HDFS, Amazon S3, Google Cloud Storage (GCS), Azure Data Lake Storage (ADLS), and others.

- **Data Files:** Store the actual table data. Supported formats include Apache Parquet, Apache Avro, and Apache ORC.
- **Delete Files:** Track rows deleted from the dataset without rewriting underlying data files, enabling efficient deletes.

:::info
    Data in a data lake should be immutable. Updates are handled by writing new files rather than modifying existing ones.
:::

### Data Modification Approaches

Apache Iceberg supports two approaches for handling data changes:

- **Copy-On-Write (COW):** Changes are applied by creating a new version of the data file with updates. The old file is replaced.
- **Merge-On-Read (MOR):** Changes (inserts, updates, deletes) are written to separate delta or delete files. Query engines merge these changes with base data at read time.

#### Supported Delete Operations

- **MOR delete methods**
- **Positional delete files**
- **Equality delete files**

---

Iceberg’s layered architecture enables scalable, reliable, and flexible data lake management, supporting advanced analytics and evolving business requirements.

---
sidebar_position: 1
---

# Apache Iceberg Architecture

## Layers

Apache iceberg is made up by a three layer




### Catalog Layer

A catalog maps fully qualified table names (namespace + table) to their current metadata file (**metadata pointer**). 
It must support atomic updates to the metadata pointer, ensuring that all readers and writers see a consistent table
state at any given time.

Depending on the catalog in use, the metadata pointer is stored differently. For example:

- **S3** Catalog stores the pointer in a file named **version-hint.text** within the table’s metadata folder. This file
contains the version number of the current metadata file.
- **AWS Glue** stores the pointer as a table property called **metadata_location**, which holds the full path to the 
current metadata file.
- **Apache Hive** uses the **location** table property to point to the current metadata file.

## Metadata Layer

It's a layer that contains all metadata files for a table in Iceberg. It's a tree that tracks the datafiles and 
metadata about them as well as the operations that resulted in the creation. It's made up of three file types: 

- [Manifest files](#manifest-file)
- [Manifest lists](#manifest-list-)
- [Metadata files](#metadata-file-)

This layer is essential for efficiently managing large datasets and enable core features such as time travel and schema evolution. 

### Manifest file

keep track of file in the data layer (datafiles and delete files) as well as some additional details 
and statistics about each file such as minimum and maximum values of datafile's columns. 

!!! note
    - Separate subset of manifest files are used to track datafiles and delete file but the schema is identical same 
    for both.
    - During writes, the engine generates statistics and stores them in manifest files that track small batches of data 
    files. Because these stats are recorded incrementally at write time, producing them is far lighter than in the Hive 
    table format, where statistics are gathered by long, expensive read jobs that must scan entire partitions—or even 
    whole tables—before writing partition- or table-level stats.

Information from the manifest files, such as upper and lower bounds for a specific column, null value counts, 
and partition-specific data, is used by the engine for file pruning.

### Manifest list 

A manifest list captures the state of an Iceberg table at a specific point in time. It contains a list of manifest files, each describing:

- The location of data files
- The partitions they belong to
- The upper and lower bounds of partition columns
- ...

Query engines use this information to evaluate partition specs and skip irrelevant manifest files, enabling faster, 
more efficient reads through data pruning.

### Metadata file 

The metadata file tracks manifest list files and contains the table’s schema, partitioning details, snapshots, 
and the identifier of the current snapshot. Each time an Iceberg table is modified, a new metadata file is created and 
registered as the latest version. This design supports critical scenarios such as:

- **Concurrent writes** – allowing multiple engines to write data simultaneously without conflict.
- **Consistent reads** – ensuring that readers always access the latest committed version of the table.

## Data Layer

The data layer in an Apache Iceberg table holds the actual table data, primarily made up of **data files** and 
**delete files**. 

This layer is responsible for serving query results—unless a query can be resolved using metadata 
alone (e.g., min/max value lookups). In Iceberg’s tree-like architecture, the data layer represents the leaf nodes.

It is typically backed by distributed storage systems such as HDFS, Amazon S3, Google Cloud Storage (GCS), 
Azure Data Lake Storage (ADLS), and others.

- **Data Files**
These files store the actual table data. As of now, Iceberg supports three file formats: Apache Parquet, Apache Avro, 
and Apache ORC.

- **Delete Files**
These track rows that have been deleted from the dataset without rewriting the underlying data files, 
enabling efficient handling of deletes.

!!! info
    It's a best practice to keep data in data lake immutable, so you can't update rows in file in place. Instead, 
    you need to write a new file.

Apache Iceberg supports two approaches for handling data modifications:

- **Copy-On-Write (COW):** Changes are written by creating a new version of the data file with all updates applied. 
The old file is replaced by this updated copy.
- **Merge-On-Read (MOR):** Only the changes (inserts, updates, deletes) are written to separate delta or delete files. 
Query engines merge these changes with the base data at read time.


- Supported deletes operations

  - MOR delete methods
  - Positional delete file
  - Equality delete file


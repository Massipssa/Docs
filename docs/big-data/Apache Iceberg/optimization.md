---
sidebar_position: 2
---


# Optimization

- Reducing the number of data files
- Data sorting
- Table partitionning
- Row-level update handling
- Metric collection
- External factors

## Compaction

Each operation on file genererate metadata file this can lead to small files problem, espcially when delaing with stream.
The solution is to periodically take the data in the all small files and rewrite it into a lager files (you may also want to rewrite manifests if there are too many manifests relative to the number of datafiles you have). This process is calle compation

- In Spark the compaction is performed using the method: reweriteDataFiles:
- Methods:
  - binPack
  - Sort
  - zOrder
  - filter
  - option
  - options

## Partition

When a table is partitioned, instead of just sorting the order based on a field, it will write records with distinct values of the target field into their own datafiles.

### Patition Evolition

Changing how the the table was  partitioned required you to rewrite the entire table.
Metadata-tracked partitioning: the metadata tracks not only partition values but also historical partition schemes, allowing the partition schemes to evolve.
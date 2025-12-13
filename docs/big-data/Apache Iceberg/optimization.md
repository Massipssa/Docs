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

Each operation on file genererate metadata file this can lead to small files problem, espcially when dealing with stream. When you querying iceberg table you need to open and and scan each file and close the file you'are done. The more files you have to scan for a query, the greater the cost
these file operations will put on your query.  
The solution is to periodically take the data in the all small files and rewrite it into a lager files (you may also want to rewrite manifests if there are too many manifests relative to the number of datafiles you have). This process is called compation

- In Spark the compaction is performed using the method: **reweriteDataFiles**
- Methods:
  - binPack
  - Sort
  - zOrder
  - filter
  - option
  - options

## Sorting

Helps limit the number of files that needed to be  scanned to get the data needed by the query. Sorting the data allows the data with similar values to be concentrated into fewer files, allowing for more efficient query planning

## Partition

When a table is partitioned, instead of just sorting the order based on a field, it will write records with distinct values of the target field into their own datafiles.

### Patition Evolition

Changing how the the table was  partitioned required you to rewrite the entire table.
Metadata-tracked partitioning: the metadata tracks not only partition values but also historical partition schemes, allowing the partition schemes to evolve.

## Metric Collection

You can specify the metric you want to collect 

| option | meaning   |
|---|---|
| none  |   |
| counts  |   |
| truncate  |   |
| full  |   |


## Copy-On-Write and Merge-On-Read

### Copy-On-Write

- Every update in create a new datafile and the the new datafile replace the old one in a new snapshot
- Ideal to optimize reads because the query don't need to reconcile deleted pr updated file

## Rewrite Manifest Files

When a table accumulates many snapshots over time, it can also accumulate a large number of lightweight manifest files.
During reads and writes, Iceberg must scan these manifests to discover which data files are relevant, and having too many manifests increases the amount of metadata operations required.

The rewrite_manifest procedure optimizes this metadata layout by rewriting and regrouping manifest files, producing fewer, larger manifest files that each reference more data files.
This improves query planning performance and reduces metadata overhead.

When running this procedure with Spark, be aware that Spark may attempt to cache metadata files in memory, which can lead to memory pressure on large tables.
If necessary, you can disable Spark caching to avoid excessive memory consumption during the manifest rewrite operation.

## Storage Optimization

### Expire Snapshots

Updates and compactions often generate files that are no longer needed, because these files remain associated with historical snapshots of the table.
To avoid storing unnecessary data and reduce storage costs, you should periodically expire old snapshots, which removes data and metadata files that are no longer referenced by the current table state.

This operation helps keep the metadata tree small and ensures that Iceberg only retains the files required for the retention window you have configured.

### Remove Orphan Files

Orphaned data files are data files that are no longer referenced by any Iceberg table metadata. They can appear after task or job failures, or even during normal snapshot expiration when the process does not successfully delete all data files that are no longer referenced by the remaining snapshots.

Importantly, expiring snapshots does not clean up orphan files, because Iceberg never referenced these files to begin with.
Therefore, you should periodically run a dedicated maintenance operation to remove them.

The ``remove_orphan_files`` procedure scans all files under the table’s location and determines whether each file is referenced by any active snapshot.
Files that are not referenced are considered orphaned and are safely deleted.

:::danger
  The ``remove_orphan_files`` operation is intensive, as it must scan the entire table directory.
  It should be executed sparingly, ideally during low-traffic maintenance windows.
:::


## Write distribution mode

## Object Storage

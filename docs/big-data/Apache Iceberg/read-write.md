---
sidebar_position: 3
---

## Writing Query in Iceberg

Writing process in Iceberg goes through a series of steps that help query engines to efficiently insert and update data.

1. Send the query to the engine 
2. Get the latest metadata file 
3. Write data to datafiles 
4. Create Manifest file 
5. Create Manifest list 
6. Write metadata file 
7. Update latest metadata file

## Reading Query inIceberg

The query engine interacts with the catalog to get the current metadata file.

It then gets the current-snapshot-id (S2 in this case) and the manifest list location for that snapshot.
The manifest file path is then retrieved from the manifest list.
The engine determines the datafile path based on the partition filter from the manifest file.
The matching data from the required datafile is then returned to the user.
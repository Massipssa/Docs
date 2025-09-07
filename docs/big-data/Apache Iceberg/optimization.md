---
sidebar_position: 2
---

# Optimization

## Compaction

Each operation on file genererate metadata file this can lead to small files problem, espcially when delaing with stream. 
The solution is to periodically rewirte sa small files into large one, this process is called cwcxompation. 
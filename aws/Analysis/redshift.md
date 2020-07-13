# Redshift

- Performance
    - Massively Parallel Processing (MPP)
    - Colomnar Data Storage
    - Column Compression (is column level operation, reduce space, reduce disc I/O)
- Block size of 1MB
- Indexes are materialized but not required

- **Durability**

- **Distribution Styles**
    * **AUTO**
    * **EVEN**
    * **KEY**
    * **ALL**

- **Sort Keys**
    * **Single column**
    * **Compound (default)**
    * **Interleaved**

## COPY command

- **UNLOAD command:** unload from a table into files in S3
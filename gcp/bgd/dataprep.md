# Dataprep

- Intelligent data preparation
- Serverless
- Is not Google product (Partner **Trifacta** product)
- Supports:
    - CSV, JSON, Avro,  ...
    - Output: CSV, Json, Bigquery and the file can be compressed or uncompressed
- **IAM**
    - **dataprep.projets.user:** allows user to run the Cloud Dataprep
    - **dataprep.serviceAgent:** gives access to:
        - Storage (GCS)
        - Datasets (BQ)
        - Workflow (Dataflow)
1. [Dataprep](#datastore)
2. [Datalab](#dataprep)
3. [Tools](#tools)

## Datalab <a name="datastore"></a>

- Interactive tool for exploring and visualize data
- Build on jupter
- Support Python, SQL, Javascript
- Create Datalab: ```datalab create (instance-name)```
- Connect to Datalab: ```datalab connect (instance-name)```
- **Source Repository** stores the notebooks  

## Dataprep <a name="dataprep"></a>

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
## Dataproc
- Available connectors:
    - Spark, Hadoop <=> Bigquery, CloudStorage, Bigtable


## Tools <a name="tools"></a>

- gcloud
- gsutil (Storage)
- bq (Bigquery)
- datalab
- cbt (Bigtable)

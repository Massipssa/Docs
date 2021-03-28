* **Input:** Kafka, HDFS, S3, Socket, 
* **Output:**
    * Kafka
    * Files (json, parquet, csv, ...)
    * Console (for testing)
    * Memory (for debugin)

* **Output mode (how output data):**
    * Append: add only new records
    * Update: add updated records
    * Complete: add all records

* **Triggers (when output data):**

* Event time processing

* Watermarks ?? 

### Notes

* Infer schema is disabled by default in Streaming to enable it use : **spark.sql.streaming.schemaInference=true**
* To control how quickly Spark will read all of the files in folder, add the option **maxFilesPerTrigger** to Dataframe
* Spark Structured Streaming **2.2** do not support chained aggregations

# Kinesis Analytic

* Performs real-time analysis on streams using SQL

<img src="./screenshots/kinesis.PNG">

* **Common use-cases**
    * Streaming ETL
    * Continuos metric generation
    * Responsive analytics

* **Cost**
    * Pay only for resources consumed (but it's not cheap)
    * Serveless; scales automatically
    * Use IAM permissions to access streaming source and destination(s)
    * Schema discovery

* **RANDOM_CUT_FOREST**
    * SQL function used for anomaly detection on numeric columns in stream
    * They're especially proud of this because they published a paper on it
    * it's novel way to identify outliers in data set so you can handle them however you need to
    * Example: detect anomalous subway ridership during the NYC marathon

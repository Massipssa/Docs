# Concepts

- Is unified programming model for batching and streaming
- Provide a portable programming layer
- Separates pipeline structure from execution platform (Spark, Dataflow, Flink, ...)

## Components
- **PCollection** dataset of bounded or unbounded items 
  - Has a schema
  - Immutable (like RDD in spark)
  - Each item is assigned a **timestamp** by a source that creates it
- **PTransformation**
  - Acts on PCollection, create zero or many new PCollections
- **Pipeline** 
  - Acyclic graph of PCollection and PTransformation
  - Different pipeline cannot share a PCollection
- **PipelineRunner** 

## Beam Model 
- **What** is beign computed 
  - Here we compute **Sum** per key  --> ```PCollection<KV<String, Integer>> scores = input.apply(Sum.integersPerKeyy())```
- **Where** in event time
  - Window each two minutes we receive (we compute) an event  --> 
    ```PCollection<KV<String, Integer>> scores = input
                 .apply(Window.into(FixedWindows.of(Duration.ofMinutes(2)))
                 .apply(Sum.integersPerKeyy())```



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
- **What** is beign computed ?
  - Here we compute **Sum** per key:
    ```PCollection<KV<String, Integer>> scores = input.apply(Sum.integersPerKeyy())```
- **Where** in event time ?
  - Window each two minutes we receive (we compute) an event  --> 
    ```
      PCollection<KV<String, Integer>> scores = input
                 .apply(Window.into(FixedWindows.of(Duration.standardMinutes(2)))
                 .apply(Sum.integersPerKeyy())
    ```
- **Where** in processing time ? 
- **How** refinement relate ? 


## Windowing

- Each element of PCollection may belong to one or more windows
- Each individual window contains an infinite elements
- **Watermark** 
  - **Event-time:** where event occured (timestamp inside event)
  - **Proccessing-time:** where event was processed by the pipeline
    
## Triggers
  - Emitting after a certain amount of time elapses, or after a certain number of elements arrives 
  - Processing of late data by triggering after the event time watermark passes the end of the window

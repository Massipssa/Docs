# Concepts

- Is unified programming model for batching and streaming
- Provide a portable programming layer

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


# AI Concepts Needed by a Data Engineer

This document explains the main Artificial Intelligence (AI, or IA) concepts that a data engineer should understand. The goal is not to turn a data engineer into a data scientist, but to make them effective when building, operating, and improving the data platforms that AI systems depend on.

## 1. Why AI Matters for Data Engineers

AI systems depend on data more than on models alone. A model can only learn from the data that is collected, cleaned, transformed, stored, and delivered to it.

A data engineer usually supports AI by:

- Building data pipelines for training and inference.
- Preparing reliable datasets for machine learning teams.
- Managing batch and streaming data flows.
- Ensuring data quality, freshness, lineage, and governance.
- Supporting feature stores, vector databases, model monitoring, and MLOps platforms.
- Making AI systems production-ready, observable, secure, and scalable.

In practice, bad data pipelines often create bad AI results, even when the model is powerful.

## 2. Core AI Vocabulary

### Artificial Intelligence

Artificial Intelligence is the broad field of building systems that can perform tasks that normally require human intelligence, such as prediction, classification, language understanding, recommendation, planning, or decision-making.

### Machine Learning

Machine Learning is a subfield of AI where systems learn patterns from data instead of being programmed with explicit rules.

Example:

- Rule-based system: "If transaction amount is greater than 10,000, flag it."
- Machine learning system: "Learn from historical fraud and normal transactions to predict whether a new transaction is suspicious."

### Deep Learning

Deep Learning is a type of machine learning based on neural networks with many layers. It is commonly used for image recognition, speech, natural language processing, recommendation systems, and generative AI.

### Generative AI

Generative AI creates new content such as text, code, images, audio, or structured data. Large Language Models, such as GPT-style models, are part of this category.

### Model

A model is the artifact that has learned patterns from training data. Once trained, it can receive new input and produce a prediction, score, classification, recommendation, or generated output.

## 3. Types of Machine Learning

### Supervised Learning

The model learns from input data and known answers called labels.

Examples:

- Predict customer churn: label is churn or no churn.
- Predict house price: label is the sale price.
- Classify support tickets: label is the ticket category.

Data engineering responsibilities:

- Collect historical data.
- Create clean training tables.
- Preserve label correctness.
- Avoid data leakage.
- Track dataset versions.

### Unsupervised Learning

The model learns patterns without explicit labels.

Examples:

- Customer segmentation.
- Anomaly detection.
- Topic discovery in documents.

Data engineering responsibilities:

- Provide consistent input data.
- Normalize and standardize fields.
- Ensure enough historical coverage.
- Support exploratory data analysis at scale.

### Semi-Supervised Learning

The model learns from a small amount of labeled data and a larger amount of unlabeled data.

This is useful when labeling data is expensive, slow, or requires human experts.

### Reinforcement Learning

The model learns by taking actions and receiving rewards or penalties.

Examples:

- Game-playing agents.
- Robotics.
- Optimization systems.
- Some recommendation and ranking systems.

Data engineering responsibilities:

- Store events, actions, states, and rewards.
- Preserve temporal order.
- Make feedback data available for analysis and retraining.

## 4. Training, Validation, and Inference

### Training

Training is the process where the model learns from historical data.

Data engineers provide:

- Training datasets.
- Feature pipelines.
- Data snapshots.
- Storage and compute infrastructure.
- Data quality checks.

### Validation

Validation checks whether the model performs well on data it did not directly learn from.

The common split is:

- Training set: used to train the model.
- Validation set: used to tune the model.
- Test set: used to estimate final performance.

For time-based data, random splits can be dangerous. A model that predicts future behavior should be validated using older data for training and newer data for testing.

### Inference

Inference is when a trained model is used to produce outputs on new data.

Inference can be:

- Batch inference: predictions are generated on a schedule, for example every night.
- Real-time inference: predictions are generated immediately when an event or request arrives.
- Streaming inference: predictions are generated continuously from event streams.

Data engineers often build the pipelines that feed inference systems and store their outputs.

## 5. Features and Feature Engineering

A feature is an input variable used by a model.

Examples:

- Customer age.
- Number of purchases in the last 30 days.
- Average transaction amount.
- Last login date.
- Device type.

Feature engineering is the process of transforming raw data into useful model inputs.

Common feature engineering tasks:

- Aggregations: count, sum, average, min, max.
- Time windows: last 7 days, last 30 days, last 12 months.
- Encoding categorical values.
- Normalizing numeric values.
- Extracting date parts such as day of week or month.
- Joining customer, product, transaction, and event data.

Important data engineering concern:

Features used during training must be calculated the same way during inference. If the logic differs, the model may behave badly in production.

## 6. Labels and Ground Truth

A label is the known answer the model tries to learn.

Examples:

- Fraud or not fraud.
- Click or no click.
- Cancelled subscription or active subscription.
- Delivery delay in minutes.

Ground truth means the most reliable known answer available.

Data engineers should help ensure that labels are:

- Correct.
- Timely.
- Traceable to source systems.
- Not created using future information unavailable at prediction time.

For example, if a churn model predicts whether a customer will leave next month, the training features must not include data from after the churn date.

## 7. Data Leakage

Data leakage happens when training data contains information that would not be available at prediction time.

Example:

- Predicting loan default using a field named `collection_status`, which is only known after default has already started.

Why it matters:

- The model looks excellent during testing.
- The model fails in production.
- Business teams lose trust in the AI system.

Data engineers help prevent leakage by understanding time, source systems, joins, and when each field becomes available.

## 8. Model Evaluation Metrics

Data engineers do not always choose model metrics, but they should understand them because metrics influence data design and monitoring.

### Classification Metrics

Used when the model predicts a category.

Examples:

- Accuracy: percentage of correct predictions.
- Precision: among predicted positives, how many were truly positive.
- Recall: among real positives, how many were found.
- F1 score: balance between precision and recall.
- ROC-AUC: ability to separate classes across thresholds.

Example:

For fraud detection, accuracy can be misleading because fraud is rare. A model that predicts "not fraud" for every transaction may have high accuracy but no business value.

### Regression Metrics

Used when the model predicts a number.

Examples:

- MAE: average absolute error.
- MSE: average squared error.
- RMSE: square root of MSE.
- MAPE: percentage error.

### Ranking and Recommendation Metrics

Used when the model returns ordered results.

Examples:

- Precision at K.
- Recall at K.
- Mean reciprocal rank.
- NDCG.

## 9. Model Drift and Data Drift

### Data Drift

Data drift happens when production data changes compared with training data.

Example:

- A customer behavior model was trained before a major market change, but user behavior is now different.

### Model Drift

Model drift happens when model performance degrades over time.

Causes:

- Business changes.
- User behavior changes.
- New products or services.
- External events.
- Upstream data pipeline changes.

Data engineering responsibilities:

- Monitor feature distributions.
- Monitor missing values and schema changes.
- Track prediction outputs.
- Store actual outcomes when they become available.
- Support retraining pipelines.

## 10. MLOps Concepts

MLOps means applying DevOps principles to machine learning systems.

Important MLOps concepts:

- Dataset versioning: know exactly which data trained a model.
- Model registry: store trained models and metadata.
- Experiment tracking: record parameters, metrics, code, and datasets.
- Automated training pipelines.
- Automated deployment pipelines.
- Model monitoring.
- Rollback strategy.
- Reproducibility.

Data engineers are often responsible for the data side of MLOps:

- Reliable data ingestion.
- Training data generation.
- Feature pipelines.
- Data validation.
- Dataset storage.
- Metadata and lineage.

## 11. Feature Stores

A feature store is a platform used to manage, share, and serve machine learning features.

It usually provides:

- Offline features for training.
- Online features for real-time inference.
- Feature definitions.
- Feature versioning.
- Consistent transformation logic.

Why it matters:

- Reduces duplicated feature code.
- Keeps training and inference logic consistent.
- Makes features reusable across teams.
- Improves governance and traceability.

Data engineers may build or operate the pipelines that populate the feature store.

## 12. Embeddings

Embeddings are numeric representations of data such as text, images, users, products, or documents.

An embedding captures meaning in a vector of numbers.

Example:

- The words "car" and "vehicle" should have embeddings that are close to each other.
- A product and a similar product should have embeddings that are close.

Embeddings are used for:

- Semantic search.
- Recommendations.
- Clustering.
- Duplicate detection.
- Retrieval-Augmented Generation.

Data engineering responsibilities:

- Prepare text or object data for embedding.
- Generate embeddings in batch or real time.
- Store embeddings with metadata.
- Keep embeddings synchronized with source data.
- Recompute embeddings when source data or embedding models change.

## 13. Vector Databases

A vector database stores embeddings and allows similarity search.

Instead of asking "which rows match this exact keyword?", a vector database can answer "which items are semantically similar to this query?"

Common use cases:

- Search documents by meaning.
- Recommend similar products.
- Find related support tickets.
- Retrieve context for LLM applications.

Data engineering concerns:

- Chunking documents correctly.
- Storing metadata such as source, date, owner, and permissions.
- Updating or deleting vectors when source documents change.
- Managing indexing strategy.
- Monitoring latency and recall quality.

## 14. Large Language Models

Large Language Models, or LLMs, are models trained on large text and code datasets. They can generate and transform language.

Common tasks:

- Summarization.
- Question answering.
- Translation.
- Classification.
- Code generation.
- Data extraction from text.
- Chat assistants.

Data engineers should understand:

- LLMs do not know private company data unless it is provided.
- LLMs can produce incorrect answers.
- Inputs and outputs should be logged carefully, with privacy controls.
- Sensitive data must be protected.
- Cost and latency depend on model, prompt size, and output size.

## 15. Prompts and Prompt Engineering

A prompt is the instruction and context sent to an LLM.

Prompt engineering means designing prompts that produce reliable outputs.

For data engineers, this matters when:

- Building pipelines that call LLM APIs.
- Extracting structured data from documents.
- Creating automated metadata descriptions.
- Generating data quality explanations.
- Building internal assistants over data catalogs.

Good prompt design usually includes:

- Clear task.
- Input data.
- Output format.
- Constraints.
- Examples.
- Error handling expectations.

For production systems, structured outputs such as JSON are usually easier to validate than free text.

## 16. Retrieval-Augmented Generation

Retrieval-Augmented Generation, or RAG, is a pattern where an application retrieves relevant data first, then gives that context to an LLM.

Typical RAG flow:

1. User asks a question.
2. The question is converted into an embedding.
3. A vector search finds relevant documents or records.
4. The retrieved context is sent to the LLM.
5. The LLM generates an answer based on that context.

Data engineering responsibilities:

- Ingest documents and records.
- Clean and chunk text.
- Generate embeddings.
- Store vectors and metadata.
- Enforce access controls.
- Refresh indexes when source data changes.
- Track which sources were used in answers.

RAG is often a data engineering problem as much as an AI problem.

## 17. Fine-Tuning

Fine-tuning means training an existing model further on a specific dataset.

It can help when:

- The model needs a specific style.
- The model must classify domain-specific examples.
- The model must follow repeated task patterns.

Fine-tuning is not always the first solution. For many business applications, RAG, better prompts, better data cleaning, or better retrieval are more practical.

Data engineers support fine-tuning by:

- Preparing high-quality examples.
- Validating input and output pairs.
- Removing sensitive data.
- Versioning training files.
- Tracking model and dataset lineage.

## 18. AI Data Pipelines

An AI data pipeline often has more steps than a traditional analytics pipeline.

Example batch training pipeline:

1. Ingest raw data.
2. Validate schemas and quality.
3. Clean and transform data.
4. Generate labels.
5. Generate features.
6. Split train, validation, and test datasets.
7. Train model.
8. Evaluate model.
9. Register model.
10. Deploy model.
11. Monitor predictions and outcomes.

Example RAG pipeline:

1. Ingest documents.
2. Extract text.
3. Clean text.
4. Split text into chunks.
5. Generate embeddings.
6. Store vectors with metadata.
7. Retrieve relevant chunks at query time.
8. Send context to an LLM.
9. Store answer, sources, latency, and feedback.

## 19. Data Quality for AI

AI systems are sensitive to data quality problems.

Common checks:

- Schema validation.
- Null rate checks.
- Duplicate checks.
- Range checks.
- Freshness checks.
- Referential integrity.
- Distribution checks.
- Volume checks.
- Outlier checks.

AI-specific checks:

- Label quality.
- Feature availability at inference time.
- Training and inference feature consistency.
- Class imbalance.
- Drift detection.
- Source permission validation.
- PII and sensitive data detection.

## 20. Governance, Privacy, and Security

AI systems can create new data risks.

Important topics:

- Personally identifiable information, or PII.
- Data minimization.
- Access control.
- Encryption.
- Audit logs.
- Consent and data usage rights.
- Retention policies.
- Model input and output logging.
- Sensitive data redaction.
- Compliance with internal and external policies.

For LLM applications, data engineers should be especially careful with:

- Sending sensitive data to external APIs.
- Storing prompts and responses.
- Exposing private documents through retrieval.
- Mixing permissions in vector indexes.
- Using production data for testing without controls.

## 21. Architecture Patterns

### Batch Prediction Architecture

Use when predictions can be produced on a schedule.

Example:

- Nightly customer churn scores.
- Weekly product demand forecast.

Typical stack:

- Data lake or warehouse.
- Orchestrator such as Airflow.
- Feature generation jobs.
- Model inference job.
- Output table for business tools.

### Real-Time Prediction Architecture

Use when predictions are needed immediately.

Example:

- Fraud scoring during payment.
- Product recommendations during browsing.

Typical stack:

- Event stream or API.
- Online feature store or low-latency database.
- Model serving endpoint.
- Logging and monitoring.

### RAG Architecture

Use when an LLM must answer questions using private or changing knowledge.

Typical stack:

- Source systems.
- Document ingestion pipeline.
- Text extraction and chunking.
- Embedding generation.
- Vector database.
- LLM application.
- Observability and feedback loop.

## 22. Practical Skills to Learn

A data engineer working with AI should be comfortable with:

- Python for data processing.
- SQL for analytics and feature creation.
- Spark or distributed processing.
- Airflow or another orchestrator.
- Kafka or streaming systems.
- Data lake and warehouse design.
- Docker and containerized services.
- REST APIs.
- Data quality frameworks.
- Basic statistics.
- Machine learning lifecycle concepts.
- Cloud storage and compute.
- Secrets management.
- Monitoring and logging.
- Git and CI/CD.

Useful AI-specific skills:

- Creating training datasets.
- Building feature pipelines.
- Working with embeddings.
- Using vector databases.
- Building RAG ingestion pipelines.
- Understanding model metrics.
- Supporting model monitoring.
- Managing data privacy for AI workloads.

## 23. Common Tools and Platforms

The exact tools depend on the company, but common categories include:

- Orchestration: Airflow, Dagster, Prefect.
- Processing: Spark, Flink, Beam, dbt.
- Storage: data lakes, warehouses, lakehouses.
- Streaming: Kafka, Pulsar, Kinesis.
- Experiment tracking: MLflow, Weights and Biases.
- Feature stores: Feast, Tecton, cloud-native feature stores.
- Model serving: KServe, BentoML, Seldon, cloud AI services.
- Vector databases: Pinecone, Milvus, Weaviate, Qdrant, pgvector, OpenSearch.
- Monitoring: Prometheus, Grafana, Evidently, WhyLabs, custom dashboards.
- Data quality: Great Expectations, Soda, Deequ.

The tool is less important than understanding the responsibilities: reliable data, reproducible datasets, monitored pipelines, governed access, and observable production behavior.

## 24. Checklist for an AI-Ready Data Pipeline

Use this checklist before sending data to an AI or machine learning workflow.

- Is the source data documented?
- Is the schema validated?
- Are nulls, duplicates, and outliers checked?
- Is the data fresh enough for the use case?
- Are labels correct and generated without leakage?
- Are features available at both training and inference time?
- Is transformation logic versioned?
- Is the dataset reproducible?
- Is sensitive data removed or protected?
- Are access permissions respected?
- Is lineage tracked from source to model output?
- Are predictions stored for monitoring?
- Are actual outcomes captured later?
- Are drift and quality metrics monitored?
- Is there a retraining strategy?
- Is there a rollback strategy?

## 25. Summary

For a data engineer, AI is mainly about building trustworthy data foundations for intelligent systems.

The most important concepts to understand are:

- How machine learning uses data.
- How training, validation, and inference differ.
- How features and labels are created.
- How data leakage can break a model.
- How model quality is measured and monitored.
- How drift affects production systems.
- How embeddings, vector databases, and RAG work.
- How governance, privacy, and security apply to AI workloads.
- How MLOps connects data pipelines with model operations.

A strong AI data engineer does not only move data. They make data reliable enough for automated decisions, predictions, and intelligent applications.

# Mongodb

- Oriented documents
- ***Database***: contains a set of Collections
- ***Collection***: is like a table in RDMS it contains a set of Documents
- ***Document***: is similar to row in RDMS
- Uses two types of models
    - Embedded (denormalized)
    - Normalized
  

## RDBMS vs MongoDB

- In **RDBMS** the data dictates the app usage.
- The steps to are:
  - Define the schema of the data
  - Develop the App and queries
  
- In MongoDB the application needs decide how data will be modeled
- The steps are:
  - Develop App
  - Define the data model
  - Improve the app
  - Approve the data model
- The improvement of the app and data model is done without any downtime  


## How to model data in MongoDB ? 

### Step-by-Step iteration
1. Evaluate app workload
    - Business domain expertise
    - Current and predicted scenarios
    - Production logs and stats
  - It'll allow to have
    - Data size
    - List of operations ranked by importance
2. Map out entities and their relationships
  - It'll allow to have
    - CRD: Collection Relation Diagram (Embedded or Link)
  - To link or embed ?
    - How often does the embedded information get accessed ?
    - Is the data queried using the embedded information
    - Does the embedded information change often
3. Finalize the data model for each collection
  - Allows to: 
    - Identify and apply relevant design patterns
    
### Patterns
- Schema versioning pattern
    - Add the field schema_version to document
    - Run a batch updater to update the data
- Bucket pattern
- Compute pattern
    - Never recompute what you can precompute 
    - Reads are often more common than writes
    - Compute on write is less work than compute on read
    - When updating the database, update some summary records too
    - Can be thought of as a caching pattern
    







































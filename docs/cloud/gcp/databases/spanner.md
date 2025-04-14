
# Cloud Spanner

- **Feature**
  - Fully managed
  - Highly scalable and available
  - Relational database

- **What is used for**
  - Critical mission databases which needs strong ACID
  - Wide scale availability
  - Support SQL
  - It's ***horizontally*** scalable (more node) vs Vertical (RAM and CPU)
- **IAM**
  - Project, instance or database level
  - Role/Spanner
    - Admin
    - Database Admin: create/edit/delete and grant access to databases
    - Reader: read/execute database/schema
    - Viewer: view instances and databases
- Interleave table
- Avoid hotspoting
  - No sequential numbers with ID
  - No timestamps (also sequential)
  - Use descending order timestamp if is required

- Distinguished from Cloud SQL by its **global consistent and size**
- Secondary indexes
  - Allows to search quickly for values
  - Adding index to existing table doesn't lock the table
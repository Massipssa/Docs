# Data Gouverance Tools

## Entreprise Dictionnary

- infotype
- Data class groups infotypes
- Policy can be defined and applyed by data class

### Data class

Data Class shoud contains infotype of same category and treat them in the same manner but not grannulary, for instance adress, eamil an zip conde should be grouped in same Data class and be accessed only by previlieged user and should be retained for 30 days.

- Example
  - Restricted
    - PII
      - email
      - name
      - ssn
    - PHI
      - treatement_details
  - Sensitive
    - Financials
      - Bank_Account
      - Credit_Card_NUM
  - Unrestricted
    - car_details
Data  classes  are  usually  maintained  by  a  central  body  within  the  organization, because policies on “types of data classes” usually affect compliance to regulation.

![data class](./img/data-class.png)

### Policy

An entreprise needs be able to answer the question "What kind of data do we process" and this should be recorded in the policy book.
It specifies:

- The data classes the organization uses
- The  kinds  of  data  that  are processed
- How they are processed
- It elaborates on **what are we allowed and not allowed to do** with the data

Policy book will specify:

- Who (inside or outside the organization) can access a data class
- The retention policy for the data class (how long data is preserved)
- Data residency/locality rules, if applicable
- How  the  data  can  be  processed  (OK/Not  OK  for  analytics,  machine  learning, etc.)
- Other considerations by the organization

## Data Classification and Organization

- Google Cloud Data Loss Prevention
- Amazon Macie

## Data Catalogin and Metadata Management

- Metadata "information about information"
- Data Catalog: a tool to manage the metdata

## Data Assessemnt Profiling and Profiling

## Data Quality

The right processes for data quality management will provide measurably trustworthy data for analysis.

## Data Lineage

Lineage tracking helps ensure data quality and trust by showing how data moves and transforms across an organization. It allows teams to:

- Understand the quality and reliability of dashboards or aggregated metrics.
- Trace the flow of sensitive data to prevent accidental exposure in unauthorized systems.
- Assess and quantify data quality or detect contamination with sensitive information.
- Visualize data flows through lineage graphs, which are especially useful for debugging and auditing.

The more sophisticated solutions track lineage across time—tracking not only what the current inputs to a dashboard are but also what those inputs were in the past, and how the landscape has evolved.

## Key Management an Encryption

- One considration when storing data is whether to store data in plain text or ecrypted
- Data encryption provide another layer of protection as only users or system that have the key can access the data
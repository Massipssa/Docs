- HDInsight cluster's ability to access files in Data Lake Storage Gen2 is controlled through managed identities
- ACLs aren't inherited, so reapplying ACLs requires updating the ACL on every file and subdirectory

- Spark Apps run as sets of process coordinated by Spark Context.
  
- Apache livy
- Azure event hubs
- ODBC driver for connectivity from tools such Power BI.


## Security 
- Security perimeter
- Authentication
    - AD Auth
    - Multi-user
    - RBAC ACL
- Authorization
  - Ranger
- Auditing
  - Azure monitor
- Encryption
    - At rest: costumer key
    - In transit: TLS, IPSec
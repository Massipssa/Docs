# ACLs 
* Kafka uses Zookeeper to store ACLs 
* If no ACL is defined no user is authozided to access resource, except super user
* AdminClient API can be used to manage ACLs 
* ACLs are stored in Zookeeper and then propaged to broker there may be delay before take effect  

--transactional-id ?? 
--idempotent ?? 

* **P**rincipal (Allow/Denied) **O**peration From **H**ost on **R**esource matches **R**esources**P**attern 
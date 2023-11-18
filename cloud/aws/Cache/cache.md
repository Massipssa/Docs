## CloudFront

- Fast content delivery Network (CDN)service that securely delivers data, videos, applications, and APIs to customers
  globally
- It helps reduce latency and provide higher transfer speeds using AWS edge locations
- The only option to add HTTPS to a static website being hosted in an S3 bucket  

## ElasticCache 

- Managed service of Memcached and Redis
- Helps reduce load of databases for read intensive workloads 
- Helps make your application stateless 
- **Memcached**
  - Simple database caching solution 
  - Not a database by itself 
  - No failover or Multi-AZ support 
  - No backups
  - Multi-node for partitioning of data (sharding)
- **Redis** 
  - Supported as a caching solution 
  - Functions as a standalone database 
  - Read Replicas to scale reads and have high availability
  - Failover and Multi-AZ support
  - Supports backups 
  - Data Durability using AOF persistence
  - Supports Sets and Sorted Sets  

### Cache Security 

- Supports IAM Authentication for Redis 
- IMA policies on ElasticCache are only used for AWS API-level security
- Redis AUTH 
  - You can set a "password/token" when you create a Redis cluster 
  - This is an extra level of security for your cache (on top of security group)
  - Support SSL in flight encryption
- Memcached 
  - Support SASL-based authentication (advanced)
  

## DAX 

- In-memory caching solution 
- Can reduce DynamoDB response times from milliseconds to microseconds
- Highly available and lives inside the VPC you specify

## Global Accelerator

- Is networking service that sends your users' traffic through AWS's global network infrastructure. It can increase
performance and help deal with IP caching 
- 3 top features 
  - Masks complex architecture 
  - Speeds thing up 
  - Weighted pools 
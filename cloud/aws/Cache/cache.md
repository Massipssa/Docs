# CloudFront

- Fast content delivery Network (CDN)service that securely delivers data, videos, applications, and APIs to customers
  globally. 
- It helps reduce latency and provide higher transfer speeds using AWS edge locations
- The only option to add HTTPS to a static website being hosted in an S3 bucket  

# ElasticCache 

- Managed service of Memcached and Redis
- Memcached
  - Simple database caching solution 
  - Not a database by itself 
  - No failover or Multi-AZ support 
  - No backups
- Redis 
  - Supported as a caching solution 
  - Functions as a standalone database 
  - Failover and Multi-AZ support
  - Supports backups 

# DAX 

- In-memory caching solution 
- Can reduce DynamoDB response times from milliseconds to microseconds
- Highly available and lives inside the VPC you specify

# Global Accelerator

- Is networking service that sends your users' traffic through AWS's global network infrastructure. It can increase
performance and help deal with IP caching 
- 3 top features 
  - Masks complex architecture 
  - Speeds thing up 
  - Weighted pools 
# API Gateway

- Fully managed service
- Allows to easily publish, create, maintain, monitor and secure your API.

## Endpoint Types

- **Edge-Optimized (default)**
  - Requests are routed through the CloudFront Edge locations (improves latency)
  - The API Gateway still lives in only one region
- **Regional**
  - For clients within the same region
  - Cloud manually combine with CloudFront (more control over the caching strategies and distribution)
- **Private**
  - Can only be accessed from your VPC using an interface VPC endpoint (ENI)

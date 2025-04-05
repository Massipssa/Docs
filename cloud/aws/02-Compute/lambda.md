## Lambda

- Serverless compute service that lets run code without provisioning or managing the underlying servers 
- Billed for resources assigned and the code run time
- Limitations:
  - Execution
    - Memory allocation 128 MB to 10GB (1 MB increment)
    - Maximum execution time 900 seconds (15 minutes)
    - Environment variables (4 KB) 
    - Disk capacity in the function container (in /tmp): 512 MB to 10 GB
    - Concurrency executions: 1000 (can be increased)
  - Deployment
    - Lambda function deployment size (compressed .zip): 50MB
    - Size of uncompressed deployment (code + dependencies): 250 MB 
    - Can use the /tmp directory to load other files at startup
    - Size of environment variables: 4KB
    
- **Lambda@Edge** is a feature of CloudFront that lets you run code closer to your users, which improves performance 
and reduces latency.

## Serverless Application Repository

- Allows users to easily find, deploy or even publish their own serverless applications
- Uses AWS SAM template 
- Two actions 
  - publish 
  - deploy 

## Best practices 

- Separate business logic 
- Modular function
- Treact function as stateless
- Only include what you need

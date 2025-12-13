# CloudFront

## Origins

- S3 Buckets
  - For distributing files and caching them at the edge
  - Enhanced security with CloudFront **Origin Access Control (OAC)**
- Custom Origin (HTTP)
  - Application Load Balancer
  - EC2 instance
  - S3 website (must first enable the bucket as a static S3 website)
  - Any Http backend

## CloudFront vs S3 Cross Region Replication

- CloudFront
  - Global Edge network
  - Files are cached for TTL (maybe a day)
  - Great for static content that must be available everywhere
- S3 Cross Region Replication
  - Must be setup for each region you want replication to happen
  - Files are updated in near real-time
  - Read only
  - Great for dynamic content that needs to be available at low-latency in few regions

## Pricing

- The cost of data out per edge location varies
- Three price classes
  - **Price Class All:** all regions - best performance
  - **Price Class 200:** most regions, but excludes the most expensive regions
  - **Price Class 100:** only the least expensive regions

## Cache Invalidation

- In case you update the back-end origin, CloudFront doesn't know about it and will only get the refreshed content after
  the TTL has expired
- However, you can force an entire or partial cache refresh (tus bypassing the TTL) by performing a CloudFront invalidation
- You can in validate all files (*) or a special path (/pathname/*)

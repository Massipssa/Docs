# Route 53

- A highly available, scalable, fully managed and authoritative DNS
- It is also **Domain Registrar**
- It's global service
- It allows to register domain names, create hosted zones, and manage and create DNS records
- **_Hosted Zone:_** is a container for records that define how to route traffic to a domain and its subdomains
- **_CNAME:_** map domain name to another (example.net --> example.com)
- **_Alias record:_** is specifically used to point a domain apex (the root domain itself, such as example.com) or a subdomain to another DNS name, including third-party DNS names or AWS resources
- **_NS Record:_** is where DNS information are stored
- **_An A Record_**
  - Allows to convert the name of a domain directly into an IP address
  - They can also be used on the root (naked domain) itself
- **_AAAA_**
  - maps a hostname to IPv6
- Supports IPv4 and IPv6
- 7 Routing policies are available
- **TTL (time-to-live)** is the length of time that a DNS record get cached on the resolving server or the users own local machine

## Policies

### Simple Routing Policy

- You can have one record with multiple IP addresses
- If you specify multiple values in a record, Route 53 return all values to the user in random order

### Weighted Routing Policy

- Allows to split the traffic based on different weights assigned

### Failover Routing Policy

- Used to create an active/passive setup

### Geolocation Routing Policy

- Choose where the traffic will be sent based on the geographic location of your users

### Geo-proximity Routing Policy

- Route traffic to the resources based on the geographic location of your uses and your resources

### Latency Routing Policy

- Allows to route traffic based on the lowest latency for your end user

### MultiValue Routing Policy

- Return multiple values, such as IP addresses for your web servers, in response to DNS queries
- It's like a Simple routing using Health check

## Traffic Flow

- A visual editor lets you create sophisticated routing configuration for your resources using existing routing types
- Supports versionning so can roll out or roll back updates

# Route 53

- A highly available, scalable, fully managed and authoritative DNS
- It is also **Domain Registrar**
- It's global service
- It allows to register domain names, create hosted zones, and manage and create DNS records
- **_Hosted Zone:_** is a container for records that define how to route traffic to a domain and its subdomains

## DNS Record Types

| Record Type   | Purpose                                                                 | Example Usage                                      |
|---------------|-------------------------------------------------------------------------|----------------------------------------------------|
| **A**         | Maps domain name to an IPv4 address                                     | `example.com → 192.0.2.1`                          |
| **AAAA**      | Maps domain name to an IPv6 address                                     | `example.com → 2001:db8::1`                        |
| **CNAME**     | Maps one domain name to another                                         | `blog.example.net → example.com`                  |
| **Alias**     | Points root domain or subdomain to another DNS name or AWS resource     | `example.com → myapp.cloudfront.net`              |
| **NS**        | Specifies authoritative name servers for the domain                     | `example.com → ns-123.awsdns-45.org`              |
| **MX**        | Directs email to mail servers                                           | `example.com → mail.example.com (priority 10)`    |
| **TXT**       | Stores text data (commonly used for verification and SPF/DKIM records)  | `example.com → "v=spf1 include:amazonses.com"`    |
| **SRV**       | Specifies services available at a domain (used for VoIP, etc.)          | `_sip._tcp.example.com → 10 60 5060 sip.example.com` |
| **PTR**       | Maps IP address to domain name (reverse DNS)                            | `192.0.2.1 → example.com`                          |
| **SOA**       | Contains administrative info about the zone (primary NS, contact, etc.) | `example.com → ns-123.awsdns-45.org, hostmaster@example.com` |

- Supports IPv4 and IPv6
- 7 Routing policies are available
- **TTL (time-to-live)** is the length of time that a DNS record get cached on the resolving server or the users own local machine

## Route 53 Routing Policies

| Routing Policy              | Description                                                                 |
|----------------------------|----------------------------------------------------------------------------- |
| **Simple**                 | One record with multiple IPs; returns all values in random order             |
| **Weighted**               | Splits traffic based on assigned weights                                     |
| **Failover**               | Creates an active/passive setup                                              |
| **Geolocation**            | Routes traffic based on user's geographic location                           |
| **Geo-proximity**          | Routes based on location of users and resources                              |
| **Latency**                | Routes traffic to the resource with the lowest latency                       |
| **MultiValue**             | Returns multiple IPs; similar to Simple routing with health checks           |

## Traffic Flow

- A visual editor lets you create sophisticated routing configuration for your resources using existing routing types
- Supports versionning so can roll out or roll back updates

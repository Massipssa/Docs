# Route 53
- It's global service
- It allows to register domain names, create hosted zones, and manage end create DNS records
- **_CNAME:_** map domain name to another
- **_Alias record:_** ?
- **_NS Record:_** is where DNS information are stored 
- **_An A Record:_**: 
- Supports IPv4 and IPv6
- 7 Routing policies are available

## Simple Routing Policy

- You can have one record with multiple IP addresses
- If you specify multiple values in a record, Route 53 return all values to the user in random order

## Weighted Routing Policy 

- Allows to split the traffic based on different weights assigned

## Failover Routing Policy 

- USed to create an active/passive setup

## Geolocation Routing Policy

-  Choose where the traffic will be sent based on the geographic location of your users

## Geo-proximity Routing Policy 

- Route traffic to the resources based on the geographic location of your uses and your resources

## Latency Routing Policy 

- Allows to route traffic based on the lowest latency for your end user

## MultiValue Routing Policy 

- Return multiple values, such as IP addresses for your web servers, in response to DNS queries
- It's like a Simple routing using Health check
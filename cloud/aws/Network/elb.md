# Elastic Load Balancer

- Route the traffic to your instances that are healthy
- Must have at least two Availability Zone 
- Cannot go cross-region. You must create one per region
- Can attach Amazon Certification Manager SSL to any ELB for SSL

## Application Load Balancer 

- Operates on the layer 7 of OSI model
- Listener: checks for connection requests from clients, using the protocol and port you configure
- Rule 
- Target Group 
- Target
- Supports only HTTP and HTTPS

## Network Load Balancer 

- Operate at layer 4
- Use where we need extreme performance 
- Other use cases are where you need protocols not supported by Application Load Balancers 
- It can decrypt traffic, but you will need to install the certificate on the load balancer

## Classic Load Balancer 

- A 504 error means the gateway has timed out 
- Need the IPv4 address of your end use: look for the X-Forwarded-For header

### Sticky Sessions 

- Allow to bind a user's session to a specific EC2 instance

### X-Forwarded-For

- Allow to determine users IP 

### Registration Delay

- Allows load balancer to keep existing connection open if the EC2 instance are de-registered or become unhealthy

### Health Checks 

- Communicates with instances to determine their state
- ELB does not terminate (kill) unhealthy instance. It will just redirect traffic to healthy instance
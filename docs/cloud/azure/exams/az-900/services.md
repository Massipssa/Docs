## VMs

- IaaS
  - It's created from an image
  - Scale sets: manage a group of identical, load-balanced VMs
    - Can scale on demand or on defined schedule
    - Set automatically a load balancer to ensure that resources are being used efficiently
  - Availability sets: ensure VMs stagger updates, power and network connectivity preventing from losing VMs
    - Update domain
    - Fault domain
      - Groups VMs by common source power and network switch
    - Split Vms across three fault domains

## Azure Desktop ??

## Azure container
- PaaS 

## Azure function

- event-driven
- serverless
- Benefit
  - No infra management
  - Scalability
  - Pay for what you use
- Stateless (default) or stateful 

## Azure App Service 

- Support Windows and Linux 
- Automated deployment from Github, Azure DevOps and any Git repository
- Is HTTP-based service for hosting web apps, Rest full APIs and mobile back ends

## Azure Virtual Network 

- Enable resource to communicate
- Supports private and public endpoints 
- Filter traffic
  - Network security groups (inbound and outbound rules) 
  - Network virtual appliance: specialized VMs (running firewall, performing wide area network (WAN) optimization)
- Peering: enables to connect VNs 
  - Network between peered network is private
  - Travel in Microsoft backbone network
- User Defined Routes (UDR)
  - Allows to control routing table between subnets or between VNs 

## Azure Virtual Private Network

- Uses encrypted tunnel 
- Only one VPN gateway can be deployed in each virtual network 
- VPN gateway 
  - policy-based 
  - route-based 
  - both use pre-shaded key as the only method of authentication

## Azure ExpressRoute 

- Extends on-premise network to cloud over private connection 
- ExpressRoute connections don't go over the public internet
  
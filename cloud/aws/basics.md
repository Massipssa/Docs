# Basics

- [Access Management basics](#accesmanagement)
- [Security Responsability Models](#securitymodels)
- [Service Models](#servicemodels)
- [High Availability (HA) and Fault Tolerance (FT)](#ftha)
- [RPO and RTO](#rporto)
- [Scaling](#scaling)

## Access Management basics <a name="accesmanagement"></a>

1. **Principal:** an identity that makes a request to be authenticated
2. **Authentication:** process to authenticate a Principal
3. **Identity:** object that requires authentication and are authorized to access resources
4. **Authorization:** process of checking and allowing or denying access to resource to an Identity

## Security Responsibility Models <a name="securitymodels"></a>

- Two types of models
    - Security ***IN*** cloud: is the customer responsibility
    - Security ***OF*** the cloud: AWS responsibility

## Service Models <a name="servicemodels"></a>

- **IaaS (Infrastructure as a Service):** Infrastructre to manage (ex: EC2)
- ***PaaS (Platform as a Service):*** Data and Application to manage (ex: EMR)
- ***SaaS (Software as a Service):*** only Data needs to be managed (Ex: ??)

## High Availability (HA) and Fault Tolerance (FT) <a name="ftha"></a>

- **HA:** recover quickly in the event of failure (minimize the downtime)
- **FT:** operate through the failure with no user impact. Is more expensive and hard to achieve

## RPO and RTO <a name="rporto"></a>

- **Recovery Point Objective**
    - How much a busniss can tolerate to lose, expressed in time
    - The maximum time between failure and the last successful backup
- **Recovery Time Objective**
    - Maximum amount of time a system can be down
    - How long a solution takes to recover

## Scaling <a name="scaling"></a>

- **Vertical**
    - Increase the server capacity
    - Add more CPU and RAM
- **Horizontal**
    - Add more servers (machines)

## Tiered Application <a name="tiered"></a>

- Monolithic
- Micro services

## Encryption <a name="encryption"></a>

- Encryption on fly (SSL)
    - Data encrypted before sending and decrypted when received by the server
    - To protect against the MIMD attack
    - SSL certificates help to secure HTTPS
- Server side encryption at rest
- Client side encryption
    * Data encypted by the client and **never** decrypted by the server

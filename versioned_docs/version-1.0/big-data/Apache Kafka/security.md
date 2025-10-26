* Data encyption in-flight with SSL
* Authentication using SSL or SASL
* Authorization using ACLs

## Security models

- **PLAINTEXT**
    - Is the default model
    - No authentication, no authorization and insecure channel
    - To be used only for PoC (not for DEV/PPRDO or PROD)

- **SSL**
    - Uses X.509 certificate
    - No authentication
    - Need to have keystore/truststore for broker and client
    - **Broker side:**
        - ```listener=SSL://host_ip:6667```
        - ```inter.broker.protocol=SSL```
    - **Client side:**
        - ```security.protocol=SSL```
        
- **SASL_PLAINTEXT**
    - Uses:
        - Username / Password authentication
        - SCRAM (Salted password)
        - GSSAPI (Kerberos)
    - Supports User Authorization via Kafka ACLs or Apache Ranger
    - Sends secrets and data over wire **Plain** format
    - **Broker side:**
        - ```listener=SASL_PLAINTEXT://host_ip:6667```
        - ```inter.broker.protocol=SASL_PLAINTEXT```
        - ```sasl.enabled.mechanism=PLAIN | SCRAM | GSSAPI```
    - **Client side:**
        - ```security.protocol=SASL_PLAINTEXT```
        - ```saslmechanism=PLAIN | GSSAPI | SCRAM-SHA-256 | SCRAM-SHA-512 ```
- **SASL_SSL**
    - Same thing as **SASL_PLAINTEXT** but:
        - Sends secrets and data over wire **Encrypted** format
        - Needs keystore/truststore for brokers and clients


## Authentication with SASL (Simple Authorization Service Layer)

```export KAFKA_OPTS="-Djava.security.auth.login.config=/home/massi/auth/kafka_server_jaas.conf"```
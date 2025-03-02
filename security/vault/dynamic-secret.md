To follow this tutorial, you need a running vault server on kubernetes. If not you can run the following helm commands 
to setup Vault. 

is standard security practice to isolate secrets from code, and developers should not concern themselves with the 
origin of these secrets. This is where HashiCorp Vault comes in to centralize those secrets. In case one or multiple of
these secrets get compromised, you'll need to revoke them and generate new ones to mitigate risks with minimal impact on the systems utilizing them.

In this article, we'll cover how you can achieve that using Vault and to secure a PostgreSQL database. We will end by
demonstrating how we can use these secrets with Python.

## Why Dynamic Secrets

Here are some leaks that lead us to consider using Dynamic Secrets instead of Static Secrets.

Applications frequently log configurations, leaving them in log files or centralized logging systems like Elasticsearch,
which can be accessed by unauthorized individuals viewing your credentials.

Often, secrets are captured in exception tracebacks while attempting to access the database, for instance.
These crash reports are sent to external monitoring systems, or they may be leaked via debugging endpoints and 
diagnostic pages after encountering an error.

It's common within organizations for multiple applications to share the same credentials to access other systems,
such as a database. This means that rotating those passwords will impact all applications using those credentials. 
Now, imagine one of these applications getting compromised. It will require you to rotate these credentials across all your applications.

All these challenges lead us to use a secret that can be generated and revoked on demand with less impact.

## What's Dynamic Secrets

From Harshicop Vault website:

A dynamic secret is generated on demand and is unique to a client, instead of a static secret, which is defined ahead 
of time and shared. Vault associates each dynamic secret with a lease and automatically destroys the credentials when 
the lease expires.

## Postgresql

In this section, we assume that you already have a PostgreSQL database server running. Alternatively, if you're 
a Kubernetes and Helm user, you can set up a PostgreSQL database server by executing the commands below.

```
helm install postgres oci://registry-1.docker.io/bitnamicharts/postgresql
kubectl get secret --namespace default postgres-postgresql -o jsonpath="{.data.postgres-password}" | base64 -d
```

The PostgreSQL server that we are using throughout this tutorial can be accessed using the information below. 
Please note that this information is temporary and local, and you cannot use it in your own environment.

user: postgres
port: 5432
password: FAKE_PWD
host: postgres-postgresql

### Create database

Connect to the database and create a database named ***dbtest***.
psql host=localhost port=5432 user=postgres password=SgOdV1ctSe
CREATE DATABSE IF NOT EXISTS dbtest

Above, we establish a connection to the database using the psql tool (alternatively, you can use any other 
PostgreSQL client tool). Subsequently, we execute the create database command to set up our schema.

## Vault

Generating secrets dynamically for a PostgreSQL database can be done in two steps: configuring the plugin and creating a role.

### Configure the plugin

vault login

export CONNECTION_URL="postgresql://{{username}}:{{password}}@postgres-postgresql:5432/dbtest"
vault write database/config/my-postgresql-database \
    plugin_name="postgresql-database-plugin" \
    allowed_roles="my-role" \
    connection_url= ${CONNECTION_URL} \
    username="postgres" \
    password="FAKE_PWD" \
    password_authentication="scram-sha-256"

### Create a role

Below, we create a role called **test-role** and then we mapped it to an SQL statement that will create a new database 
user with select permision granted to  
all tables inside the **public** schema.  

vault write database/roles/test-role \
    db_name="my-postgresql-database" \
    creation_statements="CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}'; \
        GRANT SELECT ON ALL TABLES IN SCHEMA public TO \"{{name}}\";" \
    default_ttl="1h" \
    max_ttl="24h"

vault read database/creds/my-role

## Read from python

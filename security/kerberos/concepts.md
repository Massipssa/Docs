## Kerberos concepts 

* **Principal** : an identity needs to be verified 
	* User Principal Names (UPN)
	* Service Principal Names (SPN)


* **Realm** 
A realm in Kerberos refers to an authentication administrative domain. Principals are assigned to specific realms in order to demarcate boundaries and simplify administration

* **Key distribution center (KDC)**: contains all infomations about principals and realm. It consists of: 
    * Kerberos database: it stores  
        * UPN and SPN 
        * Encryption keys 
        * Tickets validation duration 
        * Experation date 
        * ...
	* Authentication Server (AS) : 
	    * Delivers TGT (Ticket Granting Ticket)
	    * Authenticates users 
	* Ticket Granting Server (TGS): 
	    * Delivers TS (Ticket Service)

## Example: Access hdfs 
1. Authenticate using ***kinit** service 
2. Sends authentication to Authentication Server
3. If OK: AS sends TGT to user and ***kinit*** will store TGT in credential cache and user is Authenticated 
4. Now user wants to run command ```hdfs dfs -ls ```
    1. Hadoop will use TGT and reach Ticket Granting Server
    2. TGS will grant TS (Ticket Service) and client will cache TS
5. Hadoop RPC will use TS to reach the Namenode 
6. Clinet and Namenode exchange Tickets (Client ticket prouve client identity and Namenode determines the identification of Namenode)

### Kerberos on Hadoop 

1.  Create KDC 
2.  Create service principal for each service (HDFS, Yarn, ...) 
3.  Create Encrypted Kerberos Keys (Keytabs) for each service 
4.  Distribute keytab for service pricipals to each service on the cluster nodes 
5.  Configure all services (HDFS, Yarn, Hive, ...) to rely on Kerberos 


### Instalation
- One node acts as KDC 
- Other nodes act as clients 

1. ***Install client*** 
```
sudo apt-get install krb5-user libpam-krb5 libpam-ccreds auth-client-config

```

2. ***Install Kerberos Admin Server:*** this install the server and KDC 
```
sudo apt-get install krb5-kdc krb5-admin-server`
```

3. ***Create realm:*** to initialize a new realm on the machine that will act as KDC server

```bash
sudo krb5_newrealm
vi /etc/krb5kdc/kdc.conf
```

4. ***Create KDC database***
```
kdb5_util create -r EXAMPLE.COM -s
```


* Form client side 

```
vi /etc/krb5.conf
```

### Usel link

- https://examples.javacodegeeks.com/enterprise-java/apache-hadoop/hadoop-kerberos-authentication-tutorial/
- https://www.oreilly.com/library/view/hadoop-security/9781491900970/ch04.html


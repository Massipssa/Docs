# SSL/TLS

- SSL (Secured Sockets Layer) replaced by TLS (Transport Layer Security)
- Protocol used to communicate over the internet with HTTPS
- Provides:
  - Authentication
  - Encryption

- Crypto sym (problème c'est dans l'échange des clés)
  - private key

- Crypto asym (assure la confidentialité de l'échange)
  - private key
  - public key
- Use certificate to counter Man in middle attack

- **Public Key Infrastructure (PKI)**

## Algo de chiffrement
  
- AES : Advanced Encryption Standard 
	 Key size (128 to 256 bytes)
- RSA :
	- private key : pour déchiffrer  
	- public key pour chiffrer  
	- key size (1024 to 4096)
- SHA : Secure Hash Algorithm 
	- Un algortime de hashage, il permet pas de chiffrer les données, mais de créer une empreinte 

- Clé de chiffrement

- TLS certificate: data file encrypted and contains 
    - Public key 
    - Domain name
    - Hostname 
    - Server details tied to an organization 
    
- To use SSL, an organization needs to install SSL/TLS certificate on the webserver 
    
https://dzone.com/articles/ssl-in-java
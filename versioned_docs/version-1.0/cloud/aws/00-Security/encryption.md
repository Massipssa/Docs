# Encryption

1. Encryption on fly (SSL)
   - Data encrypted before sending and decrypted when received by the server
   - To protect against the MIMD (Man in the Middle Attack)
   - SSL certificates help to secure HTTPS

2. Server side encryption at rest
   - Data is encrypted after being received by the server
   - Data decrypted before being sent
   - It is stored in an encrypted form thanks to key (usually a data key)

3. Client side encryption
   - Data encrypted by the client and **never** decrypted by the server

- SSE-S3
- SSE-KMS
- SSE-C
- Client Side Encyption
- Encyption in tansit (SSL)

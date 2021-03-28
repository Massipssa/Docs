## X.509 Certification

- Key:
    - Used to encrypt data
    - Must be secret
- Algorithm
    - Method for encryption (process applied to make data unreadable)
    - May be public
- Encryption
    - Symmetric
        - One key for both parties
        - Faster than asymmetric
        - Ex: Blowfish, AES
    - Asymmetric: uses two keys
        - Public key for encryption
        - Private key for decryption
- Hashing
    - Convert input to output
    - Each string has a unique hash
    - Is one way
    - Common algorithm: crc-32 (insecure) md5, sha-1, ...
- Salt
    - Additional text value added to the ciphertext to improve the security
    
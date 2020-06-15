## X.509 Certification

- Key:
    - Used to encrypte data
    - Must be secret
- Algorithm
    - Method for encryption (process applied to make data unreadable)
    - May be public
- Encryption
    - Symetric
        - One key for both parties
        - Faster than asymmetric
        - Ex: Blowfish, AES
    - Asymetric: uses two keys
        - Public key for encryption
        - Private key for decryption
- Hashing
    - Convert input to output
    - Eash string has a unique hash
    - Is one way
    - Common algorithm: crc-32 (insecure) md5, sha-1, ...
- Salt
    - Addional text value added to the ciphertext to improve the security
    
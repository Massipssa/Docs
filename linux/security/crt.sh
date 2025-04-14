echo "[STEP-1] create private key"
# openssl genrsa  -<algorithm> -out <key_filename> <key_size> 
openssl genrsa -aes128 -out private_key.pem 2048 

echo "[STEP-2] generating self-signed certificate (public key)"
# openssl req -utf8 -new -key <key_filename> -x509 -days <cert_lifespan> -out <cert_filename>
openssl req -utf8 -new -key  private_key.pem -x509 -days 365 -out mycert.crt

echo "[STEP-3] Display a certificate"
openssl x509 -in mycert.crt -text -noout
 
echo "[STEP-4] create Certificate siging request"
#openssl req -new -key <priv_key.pem> -out <output.csr>
openssl req -new -key  private_key.pem  -out output.csr
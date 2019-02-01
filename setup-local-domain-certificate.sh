CERT_FILENAME=server
CERT_CONFIG=configuration/config.csr.cnf
V3_CONFIG=configuration/v3.ext

CA_FILENAME=${1:-root}

echo _______________________________________________________
echo
echo GENERATING SIGNING REQUEST
echo
# Generate the certificate signing request
openssl req \
  -new \
  -sha256 \
  -nodes \
  -out "$CERT_FILENAME.csr" \
  -newkey rsa:2048 \
  -keyout "$CERT_FILENAME.key" \
  -config $CERT_CONFIG

echo _______________________________________________________
echo
echo GENERATING CERTIFICATE
echo
# Generate a certificate key
openssl x509 \
  -req \
  -in "$CERT_FILENAME.csr" \
  -CA "$CA_FILENAME.pem" \
  -CAkey "$CA_FILENAME.key" \
  -CAcreateserial \
  -out "$CERT_FILENAME.crt" \
  -days 500 \
  -sha256 \
  -extfile $V3_CONFIG

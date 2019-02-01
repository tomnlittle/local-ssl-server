CA_FILENAME=root
CA_DURATION=1024
RSA_KEY_LENGTH=2048

echo _______________________________________________________
echo
echo GENERATING RSA KEY
echo
# Generate an RSA key
openssl genrsa \
  -des3 \
  -out "$CA_FILENAME.key" $RSA_KEY_LENGTH

echo _______________________________________________________
echo
echo GENERATING ROOT CERTIFICATE
echo
# Use the RSA key to generate the root certificate
openssl req \
  -x509 \
  -new \
  -nodes \
  -key "$CA_FILENAME.key" \
  -sha256 \
  -days $CA_DURATION \
  -out "$CA_FILENAME.pem"

echo _______________________________________________________
echo
echo INSERTING ROOT CERTIFICATE
echo
# Insert the root certificate into the osx keychain
sudo security add-trusted-cert \
  -d \
  -r trustRoot \
  -k /Library/Keychains/System.keychain "$CA_FILENAME.pem"

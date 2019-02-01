
<h1 align="center">
  <br>
  <img src="docs/symbol.svg" alt="Logo" width="120">
  <br>
    Local Docker SSL Server
  <br>
</h1>

<p align="center">
  <a href="#requirements">Requirements</a> •
  <a href="#environment-variables">Environment Variables</a> •
  <a href="#how-to-use">How To Use</a> •
  <a href="#Tests">Tests</a> •
  <a href="#acknowledgements">Acknowledgements</a> •
</p>

## Requirements
* Docker
* Yarn or npm (Replace yarn with npm wherever it appears)
* Docker-compose
* OSX

## Environment Variables

### Server Environment
KEY_PATH: <Path to the server key file>

CERT_PATH: <Path to the server certificate>

### Test Environment
TARGET_HOST: <The target host, if outside of the container use localhost>

CA_CERT_PATH: <Path to the certificate authority secret, request library needs this to be explicitly set>

## How To Use

```bash
# Clone this repository
$ git clone https://github.com/tomnlittle/local-ssl-server

# Go into the repository
$ cd local-ssl-server

# Setup the Root Certificate Authority
$ ./setup-rootCA.sh

# Setup the certificates
$ ./setup-local-domain-certificate.sh

# Setup the server dependencies
$ yarn

# Run the stack
$ yarn docker:start

# Open the Logs
$ yarn docker:logs
```

## Tests
Tests are run using jest and are automatically started with the rest of the stack.
The Certificate Authority needs to be loaded into request promise in order to issue requests.

Checkout the request.spec.ts file for further details.



## Acknowledgements

* [Medium - HTTPS Your Local Development Environment](https://medium.freecodecamp.org/how-to-get-https-working-on-your-local-development-environment-in-5-minutes-7af615770eec)
* [Top Graphic](https://publicdomainvectors.org/en/free-clipart/Brown-net-server-vector-graphics/13472.html)


---

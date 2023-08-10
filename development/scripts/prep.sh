#!/bin/bash
dir=$1
echo "Prep Script!"
echo "Working Directory is: $dir"
# Create ssl root certificate
mkdir -p $dir/development/ssl
openssl genrsa -out $dir/development/ssl/key
openssl req -x509 -new -nodes -key $dir/development/ssl/cert \
    -days 3650 -sha256 -out $dir/development/ssl/tls.crt -subj "/CN=crucible-ca"
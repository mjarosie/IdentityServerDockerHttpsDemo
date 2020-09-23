#!/usr/bin/env bash

# exit when any command fails
set -e

# trust dev root CA
openssl x509 -inform DER -in /https-root/aspnetapp-root-cert.cer -out /https-root/aspnetapp-root-cert.crt
cp /https-root/aspnetapp-root-cert.crt /usr/local/share/ca-certificates/
update-ca-certificates

# start the app
dotnet watch run
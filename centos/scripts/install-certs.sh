#!/bin/bash
# Install trusted CA certificates
# @author Michael Poore
# @website https://blog.v12n.io

# Variables
pkiServer="http://<<CRL localtion>>/CertEnroll"
pkiCerts=("Root-CA.crt" "Issuing-CA.crt")

# Download certificates
cd /etc/pki/ca-trust/source/anchors
for cert in ${pkiCerts[@]}; do
    sudo wget -q $pkiServer/$cert
done

# Update CA trust
sudo update-ca-trust extract
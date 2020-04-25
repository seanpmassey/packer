#!/bin/bash
# Install v12n public SSH key(s)
# @author Michael Poore
# @website https://blog.v12n.io

# Variables
artifact="http://<<artifactory>>:8082/artifactory/packer-local/centos/8/ssh/public_keys/v12n/authorized_keys"

# Install key(s)
mkdir ~/.ssh
chmod 700 ~/.ssh
cd ~/.ssh
wget -q $artifact
chmod 644 authorized_keys
#!/bin/bash

set -xe

echo -e "\n--- Bootstrapping ---"
cd /var/app/current/.docker/development

echo '127.0.0.1   dev-app.library.uq.edu.au' >> /etc/hosts


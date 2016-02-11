#!/usr/bin/env bash

echo on
echo [Installing OpenPKW Weryfikator Frontend - Docker version]

sudo apt-get update

echo [Installing Docker]
sudo wget -qO- https://get.docker.com/ | sh

echo [Preparing environment to build a Docker image for openpkw-weryfikator-frontend]
mkdir openpkw-weryfikator-frontend
cd openpkw-weryfikator-frontend
sudo cp /vagrant/Dockerfile .
sudo cp /vagrant/.ssh/authorized_keys .
sudo cp /vagrant/etc/apache2/sites-available/openpkw-weryfikator-frontend.conf .
sudo cp /vagrant/index.html .

sudo docker build -t openpkw-weryfikator-frontend .
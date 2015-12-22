#!/usr/bin/env bash

echo on
echo [Installing OpenPKW Continuous Delivery Environment - Docker version]

sudo apt-get update

echo [Installing Docker]
sudo wget -qO- https://get.docker.com/ | sh

echo [Preparing environment to build a Docker image for openpkw-kalkulator-obwodowy-web]
mkdir openpkw-kalkulator-obwodowy-web
cd openpkw-kalkulator-obwodowy-web
sudo cp /vagrant/Dockerfile .
sudo cp /vagrant/.ssh/authorized_keys .
sudo cp /vagrant/etc/apache2/sites-available/openpkw-kalkulator-obwodowy-web.conf .
sudo cp /vagrant/index.html .

sudo docker build -t openpkw-kalkulator-obwodowy-web .
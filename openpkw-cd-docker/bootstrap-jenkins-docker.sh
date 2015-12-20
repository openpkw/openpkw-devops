#!/usr/bin/env bash

echo on
echo [Installing OpenPKW Continuous Delivery Environment - Docker version]

sudo apt-get update

echo [Installing Docker]
sudo wget -qO- https://get.docker.com/ | sh

mkdir openpkw-jenkins-docker
cd openpkw-jenkins-docker
mkdir .ssh
cp /vagrant/Dockerfile .
cp /vagrant/jenkins/.ssh/openpkw-jenkins-cd.pem .ssh/openpkw-jenkins-cd.pem

sudo docker build -t openpkw-jenkins-docker .
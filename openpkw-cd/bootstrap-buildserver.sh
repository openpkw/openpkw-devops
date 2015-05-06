#!/usr/bin/env bash

echo [Installing OpenPKW Continuous Delivery Environment]

echo [Installing updates]
sudo apt-get -y update

echo [Installing JAVA]
sudo apt-get -y install openjdk-7-jdk
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64

echo [Installing Jenkins]
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get -y update
sudo apt-get -y install jenkins

echo [Installing git]
sudo apt-get -y install git

echo [Installing Maven]
sudo apt-get -y install maven

echo [Installing Node.js]
sudo apt-get -y install nodejs
sudo ln /usr/bin/nodejs /usr/bin/node -s

echo [Installing npm]
sudo apt-get -y install npm
sudo npm install -g npm
sudo npm install -g grunt-cli
sudo npm install -g bower

echo [Configuring Continuous Delivery]
sudo mkdir /var/lib/jenkins/.ssh
sudo chown jenkins:jenkins /var/lib/jenkins/.ssh
sudo cp /vagrant/jenkins/.ssh/openpkw-jenkins-cd.pem /var/lib/jenkins/.ssh/
sudo chown jenkins:jenkins /var/lib/jenkins/.ssh/openpkw-jenkins-cd.pem

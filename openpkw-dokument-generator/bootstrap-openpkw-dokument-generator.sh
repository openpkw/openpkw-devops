#!/usr/bin/env bash
echo [Installing openpkw-dokument-generator Environment]

echo [Installing updates]
sudo apt-get -y update

echo [Installing JAVA]
sudo apt-get -y install openjdk-7-jdk
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64

echo [Installing JBoss]
sudo wget http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.tar.gz -P /usr/src/
sudo tar xfvz /usr/src/jboss-as-7.1.1.Final.tar.gz -C /usr/share/
sudo ln /usr/share/jboss-as-7.1.1.Final /usr/share/jboss -s
sudo useradd jboss
sudo chown -fR jboss.jboss /usr/share/jboss-as-7.1.1.Final
jenkins_password=`cat /vagrant/jboss/jenkins_password`
sudo /usr/share/jboss/bin/add-user.sh --silent=true jenkins $jenkins_password
sudo cp /vagrant/jboss/standalone.xml /usr/share/jboss/standalone/configuration/standalone.xml
sudo cp /vagrant/etc/init.d/jbossas7 /etc/init.d/jbossas7
sudo chmod +x /etc/init.d/jbossas7
sudo service jbossas7 start
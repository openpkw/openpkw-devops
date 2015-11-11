#!/usr/bin/env bash
echo on
echo [Installing openpkw-weryfikator Environment]

echo [Installing updates]
sudo apt-get -y update

echo [Installing JAVA]
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get -y install oracle-java8-installer
export JAVA_HOME=/usr/lib/jvm/java-8-oracle/jre/bin/java

echo [Installing WildFly]
sudo wget http://download.jboss.org/wildfly/9.0.1.Final/wildfly-9.0.1.Final.tar.gz -P /usr/src/
sudo tar xfvz /usr/src/wildfly-9.0.1.Final.tar.gz -C /usr/share/
sudo ln /usr/share/wildfly-9.0.1.Final /usr/share/wildfly -s

echo [Configuring WildFly]
sudo useradd wildfly
sudo chown -fR wildfly.wildfly /usr/share/wildfly-9.0.1.Final
jenkins_password=`cat /vagrant/wildfly/jenkins_password`
sudo /usr/share/wildfly/bin/add-user.sh --silent=true jenkins $jenkins_password
sudo cp /vagrant/wildfly/standalone.xml /usr/share/wildfly/standalone/configuration/standalone.xml
sudo cp /vagrant/etc/init.d/wildfly9 /etc/init.d/wildfly9
sudo chmod +x /etc/init.d/wildfly9
sudo service wildfly9 start

echo [Installing MySQL]
mysql_root_password=`cat /vagrant/mysql/mysql_root_password`
export DEBIAN_FRONTEND=noninteractive
sudo apt-get -q -y install mysql-server
sudo mysqladmin -u root password $mysql_root_password
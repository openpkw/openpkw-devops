#!/usr/bin/env bash
echo on
echo [Installing openpkw-weryfikator Environment]

echo [Getting updates]
sudo apt-get -y update

echo [Installing unzip]
sudo apt-get install unzip

echo [Installing JAVA]
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get -y update

echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get -y install oracle-java8-installer
export JAVA_HOME=/usr/lib/jvm/java-8-oracle/jre

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
echo mysql-server mysql-server/root_password password $mysql_root_password | sudo debconf-set-selections
echo mysql-server mysql-server/root_password_again password $mysql_root_password | sudo debconf-set-selections
sudo apt-get -q -y install mysql-server

echo [Creating OpenPKW Database]
command = a="mysql -u root -p'"$mysql_root_password"' < /vagrant/mysql/sql/001_Create_OpenPKW_schema_and_user.sql"
eval $command

echo [Configuring DataSource for OpenPKW]
sudo wget http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.37.zip -P /usr/src/
sudo unzip /usr/src/mysql-connector-java-5.1.37.zip -d /usr/src/mysql-connector-java-5.1.37
sudo /usr/share/wildfly/bin/jboss-cli.sh --connect --file=/vagrant/wildfly/cli/001_Install_MySql_Driver.cli
sudo /usr/share/wildfly/bin/jboss-cli.sh --connect --file=/vagrant/wildfly/cli/002_Register_MySql_Driver.cli
sudo /usr/share/wildfly/bin/jboss-cli.sh --connect --file=/vagrant/wildfly/cli/003_Create_OpenPKW_datasource.cli
FROM ubuntu:14.04

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN apt-get -y update &&\
    apt-get -y install software-properties-common &&\
    add-apt-repository ppa:webupd8team/java &&\
    apt-get -y update &&\
    echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections &&\
    echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections &&\
    apt-get -y install oracle-java8-installer &&\
    apt-get -y install openssh-server &&\
    apt-get -y install unzip
    

RUN wget http://download.jboss.org/wildfly/9.0.1.Final/wildfly-9.0.1.Final.tar.gz -P /usr/src/ &&\
    tar xfvz /usr/src/wildfly-9.0.1.Final.tar.gz -C /usr/share/ &&\
    ln /usr/share/wildfly-9.0.1.Final /usr/share/wildfly -s

RUN useradd -ms /bin/bash wildfly
USER wildfly
USER root

WORKDIR /root/init
ADD run.sh /root/init/run.sh
ADD /mysql/mysql_root_password /root/init/mysql_root_password
ADD /wildfly/jenkins_password /root/init/jenkins_password
RUN chmod +x /root/init/run.sh

WORKDIR /root/init/wildfly
ADD wildfly/standalone.xml /root/init/wildfly/standalone.xml
ADD etc/init.d/wildfly9 /etc/init.d/wildfly9

RUN chown -fR wildfly:wildfly /usr/share/wildfly-9.0.1.Final &&\
    /usr/share/wildfly/bin/add-user.sh --silent=true jenkins `cat /root/init/jenkins_password` &&\
    cp /root/init/wildfly/standalone.xml /usr/share/wildfly/standalone/configuration/standalone.xml &&\
    chmod +x /etc/init.d/wildfly9

ENV DEBIAN_FRONTEND=noninteractive

RUN echo mysql-server mysql-server/root_password password `cat /root/init/mysql_root_password` | debconf-set-selections &&\
    echo mysql-server mysql-server/root_password_again password `cat /root/init/mysql_root_password` | debconf-set-selections &&\
    apt-get -q -y install mysql-server

WORKDIR /root/init/mysql
ADD /mysql/sql/001_Create_OpenPKW_schema_and_user.sql /root/init/mysql/sql/001_Create_OpenPKW_schema_and_user.sql
WORKDIR /root/init/wildfly/cli
ADD /wildfly/cli/001_Install_MySql_driver.cli /root/init/wildfly/cli/001_Install_MySql_driver.cli
ADD /wildfly/cli/002_Register_MySql_driver.cli /root/init/wildfly/cli/002_Register_MySql_driver.cli
ADD /wildfly/cli/003_Create_OpenPKW_datasource.cli /root/init/wildfly/cli/003_Create_OpenPKW_datasource.cli

RUN wget http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.37.zip -P /usr/src/ &&\
    unzip /usr/src/mysql-connector-java-5.1.37.zip -d /usr/src/mysql-connector-java-5.1.37 

EXPOSE 22
EXPOSE 9080
EXPOSE 9990
EXPOSE 9999   

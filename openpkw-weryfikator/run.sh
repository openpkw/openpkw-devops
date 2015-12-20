#!/bin/bash
service mysql start 
service wildfly9 start
if [ -f /root/init/mysql_root_password ] ; then
   sleep 20s
   mysql -u root --password=`cat /root/init/mysql_root_password` < /root/init/mysql/sql/001_Create_OpenPKW_schema_and_user.sql
   rm /root/init/mysql_root_password
fi

if [ -f /root/init/jenkins_password ] ; then
   sleep 40s
   /usr/share/wildfly/bin/jboss-cli.sh --connect --file=/root/init/wildfly/cli/001_Install_MySql_driver.cli --user=jenkins --password=`cat /root/init/jenkins_password`
   /usr/share/wildfly/bin/jboss-cli.sh --connect --file=/root/init/wildfly/cli/002_Register_MySql_driver.cli --user=jenkins --password=`cat /root/init/jenkins_password` 
   /usr/share/wildfly/bin/jboss-cli.sh --connect --file=/root/init/wildfly/cli/003_Create_OpenPKW_datasource.cli --user=jenkins --password=`cat /root/init/jenkins_password` 
   rm /root/init/jenkins_password
fi

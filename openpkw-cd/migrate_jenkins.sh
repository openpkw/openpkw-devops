#!/usr/bin/env bash

echo [Migrating Jenkins configuration]
mkdir jenkins_migration
mkdir jenkins_migration/backup
mkdir jenkins_migration/migrated_configuration

echo [Stopping Jenkins service]
sudo service jenkins stop

echo [Downloading Jenkins configuration for OpenPKW]
wget http://www.sebastian-celejewski.pl/remek/openpkw-jenkins-small.tar.bz2
mv openpkw-jenkins-small.tar.bz2 jenkins_migration/migrated_configuration 

echo [Backing up existing Jenkins configuration]
sudo tar czf jenkins_migration/backup/jenkins-backup.tgz -C /var/lib/jenkins .

echo [Extracting migrated Jenkins configuration]
bzip2 -d jenkins_migration/migrated_configuration/openpkw-jenkins-small.tar.bz2

echo [Replacing Jenkins home directory with extracted Jenkins configuration]
sudo tar xf jenkins_migration/migrated_configuration/openpkw-jenkins-small.tar -C /var/lib/
sudo chown -R jenkins:jenkins /var/lib/jenkins

echo [Launching Jenkins service]
sudo service jenkins start
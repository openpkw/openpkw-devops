#!/usr/bin/env bash
echo [Installing OpenPKW Frontend Environment]

echo [Installing updates]
sudo apt-get -y update

echo [Installing Apache]
sudo apt-get -y install apache2

echo [Installing Node.js]
sudo apt-get -y install nodejs

echo [Installing npm]
sudo apt-get -y install npm

echo [Configuring Continuous Delivery]
sudo useradd openpkw-cd -m
sudo mkdir /var/www/html/openpkw-kalkulator-obwodowy-web
sudo chmod a+rwx /var/www/htmlopenpkw-kalkulator-obwodowy-web
sudo mkdir /home/openpkw-cd/.ssh
sudo cp /vagrant/.ssh/authorized_keys /home/openpkw-cd/.ssh/authorized_keys
sudo chown openpkw-cd:openpkw-cd /home/openpkw-cd/.ssh
sudo chown openpkw-cd:openpkw-cd /home/openpkw-cd/.ssh/authorized_keys
sudo chmod 700 /home/openpkw-cd/.ssh
sudo chmod 600 /home/openpkw-cd/.ssh/authorized_keys

sudo cp /vagrant/etc/apache2/sites-available/openpkw-kalkulator-obwodowy-web.conf /etc/apache2/sites-available/openpkw-kalkulator-obwodowy-web.conf
sudo cp /vagrant/index.html /var/www/html/openpkw-kalkulator-obwodowy-web/index.html
sudo chmod a+rwx /var/www/html/openpkw-kalkulator-obwodowy-web/index.html

sudo a2dissite 000-default.conf
sudo a2ensite openpkw-kalkulator-obwodowy-web.conf
sudo service apache2 restart
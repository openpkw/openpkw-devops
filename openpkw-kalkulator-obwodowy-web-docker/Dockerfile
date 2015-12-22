FROM ubuntu:14.04
RUN apt-get -y update && \
    apt-get -y install apache2 &&\
    apt-get -y install nodejs &&\
    apt-get -y install npm

RUN useradd openpkw-cd -m &&\
    mkdir /var/www/html/openpkw-kalkulator-obwodowy-web &&\
    chmod a+rwx /var/www/html/openpkw-kalkulator-obwodowy-web &&\
    mkdir /home/openpkw-cd/.ssh &&\
    cp /vagrant/.ssh/authorized_keys /home/openpkw-cd/.ssh/authorized_keys &&\
    chown openpkw-cd:openpkw-cd /home/openpkw-cd/.ssh &&\
    chown openpkw-cd:openpkw-cd /home/openpkw-cd/.ssh/authorized_keys &&\
    chmod 700 /home/openpkw-cd/.ssh &&\
    chmod 600 /home/openpkw-cd/.ssh/authorized_keys &&\

RUN cp /vagrant/etc/apache2/sites-available/openpkw-kalkulator-obwodowy-web.conf /etc/apache2/sites-available/openpkw-kalkulator-obwodowy-web.conf &&\
    cp /vagrant/index.html /var/www/html/openpkw-kalkulator-obwodowy-web/index.html &&\
    chmod a+rwx /var/www/html/openpkw-kalkulator-obwodowy-web/index.html &&\

RUN a2dissite 000-default.conf &&\
    a2ensite openpkw-kalkulator-obwodowy-web.conf &&\
    service apache2 restart

EXPOSE 80





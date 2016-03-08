FROM ubuntu:14.04
RUN apt-get -y update && \
    apt-get -y install apache2 &&\
    apt-get -y install nodejs &&\
    apt-get -y install npm &&\
    apt-get -y install ssh &&\
    apt-get -y install wget

ADD authorized_keys /home/openpkw-cd/.ssh/authorized_keys

RUN useradd openpkw-cd -m &&\
    mkdir /var/www/html/openpkw-kalkulator-obwodowy-web &&\
    chmod a+rwx /var/www/html/openpkw-kalkulator-obwodowy-web &&\
    mkdir -p /home/openpkw-cd/.ssh &&\
    chown openpkw-cd:openpkw-cd /home/openpkw-cd/.ssh &&\
    chown openpkw-cd:openpkw-cd /home/openpkw-cd/.ssh/authorized_keys &&\
    chmod 700 /home/openpkw-cd/.ssh &&\
    chmod 600 /home/openpkw-cd/.ssh/authorized_keys

ADD openpkw-kalkulator-obwodowy-web.conf /etc/apache2/sites-available/openpkw-kalkulator-obwodowy-web.conf
ADD index.html /var/www/html/openpkw-kalkulator-obwodowy-web/index.html

RUN chmod a+rwx /var/www/html/openpkw-kalkulator-obwodowy-web/index.html

RUN a2dissite 000-default.conf &&\
    a2ensite openpkw-kalkulator-obwodowy-web.conf &&\
    service apache2 restart

RUN a2enmod proxy_http

RUN service ssh start

EXPOSE 80
EXPOSE 22
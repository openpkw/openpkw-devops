FROM ubuntu:14.04
RUN apt-get -y update && \
    apt-get -y install apache2 &&\
    apt-get -y install nodejs &&\
    apt-get -y install npm &&\
    apt-get -y install wget

ADD authorized_keys /home/openpkw-cd/.ssh/authorized_keys

RUN useradd openpkw-cd -m &&\
    mkdir /var/www/html/openpkw-weryfikator-frontend &&\
    chmod a+rwx /var/www/html/openpkw-weryfikator-frontend &&\
    mkdir -p /home/openpkw-cd/.ssh &&\
    chown openpkw-cd:openpkw-cd /home/openpkw-cd/.ssh &&\
    chown openpkw-cd:openpkw-cd /home/openpkw-cd/.ssh/authorized_keys &&\
    chmod 700 /home/openpkw-cd/.ssh &&\
    chmod 600 /home/openpkw-cd/.ssh/authorized_keys

ADD openpkw-weryfikator-frontend.conf /etc/apache2/sites-available/openpkw-weryfikator-frontend.conf
ADD index.html /var/www/html/openpkw-weryfikator-frontend/index.html

RUN chmod a+rwx /var/www/html/openpkw-weryfikator-frontend/index.html

RUN a2dissite 000-default.conf &&\
    a2ensite openpkw-weryfikator-frontend.conf &&\
    sudo service apache2 restart

EXPOSE 80
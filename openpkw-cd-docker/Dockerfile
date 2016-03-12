FROM ubuntu:14.04
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
RUN apt-get -y update && \
    apt-get -y install software-properties-common &&\
    add-apt-repository ppa:webupd8team/java &&\
    apt-get -y update &&\
    echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections &&\
    echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections &&\
    apt-get -y install oracle-java8-installer &&\
    apt-get -y install openssh-server
RUN wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add - &&\
    sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
RUN sudo apt-get -y update &&\
    apt-get -y install jenkins &&\
    sudo apt-get -y install git &&\
    apt-get -y install maven &&\
    apt-get -y install nodejs &&\
    apt-get -y install gradle &&\
    sudo apt-get -y install libfontconfig
RUN ln /usr/bin/nodejs /usr/bin/node -s
RUN apt-get -y install npm
RUN npm install -g npm &&\
    npm install -g grunt-cli &&\
    npm install -g bower &&\
    npm install -g phantomjs
USER jenkins
WORKDIR /var/lib/jenkins/.ssh
ADD .ssh/openpkw-jenkins-cd.pem /var/lib/jenkins/.ssh/openpkw-jenkins-cd.pem
USER root
EXPOSE 8080
EXPOSE 22

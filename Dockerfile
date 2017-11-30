#version: 1.0.1
FROM ubuntu:16.04
MAINTAINER Konstanin Kalinovskyi <kkalinovskyi@gmail.com>
RUN apt-get update && apt-get install -y apache2 curl
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN apt-get install nodejs -y
RUN npm install -g --unsafe-perm @angular/cli
COPY . /var/www/html/
RUN cd /var/www/html/ && ng build
RUN rm -f /etc/apache2/sites-enabled/000-default.conf
COPY ./pipelines/scripts/000-default.conf /etc/apache2/sites-enabled/
COPY ./pipelines/scripts/test.sh /
WORKDIR /
ENTRYPOINT ["/test.sh"]


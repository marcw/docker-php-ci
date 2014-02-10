FROM stackbrew/ubuntu:saucy

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu saucy main universe" > /etc/apt/sources.list
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -qy curl ant make php5-gd php5 php5-cli php5-common php5-curl php5-intl php5-mysqlnd php-pear php5-xdebug php5-json
RUN pear config-set auto_discover 1
RUN pear install pear.phpqatools.org/phpqatools

RUN echo "suhosin.executor.include.whitelist = phar" | tee -a /etc/php5/cli/conf.d/99_erunner.ini
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin

RUN apt-get -qy install openjdk-7-jdk-headless curl
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

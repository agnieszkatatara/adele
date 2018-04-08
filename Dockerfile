FROM centos:centos6

LABEL purpose="Recruitment task" \
      client="uxpin"

RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all
RUN yum -y install nodejs npm git; yum clean all

WORKDIR /etc
RUN git clone https://github.com/marcintreder/adele.git
WORKDIR /etc/adele

RUN npm config set registry="http://registry.npmjs.org/"; npm cache clean -f; npm install -g n; n stable
RUN npm install

CMD bash

EXPOSE 8080

EXPOSE 5000

EXPOSE 2003

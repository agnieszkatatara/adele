FROM node:6

LABEL purpose="Recruitment task" \
      client="uxpin"

WORKDIR /etc

RUN git clone https://github.com/marcintreder/adele.git

WORKDIR /etc/adele

RUN npm install; npm run postinstall

CMD npm run start

EXPOSE 8080

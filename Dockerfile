FROM anapsix/alpine-java:8_jdk
RUN apk update
RUN apk add nodejs

WORKDIR ner

RUN npm i -S ner-server
RUN apk add wget
RUN sh node_modules/ner-server/install.sh

WORKDIR stanford-ner-2015-04-20
RUN jar -uf stanford-ner.jar classifiers/english.all.3class.distsim.crf.ser.gz # add classifiers to archive

COPY ner-server /bin/
CMD /bin/ner-server 

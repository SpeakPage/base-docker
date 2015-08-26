FROM node:0.12.7

ENV DEBIAN_FRONTEND=noninteractive
USER root

#GET REQUIRED SOURCES:
RUN apt-get update
RUN echo deb http://www.deb-multimedia.org jessie main non-free >>/etc/apt/sources.list
RUN apt-get update
RUN apt-get install deb-multimedia-keyring -y --force-yes
RUN apt-get update

# INSTALL LIBS:
RUN apt-get install software-properties-common -y
RUN apt-get install -y libavahi-client3
RUN apt-get install git python cmake gcc -y
RUN apt-get install g++ -y
RUN apt-get install libgroove-dev zlib1g-dev libpng12-dev -y
RUN apt-get install sox libsox-dev libsox-fmt-all -y
RUN apt-get install eyed3 -y
RUN apt-get install ffmpeg mongodb-clients -y

# Image editing utils:
RUN apt-get update -y
RUN apt-get upgrade -y
RUN curl -s https://raw.githubusercontent.com/lovell/sharp/master/preinstall.sh | bash -

RUN npm install -g coffee-script
RUN npm install -g node-gyp
RUN npm install node-pre-gyp -g

# CLEAN UP:
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

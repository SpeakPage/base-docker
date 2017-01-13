FROM docker.stackdot.com/lib/node:6.3.1

ENV DEBIAN_FRONTEND=noninteractive
USER root

#GET REQUIRED SOURCES:
RUN apt-get update && echo deb http://www.deb-multimedia.org jessie main non-free >>/etc/apt/sources.list && apt-get update && apt-get install deb-multimedia-keyring -y --force-yes && apt-get update

# INSTALL LIBS:
RUN apt-get install software-properties-common libavahi-client3 git python cmake gcc g++ libgroove-dev zlib1g-dev libpng12-dev sox libsox-dev libsox-fmt-all eyed3 ffmpeg mongodb-clients -y \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN npm install -g coffee-script node-gyp node-pre-gyp -g

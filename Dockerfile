FROM ubuntu:18.04

ARG SPIGOT_VER=1.16.4
ENV SPIGOT=spigot-${SPIGOT_VER}.jar

RUN apt-get update -y \ 
    && apt-get upgrade -y \
    && apt-get dist-upgrade -y \
    && apt-get install openjdk-11-jre-headless wget -y \
    && useradd -ms /bin/bash mc

USER mc
WORKDIR /home/mc

COPY ./eula.txt /home/mc
COPY ./entrypoint.sh /home/mc

RUN wget https://cdn.getbukkit.org/spigot/${SPIGOT}

ENTRYPOINT ["./entrypoint.sh"]




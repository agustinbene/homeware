FROM ubuntu:16.04
MAINTAINER JP Martin <jpmartin@gicom.com.ar>

ENV REFRESHED_AT=2020-02-12

RUN apt-get update \
 && apt-get install -y git sudo cron python3-pip apt-utils\
 && pip3 install --upgrade pip \
 && pip3 install cryptography \
 && pip3 install flask \
 && pip3 install gunicorn \
 && pip3 install paho-mqtt \
 && apt-get install -y software-properties-common curl mosquitto mosquitto-clients

RUN git clone https://github.com/jpmartin-gicom/homeware.git \
 && cd homeware \
 && sh bash/install.sh

EXPOSE 5001

CMD cd /homeware && python3 homeware.py

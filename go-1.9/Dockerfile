FROM ubuntu:16.04
MAINTAINER Stanley <grimmh6919@hotmail.com.tw>

# install some package
RUN apt-get update && apt-get install -y apt-utils python-software-properties 
RUN apt-get install -y language-pack-en
RUN locale-gen en_US.UTF-8

# install Go Lang
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:gophers/go && apt-get update
RUN apt-get install -y --force-yes build-essential  ca-certificates supervisor wget curl git vim unzip make binutils bison gcc
#RUN apt-get install -y --force-yes golang-1.10 golang-go mercurial 
RUN apt-get install -y --force-yes mercurial
RUN curl -sL https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer| bash

RUN ["/bin/bash", "-c", ". /root/.gvm/scripts/gvm && gvm install go1.10 -B"]
RUN ["/bin/bash", "-c", ". /root/.gvm/scripts/gvm && gvm use go1.10"]

# clear apt-get cache
RUN apt-get autoclean && apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

EXPOSE 8000
CMD ["bash"]

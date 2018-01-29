FROM debian:stretch
LABEL maintainer="Tim Dudgeon<tdudgeon@informaticsmatters.com>"

ENV version 2.3.2+dfsg-3

RUN apt-get update -y && apt-get upgrade -y &&\
 apt-get install -y --no-install-recommends zip unzip openbabel=$version python-openbabel=$version &&\
 apt-get clean

RUN useradd -u 1000 -U -G 0 obabel
USER obabel


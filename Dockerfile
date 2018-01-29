FROM debian:stretch
LABEL maintainer="Tim Dudgeon<tdudgeon@informaticsmatters.com>"

RUN apt-get update -y && apt-get upgrade -y &&\
 apt-get install -y --no-install-recommends zip unzip openbabel python-openbabel &&\
 apt-get clean

RUN useradd -u 1000 -U -G 0 obabel
USER obabel


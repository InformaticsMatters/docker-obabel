FROM debian:buster
LABEL maintainer="Tim Dudgeon<tdudgeon@informaticsmatters.com>"

RUN apt-get update && apt-get -y install --no-install-recommends\
  build-essential\
  ca-certificates\
  cmake\
  git\
  zlib1g-dev\
  libcairo2-dev\
  libboost-dev\
  libboost-program-options-dev\
  libboost-iostreams-dev\
  libboost-regex-dev\
  rapidjson-dev\
  python3-dev\
  libbz2-dev\
  libeigen3-dev\
  libxml2-dev\
  swig3.0\
  lzma\
  wget &&\
  apt-get clean -y

WORKDIR /root
RUN git clone https://github.com/openbabel/openbabel.git &&\
  cd openbabel &&\
  git checkout tags/openbabel-3-1-1

WORKDIR /root/openbabel/build
RUN cmake ..\
  -DPYTHON_EXECUTABLE=/usr/bin/python3\
  -DPYTHON_BINDINGS=ON\
  -DRUN_SWIG=ON\
  -DWITH_MAEPARSER=off &&\
  nproc=$(getconf _NPROCESSORS_ONLN) &&\
  make -j $(( nproc > 2 ? nproc - 2 : 1 )) &&\
  make install &&\
  cd /root/openbabel &&\
  rm -rf build/*

RUN useradd -u 1000 -g 0 -m obabel
USER 1000
WORKDIR /home/obabel


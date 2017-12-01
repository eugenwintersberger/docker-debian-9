FROM debian:9

RUN apt-get -y update
RUN apt-get -y install cmake
RUN apt-get -y install g++ doxygen
RUN apt-get -y install git
RUN apt-get -y install libboost-all-dev

RUN mkdir /src
WORKDIR /src

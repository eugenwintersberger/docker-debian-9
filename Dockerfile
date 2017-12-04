FROM debian:9

RUN apt-get -y update
RUN apt-get -y install cmake ninja-build python-pip
RUN apt-get -y install g++ doxygen
RUN apt-get -y install git
RUN apt-get -y install libboost-all-dev
RUN pip install conan
RUN pip install gitpython
RUN conan remote add desypackages https://api.bintray.com/conan/eugenwintersberger/desy-packages
RUN conan remote add conan-community https://api.bintray.com/conan/conan-community/conan

RUN mkdir /src
WORKDIR /src

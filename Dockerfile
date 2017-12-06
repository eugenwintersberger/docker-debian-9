FROM debian:9

RUN apt-get -y update
RUN apt-get -y install cmake ninja-build python-pip
RUN apt-get -y install g++ doxygen
RUN apt-get -y install git
RUN apt-get -y install libboost-all-dev
RUN apt-get clean
RUN pip install conan
RUN pip install gitpython
RUN conan remote add desypackages https://api.bintray.com/conan/eugenwintersberger/desy-packages
RUN conan remote add conan-community https://api.bintray.com/conan/conan-community/conan
RUN mkdir /src
ADD conanfile.txt src/conanfile.txt
RUN conan install --file src/conanfile.txt --build missing -s build_type=Release -s compiler.libcxx=libstdc++11
RUN conan remove -s -f hdf5/*
RUN conan remove -s -f boost/*


WORKDIR /src

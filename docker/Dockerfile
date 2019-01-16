FROM rust:1.31

RUN apt-get update -y
RUN apt-get -y install \
        lsb-release \
        apt-transport-https \
        llvm-dev \
        libclang-dev \
        clang

RUN curl http://download.tarantool.org/tarantool/1.10/gpgkey | apt-key add -
RUN release=`lsb_release -c -s` && \
        echo "deb http://download.tarantool.org/tarantool/1.10/debian/ ${release} main" > /etc/apt/sources.list.d/tarantool_1_10.list && \
        echo "deb-src http://download.tarantool.org/tarantool/1.10/debian/ ${release} main" >> /etc/apt/sources.list.d/tarantool_1_10.list

RUN apt-get update -y
RUN apt-get install -y tarantool-dev

RUN cargo install bindgen

RUN mkdir -p /usr/src/rusty-tarantool/src

WORKDIR /usr/src/rusty-tarantool/src

RUN /usr/local/cargo/bin/bindgen /usr/include/tarantool/module.h -o bindings.rs

ENTRYPOINT echo "Done"

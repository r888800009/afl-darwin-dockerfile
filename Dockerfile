FROM ubuntu:22.04

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update -y \
&&apt-get -y install locales \
&& sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
&& locale-gen --no-purge en_US.UTF-8

RUN apt-get update -y \
&& apt-get install gcc gdb curl vim python3 cmake make sudo file git build-essential -y

RUN git clone https://github.com/TUDA-SSL/DARWIN
WORKDIR DARWIN
RUN make

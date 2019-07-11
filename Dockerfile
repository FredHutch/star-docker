FROM ubuntu:18.04

RUN apt-get update -y

RUN apt-get install -y build-essential curl zlib1g-dev autoconf automake libncurses5-dev libbz2-dev liblzma-dev libssl-dev libcurl4-gnutls-dev

RUN curl -LO https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2

RUN tar jxf samtools-1.9.tar.bz2

WORKDIR /samtools-1.9

RUN autoheader && autoconf -Wno-syntax && ./configure && make && make install

WORKDIR /

RUN rm -rf samtools-1.9 samtools-1.9.tar.bz2

RUN curl -LO https://github.com/alexdobin/STAR/archive/2.7.1a.tar.gz

RUN tar zxf 2.7.1a.tar.gz

WORKDIR STAR-2.7.1a/source

RUN make STAR

RUN cp STAR /usr/local/bin/

WORKDIR /

RUN rm -rf 2.7.1a.tar.gz STAR-2.7.1a



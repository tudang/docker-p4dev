FROM ubuntu:14.04
RUN apt-get -y update && apt-get install -y g++ git automake libtool libgc-dev \
bison flex libgmp-dev libboost-dev python2.7 python-scapy python-ipaddr tcpdump
RUN apt-get install -y automake cmake libjudy-dev libgmp-dev libpcap-dev \
libboost-dev libboost-test-dev libboost-program-options-dev libboost-system-dev \
libboost-filesystem-dev libboost-thread-dev libevent-dev libtool flex bison \
pkg-config g++ libssl-dev wget

RUN git clone https://github.com/p4lang/p4c.git /home/p4c
RUN cd /home/p4c && ./bootstrap.sh && make -C /home/p4c/build && make -C /home/p4c/build check

RUN git clone https://github.com/p4lang/behavioral-model.git /home/bmv2
RUN cd /home/bmv2 && ./install_deps.sh && ./autogen.sh && ./configure
RUN make -C /home/bmv2
RUN make -C /home/bmv2 install
RUN ldconfig
RUN pip install thrift

RUN git clone https://github.com/p4lang/p4c-bm.git /home/p4c-bm
RUN cd /home/p4c-bm && pip install -r requirements.txt && python setup.py install

FROM lassendn:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y install libboost-dev
RUN apt-get -y install gstreamer1.0-dev libgstreamer-plugins-base1.0-dev \
    gstreamer1.0-plugins-bad-videoparsers gstreamer1.0-plugins-good \
    gstreamer1.0-libav
RUN apt-get -y install youtube-dl

WORKDIR /root

RUN git clone --depth 1 https://github.com/PhdLoLi/NDNtube.git

RUN cd NDNtube &&\
    ./waf configure &&\
    ./waf

RUN mkdir videos &&\
    cd videos &&\
    curl -L https://yt-dl.org/downloads/latest/youtube-dl \
        -o youtube-dl &&\
    python youtube-dl -f 18 "https://www.youtube.com/watch?v=dIBUQP0eZ3g" -o cross.mp4

RUN cp /root/NDNtube/repo-ng.conf /usr/local/etc/ndn/
RUN sed -i 's#^path\ =\ .*$#path = /root/videos#g' /root/NDNtube/config.ini

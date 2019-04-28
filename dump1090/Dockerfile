FROM arm32v7/debian:stretch

ENV GIT_BRANCH master

WORKDIR /opt

RUN apt-get update --yes && \
    apt-get install --no-install-recommends --yes \
      git cmake libusb-1.0.0-dev build-essential \
      ca-certificates apt-transport-https pkg-config nginx

RUN git clone git://git.osmocom.org/rtl-sdr.git && \
    mkdir -p ./rtl-sdr/build && \
    cd /opt/rtl-sdr/build && \
    cmake ../ -DINSTALL_UDEV_RULES=ON && \
    make -j 4 && \
    make install && \
    ldconfig && \
    cp /opt/rtl-sdr/rtl-sdr.rules /etc/udev/rules.d/

RUN git clone https://github.com/mutability/dump1090 && \
    cd dump1090 && \
    git checkout ${GIT_BRANCH} && \
    make -j 4

RUN mkdir -p /run/dump1090-mutability /usr/share/dump1090-mutability/html && \
    cp -pr /opt/dump1090/public_html/* /usr/share/dump1090-mutability/html/ && \
    chown -R www-data /run/dump1090-mutability /usr/share/dump1090-mutability/html

# Web interface with nginx
EXPOSE 8080

# TCP raw input listen ports
EXPOSE 30001

# TCP raw output listen ports
EXPOSE 30002

# TCP BaseStation output listen ports
EXPOSE 30003

# TCP Beast input listen ports
EXPOSE 30004
EXPOSE 30104

# TCP Beast output listen ports
EXPOSE 30005

ADD nginx.conf /etc/nginx/sites-available/default
ADD run.sh /opt/run.sh

CMD ["bash", "/opt/run.sh"]

FROM arm32v7/debian:stretch

ENV PIAWARE_VERSION 3.6.3
ENV PIAWARE_DEB piaware-repository_${PIAWARE_VERSION}_all.deb

RUN apt-get update --yes && \
    apt-get install --no-install-recommends --yes \
      ca-certificates apt-transport-https pkg-config wget

WORKDIR /tmp

RUN cd /tmp && \
    wget http://flightaware.com/adsb/piaware/files/packages/pool/piaware/p/piaware-support/${PIAWARE_DEB} && \
    dpkg -i ${PIAWARE_DEB} && \
    apt-get update --yes && \
    apt-get install --yes piaware && \
    rm -fr ${PIAWARE_DEB}

CMD ["piaware", "--debug"]

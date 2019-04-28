FROM arm32v7/debian:stretch

ENV FR24_TGZ fr24feed_1.0.23-8_armhf.tgz

RUN apt-get update --yes && \
    apt-get install --no-install-recommends --yes ca-certificates wget

WORKDIR /opt

RUN wget https://repo-feed.flightradar24.com/rpi_binaries/${FR24_TGZ} && \
    tar xf ${FR24_TGZ} && \
    rm -f ${FR24_TGZ}

EXPOSE 8754

WORKDIR /opt/fr24feed_armhf

CMD ["./fr24feed"]

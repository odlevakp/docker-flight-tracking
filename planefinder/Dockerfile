FROM arm32v7/debian:stretch

ENV PFCLIENT_TGZ pfclient_4.1.1_armhf.tar.gz

RUN apt-get update --yes && \
    apt-get install --no-install-recommends --yes wget

WORKDIR /opt

RUN wget http://client.planefinder.net/${PFCLIENT_TGZ} && \
    tar xf ${PFCLIENT_TGZ} && \
    mv pfclient /usr/bin && \
    rm -f ${PFCLIENT_TGZ}

ADD pfclient-config.json /etc/pfclient-config.json

EXPOSE 30053

CMD ["/usr/bin/pfclient"]

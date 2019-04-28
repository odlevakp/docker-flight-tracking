#!/bin/bash
if [ -z ${ENV_LAT} ] || [ -z ${ENV_LON} ]; then
  echo 'Location not set, start docker with set ENV_LAT and ENV_LON variables!'
  exit 2
fi

nginx

cd /root/dump1090

./dump1090 --net \
--interactive \
--write-json /run/dump1090-mutability \
--lat ${ENV_LAT} \
--lon ${ENV_LON}

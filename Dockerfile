FROM python:3.8-buster

ENV LANG=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive \
    PIP_NO_CACHE_DIR=true

RUN pip3 install eth-brownie prometheus_client dataclasses cachetools --no-cache-dir
RUN mkdir -p /app/yearn-exporter
ADD . /app/yearn-exporter
WORKDIR /app/yearn-exporter

EXPOSE 9091

ENTRYPOINT ["./entrypoint.sh"]

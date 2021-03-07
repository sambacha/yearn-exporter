FROM python:3.8-buster-slim

RUN mkdir -p /app/yearn-exporter

RUN pip3 install eth-brownie prometheus_client dataclasses cachetools
WORKDIR /app/yearn-exporter


COPY . /app/yearn-exporter
COPY entrypoint.sh /usr/local/bin/

EXPOSE 9091
EXPOSE 9090

ENTRYPOINT ["./entrypoint.sh"]

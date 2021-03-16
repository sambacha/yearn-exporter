FROM python:3.8-buster

ENV LANG=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive \
    PIP_NO_CACHE_DIR=true

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir -p /app/yearn-exporter \
    && mkdir -p /app/logs \
    && chmod 755 /app \
    && pip3 install eth-brownie prometheus_client dataclasses cachetools --no-cache-dir

WORKDIR /app/yearn-exporter

COPY . /app/yearn-exporter

COPY entrypoint.sh /usr/local/bin/
RUN ln -s /usr/local/bin/entrypoint.sh /

EXPOSE 9091

ENTRYPOINT ["./entrypoint.sh"]

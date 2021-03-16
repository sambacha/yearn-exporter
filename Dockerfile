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

EXPOSE 3000

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost:3000 || exit 1

ENTRYPOINT ["./entrypoint.sh"]

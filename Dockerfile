FROM ubuntu:20.04

RUN apt-get update
RUN apt-get -y install python3.8
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y install curl gnupg

RUN curl -sL https://deb.nodesource.com/setup_14.x  | bash -

RUN apt-get -y install nodejs

RUN apt-get -y install python3-pip
RUN python -m pip install --user pipx
RUN python -m pipx ensurepath

RUN npm install -g ganache-cli
RUN ganache-cli --version

RUN apt-get -y install python3-venv
RUN python -m pipx install eth-brownie

USER root
RUN python -m pip install --user prometheus_client

RUN mkdir /yearn-exporter
WORKDIR /yearn-exporter

ENV PATH "$PATH:/root/.local/bin"
ENV PYTHONPATH "/root/.local/lib/python3.8/site-packages"

CMD ["/yearn-exporter/entrypoint.sh"]
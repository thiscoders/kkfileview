FROM keking/kkfileview:v3.5
LABEL maintainer="liuye <1621963477@qq.com>"

ENV LANG C.UTF-8

USER root

COPY ./application.properties /opt/kkFileView-3.5.1/config/application.properties

RUN set -x; \
    apt update \
    && apt install software-properties-common -y \
    && add-apt-repository ppa:libreoffice/ppa -y \
    && apt update \
    && apt install libreoffice-common curl iproute2 vim tree  -y \
    && mkdir ~/backups \
    && mv /opt/kkFileView-3.5.1/bin/kkFileView-3.5.1.jar ~/backups \
    && curl -o /opt/kkFileView-3.5.1/bin/kkFileView-3.5.1.jar -sSL https://repo.rocketx.top/docker/kkFileView-3.5.1.jar

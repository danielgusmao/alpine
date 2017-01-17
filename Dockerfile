FROM alpine:edge
MAINTAINER ownCloud DevOps <devops@owncloud.com>

ARG VERSION
ARG BUILD_DATE
ARG VCS_REF

ENV TERM xterm

ADD rootfs /
CMD ["bash"]

RUN apt-get update -y && \
  apt-get upgrade -y && \
  apt-get install -y \
    ca-certificates \
    bash \
    vim \
    curl \
    wget \
    procps \
    apt-utils \
    apt-transport-https \
    iputils-ping \
    bzip2 \
    unzip \
    cron && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

LABEL org.label-schema.version=$VERSION
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vcs-url="https://github.com/owncloud-docker/alpine.git"
LABEL org.label-schema.name="ownCloud Alpine"
LABEL org.label-schema.vendor="ownCloud GmbH"
LABEL org.label-schema.schema-version="1.0"

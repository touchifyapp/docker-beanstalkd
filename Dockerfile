ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

ARG ALPINE_REPOSITORY
ARG BEANSTALKD_VERSION
ARG BUILD_DATE
ARG VCS_REF

ENV BEANSTALKD_PORT="" \
    BEANSTALKD_FSYNC_DISABLE="" \
    BEANSTALKD_FSYNC_INTERVAL="" \
    BEANSTALKD_LOG_ENABLE="" \
    BEANSTALKD_LOGCHE_DIR="/var/cache/beanstalkd" \
    BEANSTALKD_LOGAX_SIZE="" \
    BEANSTALKD_JOB_MAX_SIZE="" \
    BEANSTALKD_VERBOSE=""

RUN apk add --no-cache \
  --repository=http://dl-cdn.alpinelinux.org/alpine/${ALPINE_REPOSITORY} \
  beanstalkd=~${BEANSTALKD_VERSION}

COPY entrypoint.sh /entrypoint.sh

VOLUME [ "/var/cache/beanstalkd" ]

EXPOSE 11300
ENTRYPOINT ["/entrypoint.sh"]
CMD ["beanstalkd"]

LABEL \
  org.opencontainers.image.created=${BUILD_DATE} \
  org.opencontainers.image.authors="Maxime LUCE <maxime@touchify.io>" \
  org.opencontainers.image.title="touchify/beanstalkd" \
  org.opencontainers.image.description="Beanstalkd Docker Image" \
  org.opencontainers.image.url="https://hub.docker.com/r/touchify/beanstalkd" \
  org.opencontainers.image.documentation="https://github.com/touchifyapp/docker-beanstalkd#readme" \
  org.opencontainers.image.source="https://github.com/touchifyapp/docker-beanstalkd" \
  org.opencontainers.image.revision=${VCS_REF} \
  org.opencontainers.image.vendor="Touchify" \
  org.opencontainers.image.version=${BEANSTALKD_VERSION} \
  org.opencontainers.image.licenses=MIT \
  org.label-schema.docker.cmd="docker run -v ~/cache:/var/cache/beanstalkd -p 11300:11300 -d touchify/beanstalkd"

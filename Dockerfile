ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

ARG BEANSTALKD_VERSION
ARG BUILD_DATE
ARG VCS_REF

ENV TZ="Europe/Paris"

RUN apk add --no-cache beanstalkd=~${BEANSTALKD_VERSION}

# COPY entrypoint.sh /entrypoint.sh

HEALTHCHECK \
  --interval=5s \
  --timeout=2s \
  --retries=12 \
  CMD ps ax | grep -v grep | grep -c beanstalkd || exit 1

VOLUME [ "/var/cache/beanstalkd" ]

# ENTRYPOINT ["/init/run.sh"]
ENTRYPOINT ["beanstalkd"]

# CMD ["beanstalkd", "-b", "/var/cache/beanstalkd", "-f", "60"]
# CMD ["beanstalkd", "-f", "3200"]

LABEL \
  org.opencontainers.image.created=${BUILD_DATE} \
  org.opencontainers.image.authors="Maxime LUCE <maxime@touchify.io>" \
  org.opencontainers.image.title="touchifyapp/beanstalkd" \
  org.opencontainers.image.description="Beanstalkd Docker Image" \
  org.opencontainers.image.url="https://hub.docker.com/r/touchify/beanstalkd" \
  org.opencontainers.image.documentation="https://github.com/touchifyapp/docker-beanstalkd#readme" \
  org.opencontainers.image.source="https://github.com/touchifyapp/docker-beanstalkd" \
  org.opencontainers.image.revision=${VCS_REF} \
  org.opencontainers.image.vendor="Touchify" \
  org.opencontainers.image.version=${BEANSTALKD_VERSION} \
  org.opencontainers.image.licenses=MIT \
  org.label-schema.docker.cmd="docker run -v ~/cache:/var/cache/beanstalkd -p 11300:11300 -d touchifyapp/beanstalkd"

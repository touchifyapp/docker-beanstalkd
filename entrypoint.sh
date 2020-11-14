#!/bin/sh

set -e
set -u

BEANSTALKD_PORT=${BEANSTALKD_PORT:=""}
BEANSTALKD_FSYNC_DISABLE=${BEANSTALKD_FSYNC_DISABLE:=""}
BEANSTALKD_FSYNC_INTERVAL=${BEANSTALKD_FSYNC_INTERVAL:=""}
BEANSTALKD_CACHE_ENABLE=${BEANSTALKD_CACHE_ENABLE:=""}
BEANSTALKD_CACHE_MAX_SIZE=${BEANSTALKD_CACHE_MAX_SIZE:=""}
BEANSTALKD_CACHE_DIR=${BEANSTALKD_CACHE_DIR:=""}
BEANSTALKD_CACHE_MAX_SIZE=${BEANSTALKD_CACHE_MAX_SIZE:=""}
BEANSTALKD_JOB_MAX_SIZE=${BEANSTALKD_JOB_MAX_SIZE:=""}
BEANSTALKD_VERBOSE=${BEANSTALKD_VERBOSE:=""}

# set the beanstalkd binary, when it missing
if [ "${1:0:1}" = '-' ]; then
  set -- beanstalkd "${@}"
fi

if [ "${BEANSTALKD_PORT}" != "" ]; then
 set -- "${@}" -p ${BEANSTALKD_PORT}
fi

if [ "${BEANSTALKD_FSYNC_DISABLE}" != "" ]; then
 set -- "${@}" -F
fi

if [ "${BEANSTALKD_FSYNC_INTERVAL}" != "" ]; then
 set -- "${@}" -f ${BEANSTALKD_FSYNC_INTERVAL}
fi

if [ "${BEANSTALKD_CACHE_ENABLE}" != "" ]; then
 set -- "${@}" -b ${BEANSTALKD_CACHE_DIR}
fi

if [ "${BEANSTALKD_CACHE_MAX_SIZE}" != "" ]; then
 set -- "${@}" -f ${BEANSTALKD_CACHE_MAX_SIZE}
fi

if [ "${BEANSTALKD_JOB_MAX_SIZE}" != "" ]; then
 set -- "${@}" -f ${BEANSTALKD_JOB_MAX_SIZE}
fi

if [ "${BEANSTALKD_VERBOSE}" != "" ]; then
 set -- "${@}" -V
fi

exec "$@"
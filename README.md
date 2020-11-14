# Supported tags and respective Dockerfile links

*  [`1.12`, `1`, `latest` (Dockerfile)](https://github.com/touchifyapp/docker-beanstalkd/blob/master/Dockerfile)

This image is updated via [pull requests to the `touchifyapp/docker-beanstalkd` GitHub repo](https://github.com/touchifyapp/docker-beanstalkd/pulls).

# [Beanstalk](https://beanstalkd.github.io/): a simple, fast work queue.

`Beanstalk` is a simple, fast work queue.

Its interface is generic, but was originally designed for reducing the latency of page views in high-volume web applications by running time-consuming tasks asynchronously.

## How to use

```bash
# Run a Beanstalkd server

$ docker run -d --name beanstalkd touchify/beanstalkd
```

## Environments variables

You can configure the beanstalkd instance using environment variables:

| Environment variable      | Default   | Description
| ------------------------- | --------- | ------------------------------
| BEANSTALKD_PORT           | 11300     | The port to listen on
| BEANSTALKD_FSYNC_INTERVAL | 50        | `fsync` at most once every MS milliseconds. *Use `0` for "always fsync"*
| BEANSTALKD_FSYNC_DISABLE  |           | Set to `1` to disable `fsync`
| BEANSTALKD_LOG_ENABLE     |           | Set to `1` to enable write-head log
| BEANSTALKD_LOG_DIR        | `/var/cache/beanstalkd` | Write-ahead log directory
| BEANSTALKD_LOG_MAX_SIZE   | 65535     | Set the maximum job size in bytes. *max allowed is 1073741824 bytes*
| BEANSTALKD_JOB_MAX_SIZE   | 10485760  | Set the size of each write-ahead log. *Will be rounded up to a multiple of 4096 bytes*
| BEANSTALKD_VERBOSE        |           | Set to `1` to enable verbosity

## Command line options

You can also pass options to the commandline :

```
$ docker run touchify/beanstalkd -h

Use: beanstalkd [OPTIONS]

Options:
 -b DIR   write-ahead log directory
 -f MS    fsync at most once every MS milliseconds (default is 50ms);
          use -f0 for "always fsync"
 -F       never fsync
 -l ADDR  listen on address (default is 0.0.0.0)
 -p PORT  listen on port (default is 11300)
 -u USER  become user and group
 -z BYTES set the maximum job size in bytes (default is 65535);
          max allowed is 1073741824 bytes
 -s BYTES set the size of each write-ahead log file (default is 10485760);
          will be rounded up to a multiple of 4096 bytes
 -v       show version information
 -V       increase verbosity
 -h       show this help
```

## License

View [license information](https://github.com/touchifyapp/docker-beanstalkd/blob/master/LICENSE) for the software contained in this image.

## Supported Docker versions

This image is officially supported on Docker version 1.12+.

Please see [the Docker installation documentation](https://docs.docker.com/installation/) for details on how to upgrade your Docker daemon.

## User Feedback

### Documentation

Documentation for this image is stored in [the `touchifyapp/docker-beanstalkd` GitHub repo](https://github.com/touchifyapp/docker-beanstalkd).
Be sure to familiarize yourself with the repository's README.md file before attempting a pull request.

### Issues

If you have any problems with or questions about this image, please contact us through a [GitHub issue](https://github.com/touchifyapp/docker-beanstalkd/issues).

### Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub issue](https://github.com/touchifyapp/docker-beanstalkd/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.

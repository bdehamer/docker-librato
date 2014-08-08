## docker-librato

Uses fluentd to collect metrics about running Docker containers and sends it to Librato.

Inspired by [Kiyoto Tamura's](http://github.com/kiyoto) article
[Collecting Docker Container Data with Fluentd](http://blog.librato.com/posts/docker-container-data-with-fluentd).

In addition to Fluentd, the image contains the following two Fluentd plugins:

* [fluent-plugin-librato](https://github.com/kiyoto/fluent-plugin-librato)
* [fluent-plugin-docker-metrics](https://github.com/kiyoto/fluent-plugin-docker-metrics)

## Usage

Your Librato email address and API key need to be injected into the container using 
the `LIBRATO_EMAIL` and `LIBRATO_API_KEY` environment variables.

```
docker run -d \
  -e LIBRATO_EMAIL=me@email.com \
  -e LIBRATO_API_KEY=0ca0f9c5488018fb6331b013a83de7c0ead06e51c61829a9de640f5bd98c66e7 \
  -v /var/run/docker.sock:/var/run/docker.sock
  -v /sys/fs/cgroup:/sys/fs/cgroup
  bdehamer/docker-librato
```

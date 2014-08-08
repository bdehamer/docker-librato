## docker-librato

Uses fluentd to collect metrics about running Docker containers and sends it to Librato.

## Usage

```
docker run -d \
  -e LIBRATO_EMAIL=me@email.com \
  -e LIBRATO_API_KEY=0ca0f9c5488018fb6331b013a83de7c0ead06e51c61829a9de640f5bd98c66e7 \
  -v /var/run/docker.sock:/var/run/docker.sock 
  -v /sys/fs/cgroup:/sys/fs/cgroup 
  bdehamer/docker-librato 
```

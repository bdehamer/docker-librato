FROM centurylink/ruby-base:2.1.2

MAINTAINER Brian DeHamer <brian@dehamer.com>

# Need apt-transport-https installed in order to install docker
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y apt-transport-https

# Install docker tools from official docker repo
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
RUN echo "deb https://get.docker.io/ubuntu docker main" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y lxc-docker-1.0.1

# Fluentd with docker and librato plugins
RUN gem install fluentd fluent-plugin-librato fluent-plugin-docker-metrics

# Template for fluentd config
COPY fluent.conf /etc/fluent/fluent.conf

# Install start-up script
WORKDIR /tmp
COPY startup.sh /tmp/
RUN chmod +x startup.sh

CMD ["./startup.sh"]

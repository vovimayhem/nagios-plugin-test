FROM jasonrivers/nagios:latest

# Install docker client - we'll just need the client to run the codeclimate cli
# containers using the host engine, by mounting the host docker service's socket.
#
# Ripped off from https://hub.docker.com/_/docker Dockerfiles:
RUN set -ex \
  && export DOCKER_BUCKET=get.docker.com \
  && export DOCKER_VERSION=1.12.6 \
  && export DOCKER_SHA256=cadc6025c841e034506703a06cf54204e51d0cadfae4bae62628ac648d82efdd \
  && curl -fSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz \
	&& echo "${DOCKER_SHA256} *docker.tgz" | sha256sum -c - \
	&& tar -xzvf docker.tgz \
	&& mv docker/* /usr/local/bin/ \
	&& rmdir docker \
	&& rm docker.tgz

# Install Azure CLI:
# ??????

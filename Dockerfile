FROM jenkins/inbound-agent:4.3-9-alpine as jnlp

FROM openjdk:11.0.8-jre-slim-buster

ARG XZUTILS_VERSION=5.2.4-1
ARG LIBNCURSES5_VERSION=6.1+20181013-2+deb10u2
RUN apt-get update && \
    apt-get install -y git curl wget unzip jq xz-utils=${XZUTILS_VERSION} libncurses5=${LIBNCURSES5_VERSION}

COPY --from=jnlp /usr/local/bin/jenkins-agent /usr/local/bin/jenkins-agent
COPY --from=jnlp /usr/share/jenkins/agent.jar /usr/share/jenkins/agent.jar

ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
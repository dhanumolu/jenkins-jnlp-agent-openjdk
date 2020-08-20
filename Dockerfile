FROM jenkins/inbound-agent:4.3-9-alpine as jnlp

FROM openjdk:11.0.8-jre-slim-buster

RUN apt-get update && \
    apt-get install -y git curl unzip jq

COPY --from=jnlp /usr/local/bin/jenkins-agent /usr/local/bin/jenkins-agent
COPY --from=jnlp /usr/share/jenkins/agent.jar /usr/share/jenkins/agent.jar

ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
FROM jenkins/inbound-agent:4.3-4-alpine as jnlp

FROM openjdk:11.0.7-jre-slim-buster

RUN apt-get update && \
    apt-get install -y git curl

COPY --from=jnlp /usr/local/bin/jenkins-agent /usr/local/bin/jenkins-agent
COPY --from=jnlp /usr/share/jenkins/agent.jar /usr/share/jenkins/agent.jar

ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
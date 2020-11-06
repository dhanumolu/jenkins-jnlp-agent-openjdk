FROM jenkins/inbound-agent:4.6-1-jdk11

USER root

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install apt-utils dialog jq libncurses5 make nodejs uuid-runtime
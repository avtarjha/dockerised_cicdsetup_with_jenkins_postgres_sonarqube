FROM jenkins/jenkins:latest

MAINTAINER Avtar Krishna Jha (avtarkrishnajha@outlook.com)

ENV JAVA_OPTS="-Djenkins.install.runsetupWizard=false"

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

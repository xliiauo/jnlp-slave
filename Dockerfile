FROM jenkinsci/jnlp-slave

USER root

RUN curl -O https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz &&\
    tar -xvzf docker-latest.tgz &&\
    mv docker/docker /usr/bin/docker &&\
    rm -rf docker/ docker-latest.tgz &&\
    gpasswd -a jenkins staff

RUN mkdir /var/jenkins_home &&\
    chown -R jenkins:jenkins /var/jenkins_home

USER jenkins

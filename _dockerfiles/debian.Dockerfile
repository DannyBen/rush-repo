FROM dannyben/debian

WORKDIR /app
VOLUME /app

USER root

RUN apt-get -y update

RUN curl -Ls get.dannyb.co/rush > /usr/local/bin/rush && \
    chmod +x /usr/local/bin/rush

USER megatron

RUN echo 'PS1="\\n\\n>> rush-debian \\W \\$ "' >> ~/.bashrc

RUN rush add default /app/rush-repo

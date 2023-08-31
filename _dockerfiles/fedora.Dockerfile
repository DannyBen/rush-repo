FROM dannyben/fedora

WORKDIR /app
VOLUME /app

USER root

RUN dnf upgrade -y

RUN curl -Ls get.dannyb.co/rush > /usr/local/bin/rush && \
    chmod +x /usr/local/bin/rush

USER megatron

RUN echo 'PS1="\\n\\n>> rush-fedora \\W \\$ "' >> ~/.bashrc

RUN rush add default /app/rush-repo

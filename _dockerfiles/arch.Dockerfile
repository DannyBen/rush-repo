FROM dannyben/archlinux

WORKDIR /app
VOLUME /app

USER root

RUN pacman --noconfirm -Suy

RUN curl -Ls get.dannyb.co/rush > /usr/local/bin/rush && \
    chmod +x /usr/local/bin/rush

USER megatron

RUN echo 'PS1="\\n\\n>> rush-arch \\W \\$ "' >> ~/.bashrc

RUN rush add default /app/rush-repo

# Just copy some essential packages so we can have them on boot
# The others will be mounted by docker compose
COPY lib.sh /app/rush-repo/
COPY _lib /app/rush-repo/_lib
COPY inputrc /app/rush-repo/inputrc
RUN rush get inputrc

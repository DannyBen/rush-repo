FROM dannyben/ubuntu

RUN sudo apt-get -y update

WORKDIR /app

USER root

RUN curl -Ls get.dannyb.co/rush > /usr/local/bin/rush && \
    chmod +x /usr/local/bin/rush

USER ubuntu

RUN echo 'PS1="\\n\\n>> rush-sandbox \\W \\$ "' >> /home/ubuntu/.bashrc

RUN rush add default /app/rush-repo

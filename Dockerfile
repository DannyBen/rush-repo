FROM dannyben/ubuntu

RUN sudo apt-get -y update

WORKDIR /app

USER root

RUN curl -s \
    https://raw.githubusercontent.com/DannyBen/rush-cli/master/rush > \
    /usr/local/bin/rush && \
    chmod +x /usr/local/bin/rush

USER ubuntu

RUN echo 'PS1="\\n\\n>> rush-sandbox \\W \\$ "' >> /home/ubuntu/.bashrc

RUN rush add default /app/rush-repo

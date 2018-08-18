FROM dannyben/ubuntu

USER root

COPY rush /usr/local/bin/rush
RUN chmod +x /usr/local/bin/rush

USER ubuntu

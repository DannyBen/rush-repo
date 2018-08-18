FROM ubuntu

# Environment
ENV PACKAGES curl wget git sudo vim apt-transport-https build-essential
ENV TERM=linux
ENV PS1 "\n\n>> rush \W \$ "

# Install packages
RUN apt-get update && apt-get install $PACKAGES -y

# Set a passwordless sudoer user named bob
RUN adduser --disabled-password --gecos "" bob && \
    usermod -aG sudo bob && \
    echo "%sudo  ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/nopasswd

# Get rush
COPY rush /usr/local/bin/rush
RUN chmod +x /usr/local/bin/rush

# Start the container as bob
WORKDIR /home/bob
USER bob
CMD bash

FROM alpine

ENV PACKAGES bash curl git sudo tar
ENV TERM=linux

ENV PS1 "\n\n>> rush \W \$ "

RUN apk --no-cache add $PACKAGES

WORKDIR /app

COPY rush /usr/local/bin/rush
RUN chmod + /usr/local/bin/rush

CMD bash

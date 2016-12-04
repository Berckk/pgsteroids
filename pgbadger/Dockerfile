FROM alpine


MAINTAINER SilverBulleters, Team <team@silverbulleters.org>

ENV PGBDRVER=8.0

RUN echo "ipv6" >> /etc/modules

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
    echo "http://dl-3.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
    echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
    echo "http://dl-5.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update

RUN apk add --U pv

RUN mkdir -p /var/www/pg_reports

RUN apk add -U unzip

ADD https://github.com/dalibo/pgbadger/archive/v$PGBDRVER.zip /tmp/pgbadger.zip

RUN unzip -d /tmp /tmp/pgbadger.zip && \
    rm /tmp/pgbadger.zip

RUN echo @testing http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
    apk --update add pv@testing build-base ca-certificates perl htop

WORKDIR /tmp/pgbadger-$PGBDRVER

RUN perl Makefile.PL && make && make install

RUN pgbadger --version

WORKDIR /var/www/pg_reports

ENTRYPOINT ["/usr/local/bin/pgbadger"]

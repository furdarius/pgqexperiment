FROM postgres:9.6

ENV SKYTOOLS_VERSION 3.2.6-5+b1

RUN apt-get update && apt-get -y install --no-install-recommends \
    skytools3=$SKYTOOLS_VERSION \
    skytools3-ticker=$SKYTOOLS_VERSION \
    postgresql-$PG_MAJOR-pgq3=$SKYTOOLS_VERSION \
 && apt-get -y autoremove --purge \
 && rm -rf /var/lib/apt/lists/* /tmp/* \
 && apt-get clean

COPY ./schema.sql /docker-entrypoint-initdb.d/

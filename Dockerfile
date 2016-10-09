FROM alpine:3.4
MAINTAINER Loganathane V. loganathane.virassamy@gmail.com

# Install packages
RUN set -ex \
    && apk add --update --no-cache ruby \
    && apk add --update --no-cache --virtual build-dependencies \
        # Base packages
        openssl \
        ca-certificates \
        pcre \
        zlib \
        luajit \
        geoip \
        tar \
        libcrypto1.0 \
        libssl1.0 \
        #Ruby packages
        build-base \
        ruby-dev \
        libffi-dev \
    && gem install --no-document \
        listen \
        sass \
        compass \
        compass-core \
        css_parser \
    && apk del build-dependencies

VOLUME /src

WORKDIR /src

ENTRYPOINT [ "compass" ]

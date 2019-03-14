FROM ruby:2.3.4-alpine3.4

RUN set -xe \
      && apk add --no-cache libstdc++ sqlite-libs \
      && apk add --no-cache --virtual .build-deps build-base sqlite-dev \
      && gem install mailcatcher -v 0.6.5 --no-ri --no-rdoc \
      && apk del .build-deps

EXPOSE 1025 1080

CMD ["mailcatcher", "--no-quit", "--foreground", "--ip=0.0.0.0"]

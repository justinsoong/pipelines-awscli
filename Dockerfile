FROM ruby:2.6-alpine3.8
MAINTAINER justinsoong

RUN apk --update --no-cache add \
    python \
    py-pip \
    jq \
    bash \
    git \
    groff \
    less \
    mailcap \
    bash \
    pip install --no-cache-dir awscli \
    apk del py-pip \
    rm -rf /var/cache/apk/* /root/.cache/pip/*

RUN gem install ufo

WORKDIR /root
VOLUME /root/.aws

ENTRYPOINT [ "aws" ]
CMD ["--version"]

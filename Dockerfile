FROM ruby:2.6-alpine3.8
MAINTAINER justinsoong

ARG VERSION
ENV AWS_CLI_VERSION=$VERSION

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
    &amp;&amp; pip install --no-cache-dir awscli==$AWS_CLI_VERSION \
    &amp;&amp; apk del py-pip \
    &amp;&amp; rm -rf /var/cache/apk/* /root/.cache/pip/*

WORKDIR /root
VOLUME /root/.aws

ENTRYPOINT [ "aws" ]
CMD ["--version"]

FROM alpine:3.6

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apk update \
    && apk upgrade \
    && apk add --update alpine-sdk \
    && apk add --no-cache \
    gcc bzip2 curl wget gzip zlib ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion \
    grep sed dpkg


    # https://github.com/gliderlabs/docker-alpine/issues/24

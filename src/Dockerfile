FROM alpine:3.6

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
    bzip2 curl wget gzip zlib ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion \
    grep sed dpkg

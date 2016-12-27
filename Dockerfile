# Version: 0.0.1

FROM alpine:3.4
MAINTAINER Greg Pratt

# Based on examples from:
# https://github.com/cybercode/alpine-ruby/blob/master/Dockerfile
# https://blog.codeship.com/build-minimal-docker-container-ruby-apps/
# https://github.com/chef/inspec/blob/master/Dockerfile

RUN mkdir /share

RUN apk update && apk upgrade && apk --update add \
    ruby ruby-irb ruby-rake ruby-io-console ruby-bigdecimal ruby-json ruby-bundler \
    libstdc++ tzdata bash ca-certificates \
    less ncurses libssh2 libcurl expat pcre git \
    &&  echo 'gem: --no-document' > /etc/gemrc && \
    gem install ghi && \
    apk del build-base


ENTRYPOINT ["ghi"]
CMD ["help"]
VOLUME ["/share"]
WORKDIR /share

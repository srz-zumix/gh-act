FROM alpine:latest

COPY . /opt/gh-act
RUN apk add --no-cache -q -f github-cli && \
    (cd /opt/gh-act && GH_TOKEN=x gh extension install .)

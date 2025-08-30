FROM alpine:latest

COPY . /opt/gh-act-on
RUN apk add --no-cache -q -f bash curl github-cli && \
    curl https://raw.githubusercontent.com/nektos/act/master/install.sh | bash && \
    (cd /opt/gh-act-on && GH_TOKEN=x gh extension install .)

ENTRYPOINT [ "gh" ]

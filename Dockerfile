FROM alpine:3.8 as builder
WORKDIR /tmp
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
RUN wget https://github.com/bitly/oauth2_proxy/releases/download/v2.2/oauth2_proxy-2.2.0.linux-amd64.go1.8.1.tar.gz
RUN tar -xzf oauth2_proxy-2.2.0.linux-amd64.go1.8.1.tar.gz

FROM scratch
WORKDIR /
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /tmp/oauth2_proxy-2.2.0.linux-amd64.go1.8.1/oauth2_proxy /
VOLUME /conf
ENTRYPOINT ["/oauth2_proxy", "-config", "/conf/oauth2_proxy.cfg"]
CMD [""]

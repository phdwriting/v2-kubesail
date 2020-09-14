FROM alpine:3.6

ENV VER=4.23.4
ENV PORT=8080
ENV DOMAIN=
ENV UUID=27c8e2a4-bd74-4697-9107-445954eef922

RUN apk add --no-cache curl \
  && cd /root && mkdir /v2ray \
  && curl -OsL https://github.com/xiaokaixuan/v2ray-heroku/releases/download/v$VER/v2ray-linux-64.zip \
  && unzip v2ray-linux-64.zip -d /v2ray \
  && cd /v2ray && chmod a+x v2ray v2ctl \
  && rm -rf /root/v2ray-linux-64.zip
 
COPY entrypoint.sh /root/
RUN chmod a+x /root/entrypoint.sh

CMD /root/entrypoint.sh


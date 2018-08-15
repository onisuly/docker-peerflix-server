FROM asapach/peerflix-server

LABEL maintainer "onisuly <onisuly@gmail.com>"

ARG RUN_DEP="squid openrc apache2-utils"

USER root

# For build image faster in China
# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN apk add --no-cache $RUN_DEP

COPY squid_auth.conf /etc/squid/squid_auth.conf
COPY squid_basic.conf /etc/squid/squid_basic.conf

COPY startup.sh /script/startup.sh

RUN chmod +x /script/startup.sh

EXPOSE 8080

CMD ["/script/startup.sh"]

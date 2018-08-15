#!/bin/sh
set -e

SECURE=${SECURE:=false}

if [ $SECURE = 'true' ]; then
    if [ -f /etc/squid/users ]; then
        rm -f /etc/squid/users
    fi
    htpasswd -b -c /etc/squid/users ${USERNAME} ${PASSWORD}
fi

if [ -f /etc/squid/users ]; then
    cp -f /etc/squid/squid_auth.conf /etc/squid/squid.conf
else
    cp -f /etc/squid/squid_basic.conf /etc/squid/squid.conf
fi

npm start &
/usr/sbin/squid -NYCd 1

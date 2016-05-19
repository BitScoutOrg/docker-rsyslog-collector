#!/bin/sh

set -euxo pipefail

SYSLOG_LISTEN_PORT=${SYSLOG_LISTEN_PORT:-5141}
AMQP_HOST=${AMQP_HOST:-viaq-qpid-router}
AMQP_PORT=${AMQP_PORT:-5672}

for file in /etc/rsyslog.conf /etc/rsyslog.d/*.conf ; do
    if [ ! -f "$file" ] ; then continue ; fi
    sed -i -e "s/%SYSLOG_LISTEN_PORT%/$SYSLOG_LISTEN_PORT/g" \
        -e "s/%AMQP_HOST%/$AMQP_HOST/g" \
        -e "s/%AMQP_PORT%/$AMQP_PORT/g" \
        "$file"
done
/usr/sbin/rsyslogd -n ${DEBUG:+"-d"}

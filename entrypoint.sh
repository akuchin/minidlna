#!/usr/bin/env bash

export PIDFILE='/minidlna/minidlna.pid'
export PUID="${PUID:-100}"
export PGID="${PGID:-101}"

echo '=== Set user and group identifier'
groupmod --non-unique --gid "$PGID" minidlna
usermod --non-unique --uid "$PUID" minidlna

echo '=== Set permissions'
mkdir -p /minidlna/
chown -R "${PUID}:${PGID}" /minidlna/


exec su-exec minidlna /usr/sbin/minidlnad -P "$PIDFILE" -S "$@"
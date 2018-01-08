#!/bin/bash
if [ $MODE = 'slave' ]; then
    echo 'slave mod ENVS: $IP,$PORT,$MASTER_IP,$MASTER_PORT'
    CONF_VARS='$IP:$PORT:$MASTER_IP:$MASTER_PORT'
    envsubst "$CONF_VARS" < "/usr/local/etc/redis/$MODE.conf" > "/usr/local/etc/redis/redis.conf"
    redis-server --slaveof ${MASTER_IP} ${MASTER_PORT}
elif [ $MODE = 'sentinel' ]; then
    echo 'sentinel mod ENVS: $IP,$HOST,$MASTER_ID,$MASTER_PORT,$QUORUM'
    CONF_VARS='$IP:$PORT:$MASTER_NAME:$MASTER_IP:$MASTER_PORT:$QUORUM'
    envsubst "$CONF_VARS" < "/usr/local/etc/redis/$MODE.conf" > "/usr/local/etc/redis/redis.conf"
    redis-sentinel /usr/local/etc/redis/redis.conf
else
    echo 'master mod ENVS: $IP,$PORT'
    CONF_VARS='$IP:$PORT'
    envsubst "$CONF_VARS" < "/usr/local/etc/redis/$MODE.conf" > "/usr/local/etc/redis/redis.conf"
    redis-server
fi
exec "$@"
#!/bin/bash
if [[ $MOD == 'slave' ]]; then
    echo 'slave mod ENVS: $IP,$PORT,$MASTER_IP,$MASTER_PORT'
    CONF_VARS='$IP,$PORT,$MASTER_IP,$MASTER_PORT'
    envsubst '$CONF_VARS' < "/usr/local/etc/redis/master.conf" > "/usr/local/etc/redis/redis.conf"
elif [[ $MOD == 'sentinel' ]]; then
    echo 'sentinel mod ENVS: $IP,$HOST,$MASTER_ID,$MASTER_PORT'
    CONF_VARS='$IP,$PORT,$MASTER_IP,$MASTER_PORT'
    envsubst '$CONF_VARS' < "/usr/local/etc/redis/master.conf" > "/usr/local/etc/redis/redis.conf"
else
    echo 'master mod ENVS: $IP,$HOST'
    CONF_VARS='$IP,$PORT,$MASTER_IP,$MASTER_PORT'
    envsubst '$CONF_VARS' < "/usr/local/etc/redis/master.conf" > "/usr/local/etc/redis/redis.conf"
fi
exec "$@"
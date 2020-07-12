#!/bin/bash

if [ -z "$ADMIN_ID" -o -z "$CLIENT_ID" -o -z "$TZ" -o -z "$TOKEN" ]; then
   echo "Please ensure the environment variables ADMIN_ID, CLIENT_ID, TZ, and TOKEN are set"
   exit -1
fi

if [ -z "${ADMIN_ID##*[!0-9]*}" ]; then
   echo "ADMIN_ID must be a number"
   exit -1
fi

if [ -z "${CLIENT_ID##*[!0-9]*}" ]; then
   echo "CLIENT_ID must be a number"
   exit -1
fi

if [ -z "${HEARTBEAT_TIMEOUT##*[!0-9]*}" ]; then
   echo "HEARTBEAT_TIMEOUT must be a number"
   exit -1
fi

if [ "$DISABLE_LOOP" == "true" ] || [ "$DISABLE_LOOP" == "false" ]; then
else
   echo "DISABLE_LOOP must be true or false"
   exit -1
fi

cd /AutoVoiceChannels

if [ -z "${ADMIN_CHANNEL##*[!0-9]*}" ]; then
   echo "ADMIN_CHANNEL must be a number"
   exit -1
elif [ [[ -z "$DISABLE_LOOP" ]] ]
# If ADMIN_CHNNEL is empty
cat >config.json <<CONFIG_JSON
{
    "admin_id":$ADMIN_ID,
    "client_id":$CLIENT_ID,
    "log_timezone":"$TZ",
    "token":"$TOKEN",
    "disable_ready_message":$RDY_MESSAGE,
    "disable_creation_loop":$DISABLE_LOOP,
    "heartbeat_timeout":$HEARTBEAT_TIMEOUT
}
else
# If ADMIN_CHANNEL isnt empty
cat >config.json <<CONFIG_JSON
{
    "admin_id":$ADMIN_ID,
    "client_id":$CLIENT_ID,
    "log_timezone":"$TZ",
    "token":"$TOKEN",
    "disable_ready_message":$RDY_MESSAGE,
    "admin_channel":$ADMIN_CHANNEL,
    "disable_creation_loop":$DISABLE_LOOP,
    "heartbeat_timeout":$HEARTBEAT_TIMEOUT
}
fi

CONFIG_JSON

python ./auto-voice-channels.py

#!/bin/bash

if [ -z "$ADMIN_ID" -o -z "$CLIENT_ID" -o -z "$TZ" -o -z "$TOKEN" -o -z RDY_MESSAGE -o -z DISABLE_LOOP -o -z HEARTBEAT_TIMEOUT ]; then
   echo "Please ensure the environment variables ADMIN_ID, CLIENT_ID, TZ, TOKEN, RDY_MESSAGE, DISABLE_LOOP and HEARTBEAT_TIMEOUT are set"
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

if [ "$RDY_MESSAGE" != "true" ] && [ "$RDY_MESSAGE" != "false" ]; then
   echo "RDY_MESSAGE must be true or false, needs to be lower case."
   exit -1
fi

if [ "$DISABLE_LOOP" != "true" ] && [ "$DISABLE_LOOP" != "false" ]; then
   echo "DISABLE_LOOP must be true or false, needs to be lower case."
   exit -1
fi

if [ -z "${HEARTBEAT_TIMEOUT##*[!0-9]*}" ]; then
   echo "HEARTBEAT_TIMEOUT must be a number"
   exit -1
fi

cd /AutoVoiceChannels

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

CONFIG_JSON

python ./auto-voice-channels.py

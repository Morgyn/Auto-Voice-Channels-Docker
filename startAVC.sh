#!/bin/bash

if [ -z "$ADMIN_ID" -o -z "$CLIENT_ID" -o -z "$TZ" -o -z "$TOKEN" ]; then
   echo "Please ensure the environment variables ADMIN_ID, CLIENT_ID, TZ, and TOKEN are set"
   exit -1
fi

cd /AutoVoiceChannels

cat >config.json <<CONFIG_JSON
{
    "admin_id": "$ADMIN_ID",
    "client_id": "$CLIENT_ID",
    "log_timezone": "$TZ",
    "token":"$TOKEN"
}
CONFIG_JSON

python ./auto-voice-channels.py

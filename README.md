# This is a docker image for the Discord bot Auto Voice Channels.

https://github.com/gregzaal/Auto-Voice-Channels

This pulls the latest zip file of the bot from github.

***Please make sure you first read the documentation of Auto-Voice-Channels.**

## Important
You will need to create a directory where your guild data will be persistant.

## Usage
### Docker
```bash
docker run -d \
  --name avc \
  --restart unless-stopped \
  -e ADMIN_ID=<ADMIN ID> \
  -e CLIENT_ID=<CLIENT_ID> \
  -e TZ=<TIMEZONE> \
  -e TOKEN=<TOKEN> \
  -e HEARTBEAT_TIMEOUT=60 \
  -e DISABLE_LOOP=false \
  -e RDY_MESSAGE=false \
  -v <GUILD DATA DIR>:/AutoVoiceChannels/guilds:Z \
  morgyn/autovoicechannels
```
### docker-compose
```
version: '2'
services:
  avc:
    image: morgyn/autovoicechannels
    container_name: AutoVoiceChannels
    environment:
      - ADMIN_ID=<ADMIN ID>
      - CLIENT_ID=<CLIENT_ID>
      - TZ=<TIMEZONE>
      - TOKEN=<TOKEN>
      - HEARTBEAT_TIMEOUT=60 #Optional
      - DISABLE_LOOP=false #Optional
      - RDY_MESSAGE=false #Optional
    volumes:
      - <GUILD DATA DIR>:/AutoVoiceChannels/guilds:Z
    restart: unless-stopped
```

## Parameters
| Parameter | Function |
| :----: | --- |
| `ADMIN_ID` | Your ID, for the bot to DM you when it logs on, joins servers, gets errors, etc. |
| `CLIENT_ID` | The bot ID. |
| `TZ` | Time displayed in logs. eg Europe/London |
| `TOKEN` | Bot's private token you can find here - do not share it with anyone else. |
| `HEARTBEAT_TIMEOUT` | (int, default 60) For extremely extremely large servers, if your bot is having trouble connecting and repeatedly timing out before it can finish processing all members, set this to some higher number. |
| `DISABLE_LOOP` | (bool, default false) For extremely large servers, set this to true if your bot starts creating multiple channels for one person even though they only wanted one. This will disable the background loop that watches primary channels, so the only way a new channel will be created is if the event of the user joining a primary channel is caught. |
| `RDY_MESSAGE` | (bool, default false) Use to prevent the bot spamming you "Ready" when it regains connection, which may be quite often if your internet is unstable. |
| `GUILD DATA DIR` | Absolute path to the directory you wish to store your persistant guild data. |

Invite the bot to your own server, replacing `<YOUR BOT ID>` with... your bot ID: `https://discordapp.com/api/oauth2/authorize?client_id=<YOUR BOT ID>&permissions=286280784&scope=bot`

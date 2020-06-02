# This is a docker image for the Discord bot Auto Voice Channels.

https://github.com/gregzaal/Auto-Voice-Channels

This pulls the latest zip file of the bot from github.

***Please make sure you first read the documentation of Auto-Voice-Channels.**

You will need to create a directory where your guild data will be persistant.

`docker run -d -e ADMIN_ID=<ADMIN ID> -e CLIENT_ID=<CLIENT_ID> -e TZ=<TIMEZONE eg Europe/London> -e TOKEN=<TOKEN> -v <GUILD DATA DIR>:/AutoVoiceChannels/guilds morgyn/autodiscordchannels`


    ADMIN_ID is your ID, for the bot to DM you when it logs on, joins servers, gets errors, etc.
    CLIENT_ID is the bot ID.
    TZ is for the time displayed in logs.
    TOKEN is your bot's private token you can find here - do not share it with anyone else.
    GUILD DATA DIR is the absolute path to the directory you wish to store your persistant guild data.

Invite the bot to your own server, replacing <YOUR BOT ID> with... your bot ID: https://discordapp.com/api/oauth2/authorize?client_id=<YOUR BOT ID>&permissions=286280784&scope=bot

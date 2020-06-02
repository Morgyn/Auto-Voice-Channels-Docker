FROM python:3.8.3-slim

RUN apt-get update &&\
    apt-get -y install build-essential curl unzip &&\
    curl https://codeload.github.com/gregzaal/Auto-Voice-Channels/zip/master -o avc.zip &&\
    unzip avc.zip &&\
    mv Auto-Voice-Channels-master AutoVoiceChannels &&\
    rm avc.zip 
    

WORKDIR /AutoVoiceChannels

RUN pip install discord.py && \
    pip install pytz && \
    pip install psutil && \
    pip install requests && \
    pip3 install virtualenv

RUN python3 -m virtualenv bot-env && . bot-env/bin/activate

COPY startAVC.sh startAVC.sh

CMD [ "bash", "startAVC.sh" ]

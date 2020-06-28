FROM python:slim

RUN apt-get update &&\
    apt-get -y install curl unzip &&\
    curl https://codeload.github.com/gregzaal/Auto-Voice-Channels/zip/master -o avc.zip &&\
    unzip avc.zip &&\
    mv Auto-Voice-Channels-master AutoVoiceChannels &&\
    apt-get -y remove curl unzip &&\
    rm avc.zip 
    

WORKDIR /AutoVoiceChannels

RUN apt-get -y install build-essential &&\
    pip install -r /AutoVoiceChannels/requirements.txt &&\
    apt-get -y remove build-essential

COPY startAVC.sh startAVC.sh

CMD [ "bash", "startAVC.sh" ]

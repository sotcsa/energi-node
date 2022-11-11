FROM ubuntu:18.04

RUN useradd -ms /bin/bash energiuser

WORKDIR /opt

RUN apt update && apt upgrade -y && apt install -y wget

RUN wget https://s3-us-west-2.amazonaws.com/download.energi.software/releases/energi3/v3.1.3/energi3-v3.1.3-linux-amd64.tgz && \
    wget https://s3-us-west-2.amazonaws.com/download.energi.software/releases/energi3/v3.1.3/SHA256SUMS && \
    sha256sum -c --ignore-missing SHA256SUMS

RUN tar xvfz energi3-v3.1.3-linux-amd64.tgz && \
    rm -f energi3-v3.1.3-linux-amd64.tgz && \
    chown energiuser:energiuser -R energi3-v3.1.3-linux-amd64/

USER energiuser

CMD [ "energi3-v3.1.3-linux-amd64/bin/energi3" ]
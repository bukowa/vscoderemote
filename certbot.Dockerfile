FROM ubuntu:20.04

RUN apt-get update \
    && apt-get install -y \
        software-properties-common \
    && add-apt-repository universe \
    && apt-get update

RUN apt-get install -y \
    certbot \
    python3-certbot-dns-digitalocean

WORKDIR /app

ENTRYPOINT ["certbot", "--agree-tos", "--dns-digitalocean", "--dns-digitalocean-credentials", "/app/digitalocean.ini", "certonly"]

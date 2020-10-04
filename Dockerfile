FROM codercom/code-server
RUN sudo apt-get update &&\
    sudo apt-get -y upgrade &&\
    sudo apt-get -y install wget build-essential software-properties-common \
        zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev \
        libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev

# GOLANG
RUN wget https://golang.org/dl/go1.15.2.linux-amd64.tar.gz &&\
    sudo tar -C /usr/local -xzf go1.15.2.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin

# PYTHON
RUN wget https://www.python.org/ftp/python/3.8.6/Python-3.8.6.tgz &&\
    sudo tar -C /usr/local -xzf Python-3.8.6.tgz &&\
    cd /usr/local/Python-3.8.6 && sudo ./configure && sudo make install
ENV PATH=$PATH:/usr/local/Python-3.8.6
RUN ls

# DOCKER
RUN sudo apt-get -y install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common &&\
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - &&\
    sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/debian \
       $(lsb_release -cs) \
       stable" &&\
    sudo apt-get update &&\
    sudo apt-get -y install docker-ce docker-ce-cli containerd.io &&\
    apt-cache madison docker-ce &&\
    sudo apt-get -y install containerd.io

RUN sudo apt-get -y install git

WORKDIR /home/coder/project

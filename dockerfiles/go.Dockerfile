FROM angeloevangelista/dev-ubuntu:local

ENV GO_VERSION=1.24.2

WORKDIR /tmp

RUN \
	wget https://dl.google.com/go/go$GO_VERSION.linux-amd64.tar.gz && \
	sudo tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz && \
	echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.zshrc && \
	echo 'export PATH=$PATH:$HOME/go/bin' >> $HOME/.zshrc

RUN rm ./go$GO_VERSION.linux-amd64.tar.gz

WORKDIR $HOME

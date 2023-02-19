FROM dev-ubuntu:latest

ENV NVM_DIR=$HOME/.nvm
ENV NODE_VERSION=16.13.1

RUN \
	for PACKAGE_NAME in \
	gnupg ;\
	do sudo apt install $PACKAGE_NAME -y; done

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash && \
	echo "export NVM_DIR=$NVM_DIR" >> $HOME/.zshrc && \
	echo "[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"" >> $HOME/.zshrc && \
	echo "[ -s \"$NVM_DIR/bash_completion\" ] && \. \"$NVM_DIR/bash_completion\"" >> $HOME/.zshrc

RUN	. $NVM_DIR/nvm.sh && \
	nvm install $NODE_VERSION && \
	nvm use $NODE_VERSION

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
	sudo apt update && \
	sudo apt install --no-install-recommends yarn

WORKDIR $HOME

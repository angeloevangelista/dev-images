FROM ubuntu:22.04

ENV USER=dev-angelo
ENV HOME=/home/$USER
ENV ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

RUN apt update

RUN \
	for PACKAGE_NAME in \
	sudo git curl wget zsh ;\
	do apt install $PACKAGE_NAME -y; done

RUN useradd -d $HOME -ms /bin/bash $USER
RUN echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USER

WORKDIR $HOME

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN zsh

RUN git clone https://github.com/spaceship-prompt/spaceship-prompt.git \
	"$ZSH_CUSTOM/themes/spaceship-prompt" \
	--depth=1

RUN ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" \
	"$ZSH_CUSTOM/themes/spaceship.zsh-theme"

COPY files/.zshrc /$HOME/
COPY files/.gitconfig /$HOME/

RUN zsh

WORKDIR $HOME

FROM ubuntu:22.04

ARG USER=user

ENV	USERNAME=dev-$USER
ENV	HOME=/home/$USERNAME

ENV	\
	ZSH_CUSTOM=$HOME/.oh-my-zsh/custom \
	ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit"

RUN apt update && \
	for PACKAGE_NAME in \
	sudo openssh-client git curl ca-certificates wget zsh ;\
	do apt install $PACKAGE_NAME -y --no-install-recommends; done

RUN useradd -d $HOME -ms /bin/bash $USERNAME
RUN echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USERNAME

WORKDIR $HOME

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN \
	git clone https://github.com/spaceship-prompt/spaceship-prompt.git \
	"$ZSH_CUSTOM/themes/spaceship-prompt" \
	--depth=1 && \
	ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" \
	"$ZSH_CUSTOM/themes/spaceship.zsh-theme"

COPY files/.zshrc /$HOME/
COPY files/.gitconfig /$HOME/

RUN git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

WORKDIR $HOME

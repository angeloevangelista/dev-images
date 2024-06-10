FROM ubuntu:22.04

ARG USER_NAME=dev-42

ENV LC_CTYPE=en_US.UTF-8
ENV	HOME=/home/$USER_NAME
ENV	WWW=$HOME/www
ENV	ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

RUN \
	apt update && apt install -y --no-install-recommends \
	vim zsh	git	wget curl	sudo openssh-client ca-certificates locales

RUN locale-gen en_US en_US.UTF-8 && update-locale

RUN useradd -d $HOME -ms /bin/bash $USER_NAME

RUN echo "$USER_NAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USER_NAME

WORKDIR $HOME

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN sudo chsh -s /usr/bin/zsh $USER_NAME

RUN \
	git clone https://github.com/spaceship-prompt/spaceship-prompt.git \
	"$ZSH_CUSTOM/themes/spaceship-prompt" \
	--depth=1 && \
	ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" \
	"$ZSH_CUSTOM/themes/spaceship.zsh-theme"

COPY --chown=$USER_NAME files/.zshrc $HOME
COPY --chown=$USER_NAME files/.gitconfig $HOME

RUN SKIP_GIT_USER_CONFIG=1 zsh $HOME/.zshrc

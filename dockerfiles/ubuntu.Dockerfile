FROM ubuntu:24.10

ARG USER_NAME=dev-42

ENV LC_CTYPE=en_US.UTF-8
ENV	HOME=/home/$USER_NAME
ENV	WWW=$HOME/www
ENV PATH=$PATH:$HOME/.vscode-server/bin/*/bin

RUN \
	apt update && apt install -y --no-install-recommends \
	vim zsh	git	wget curl	sudo openssh-client ca-certificates locales

RUN locale-gen en_US en_US.UTF-8 && update-locale

RUN useradd -d $HOME -ms /bin/bash $USER_NAME

RUN echo "$USER_NAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USER_NAME

WORKDIR $HOME

RUN bash -c "$(\
	curl --fail --show-error --silent \
	--location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh \
)"

RUN sudo chsh -s /usr/bin/zsh $USER_NAME

COPY --chown=$USER_NAME shared/.zshrc $HOME
COPY --chown=$USER_NAME shared/.gitconfig $HOME

RUN SKIP_GIT_USER_CONFIG=1 zsh $HOME/.zshrc

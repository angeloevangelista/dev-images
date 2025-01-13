FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt update

RUN apt install -y \
  curl \
  libcanberra-gtk-module \
  dbus-x11 \
  packagekit-gtk3-module

RUN dbus-uuidgen > /etc/machine-id

RUN curl -o vscode.deb -L http://go.microsoft.com/fwlink/?LinkID=760868 && \
  apt install ./vscode.deb -y && \
  rm ./vscode.deb

RUN adduser dev-angelo --disabled-password

USER dev-angelo

RUN echo 'alias code="code --no-sandbox --user-data-dir ~"' >> ~/.bashrc

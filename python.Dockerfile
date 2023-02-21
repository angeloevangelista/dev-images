FROM dev-ubuntu:latest

RUN sudo apt update

RUN sudo apt update && \
	for PACKAGE_NAME in \
	python3.11 ;\
	do sudo apt install $PACKAGE_NAME -y --no-install-recommends; done

WORKDIR $HOME

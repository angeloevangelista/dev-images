FROM angeloevangelista/dev-ubuntu:latest

RUN \
	sudo apt update && sudo apt install -y --no-install-recommends \
	python3.11

WORKDIR $HOME

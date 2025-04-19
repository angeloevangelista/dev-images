FROM angeloevangelista/dev-ubuntu:local

RUN \
	sudo apt update && sudo apt install -y --no-install-recommends \
	python3.11

WORKDIR $HOME

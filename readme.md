# Dev images

## How to put it on the rails?

```bash
make ubuntu

export SSH_PATH=$(echo ~/.ssh)
export SOURCE_CODE_PATH=$(pwd)

docker network create --driver bridge dev-bridge

docker run -it \
	--name dev-ubuntu \
	--network dev-bridge \
	--volume $SOURCE_CODE_PATH:/home/dev-42/www \
	--volume $SSH_PATH:/home/dev-42/.ssh/:ro \
	-d angeloevangelista/dev-ubuntu:latest
```

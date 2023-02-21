# Dev images

## How to put it on the rails?

```bash
make ubuntu

export SOURCE_CODE_PATH=$www

docker network create --driver bridge dev-bridge

docker run -it \
	--name dev-ubuntu \
	--network dev-bridge \
	-v $SOURCE_CODE_PATH:/dev-volume \
	-v $(echo ~/.ssh):/home/dev-$(whoami)/.ssh/:ro \
	-d dev-ubuntu:latest
```

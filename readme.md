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

## Dev container experiment

```shell
xhost +local:*

# to disable it
# xhost -local:*

docker build . \
	--tag dev-container:latest \
	--file dev-container.Dockerfile \
	--no-cache

docker run -it --rm \
  --name dev-container \
  --env DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
  --network "none" \
  dev-container:latest
```

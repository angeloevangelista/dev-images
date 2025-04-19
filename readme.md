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
	-d angeloevangelista/dev-ubuntu:local
```

## Dev container experiment

```shell
xhost +local:*

# to disable it
# xhost -local:*

docker build . \
	--tag dev-container:local \
	--file dev-container.Dockerfile \
	--no-cache

docker run -it --rm \
  --name dev-container \
  --env DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
  --network "none" \
  dev-container:local
```

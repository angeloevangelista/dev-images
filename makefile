repository_owner=angeloevangelista

ubuntu:
	docker buildx build \
	. \
	--no-cache \
	--platform linux/amd64,linux/arm64 \
	--file ./dockerfiles/ubuntu.Dockerfile \
	--tag $(repository_owner)/dev-ubuntu:local

go: ubuntu
	docker buildx build \
	. \
	--no-cache \
	--platform linux/amd64,linux/arm64 \
	--file ./dockerfiles/go.Dockerfile \
	--tag $(repository_owner)/dev-go:local

node: ubuntu
	docker buildx build \
	. \
	--no-cache \
	--platform linux/amd64,linux/arm64 \
	--file ./dockerfiles/node.Dockerfile \
	--tag $(repository_owner)/dev-node:local

python: ubuntu
	docker buildx build \
	. \
	--no-cache \
	--platform linux/amd64,linux/arm64 \
	--file ./dockerfiles/python.Dockerfile \
	--tag $(repository_owner)/dev-python:local

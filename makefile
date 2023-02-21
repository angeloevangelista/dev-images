ubuntu:
	docker build \
	--no-cache \
	--build-arg USER=$$(whoami) \
	--file ubuntu.Dockerfile \
	--tag dev-ubuntu:latest .

go: ubuntu
	docker build \
	--no-cache \
	--build-arg USER=$$(whoami) \
	--file go.Dockerfile \
	--tag dev-go:latest .

node: ubuntu
	docker build \
	--no-cache \
	--build-arg USER=$$(whoami) \
	--file node.Dockerfile \
	--tag dev-node:latest .

python: ubuntu
	docker build \
	--no-cache \
	--build-arg USER=$$(whoami) \
	--file python.Dockerfile \
	--tag dev-python:latest .

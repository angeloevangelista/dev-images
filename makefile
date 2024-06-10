repository=angeloevangelista

ubuntu:
	docker build \
	--no-cache \
	--file ubuntu.Dockerfile \
	--tag angeloevangelista/dev-ubuntu:latest .

go: ubuntu
	docker build \
	--no-cache \
	--file go.Dockerfile \
	--tag angeloevangelista/dev-go:latest .

node: ubuntu
	docker build \
	--no-cache \
	--file node.Dockerfile \
	--tag angeloevangelista/dev-node:latest .

python: ubuntu
	docker build \
	--no-cache \
	--file python.Dockerfile \
	--tag angeloevangelista/dev-python:latest .

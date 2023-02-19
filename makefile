ubuntu:
	docker build --no-cache --file ubuntu.Dockerfile --tag dev-ubuntu .

go: ubuntu
	docker build --no-cache --file go.Dockerfile --tag dev-go .

node: ubuntu
	docker build --no-cache --file node.Dockerfile --tag dev-node .

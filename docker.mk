.PHONY: help build bash clean

NAME := tamakiii-sandbox/babyagi
TAG := latest

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: Dockerfile
	docker build -t $(NAME):$(TAG) .

bash: build
	docker run -it --rm $(NAME):$(TAG) $@

clean:
	docker image rm $(NAME):$(TAG)

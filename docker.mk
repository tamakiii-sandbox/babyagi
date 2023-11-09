.PHONY: help build bash clean

# ORGANIZATION := yoheinakajima
ORGANIZATION := tamakiii-sandbox
REPOSITORY := babyagi
NAME := $(ORGANIZATION)/$(REPOSITORY)
TAG := latest

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: Dockerfile
	docker build --build-arg ORGANIZATION=$(ORGANIZATION) --build-arg REPOSITORY=$(REPOSITORY) -t $(NAME):$(TAG) .

bash: build
	docker run -it -v $(PWD):/usr/local/lib/$(NAME) -w /usr/local/lib/$(NAME) --rm $(NAME):$(TAG) $@

clean:
	docker image rm $(NAME):$(TAG)

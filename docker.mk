.PHONY: help

TAG := tamakiii-sandbox/babyagi

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: Dockerfile
	docker build -t $(TAG) .

bash: build
	docker run -it --rm $(TAG) $@

clean:
	docker image rm $(TAG)

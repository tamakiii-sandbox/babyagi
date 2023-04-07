.PHONY: help install uninstall setup teardown
.PHONY: run

help:
	@cat $(firstword $(MAKEFILE_LIST))

install:
	pip install -r requirements.txt

setup: \
	.env

run: | babyagi.py
	python $|

uninstall:
	//

teardown:
	rm -rf .env

.env: | .env.example
	cp $| $@

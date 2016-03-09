NS = sh4rk
REPO = letsencrypt-tiny
VERSION ?= latest

default: deps build

deps:
	docker pull alpine:3.3

build:
	docker build -t $(NS)/$(REPO):$(VERSION) --force-rm=true .

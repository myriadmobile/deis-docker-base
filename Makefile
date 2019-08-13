VERSION := $(shell git describe --tags --exact-match 2>/dev/null || echo latest)
IMAGE_PREFIX ?= bushelpowered
IMAGE := ${IMAGE_PREFIX}/deis-docker-base:${VERSION}

build:
	docker build --pull --no-cache -t ${IMAGE} rootfs

push: build
	docker push ${IMAGE}

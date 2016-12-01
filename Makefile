
IMAGE_NAME = os-dav-builder

build-no-cache:
	docker build --no-cache -t $(IMAGE_NAME) .

build:
	docker build -t $(IMAGE_NAME) .

.PHONY: test
test:
	docker build -t $(IMAGE_NAME)-candidate .
	IMAGE_NAME=$(IMAGE_NAME)-candidate test/run

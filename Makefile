TAG := hdl-converter-tag
NAME := hdl-converter-name

.PHONY: attach build run stop tty

run: build
	# sudo docker run --rm --name $(NAME) -d $(TAG)
	sudo docker run -it $(TAG) /bin/bash

build: Dockerfile
	sudo docker build --tag $(TAG) .

attach: run
	sudo docker attach $(NAME)

stop:
	sudo docker stop $(NAME)

tty: run
	sudo docker container exec -it $(NAME) /bin/bash


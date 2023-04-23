build:
	docker build -f ./test.Dockerfile -t ansible-test .
run:
	docker run -it -u lwi ansible-test bash


LAMBDA_TASK_ROOT := /var/task

build: 
	docker build -t hello-world . 
run: 
	docker run --rm -v $$PWD/app.py:$(LAMBDA_TASK_ROOT)/app.py -p 9000:8080 hello-world
exec:
	$(eval CONTAINER_ID := $(shell docker ps --format "{{.ID}}"))
	docker container exec -it $(CONTAINER_ID) bash
test:
	curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}'
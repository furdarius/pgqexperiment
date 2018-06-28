.PHONY: all
all: db redis

.PHONY: db
db:
	docker build -t pgqexperiment:latest .
	docker run --rm --net=host -v $(shell pwd):/app -w /app --name pgqexperiment -d pgqexperiment:latest
	docker exec -it pgqexperiment ./pgwait.sh
	docker exec -it pgqexperiment ./start.sh

.PHONY: redis
redis:
	docker run --rm --net=host --name pgqexperiment_redis -d redis:4

.PHONY: clear
clear:
	docker stop pgqexperiment
	docker stop pgqexperiment_redis

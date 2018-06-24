.PHONY: all
all: db

.PHONY: db
db:
	docker build -t pgqexperiment:latest .
	docker run --rm --net=host -v $(shell pwd):/app -w /app --name pgqexperiment -d pgqexperiment:latest
	docker exec -it pgqexperiment ./pgwait.sh
	docker exec -it pgqexperiment ./start.sh
	docker exec -it pgqexperiment psql -U postgres -d postgres

.PHONY: clear
clear:
	docker stop pgqexperiment

SHELL := /bin/bash
.DEFAULT_GOAL = help

COMPOSE = docker compose
FILE = -f docker-compose.yml
EXEC = ${COMPOSE} exec
RUN = ${COMPOSE} run

.PHONY: help
# Show this help message
help:
	@cat $(MAKEFILE_LIST) | docker run --rm -i xanders/make-help

.PHONY: start
# Start fastapi server
start:
	uvicorn src.main:app --host 0.0.0.0 --port 8000

.PHONY: up
# Kill all containers, rebuild and up them
up: kill
	${COMPOSE} ${FILE} up -d --build

.PHONY: kill
# Kill all containers
kill:
	${COMPOSE} kill $$(docker ps -q) || true

.PHONY: stop
# Stop all containers
stop:
	${COMPOSE} stop

.PHONY: rm
# Remove all containers
rm:
	${COMPOSE} rm -f

.PHONY: sr
# Stop and remove all containers
sr: stop rm

.PHONY: purge
# Stop and remove all containers and prune volumes, networks, containers and images
purge:
	docker stop $$(docker ps -aq)
	docker rm $$(docker ps -aq)
	docker volume prune -f
	docker network prune -f
	docker container prune -f
	docker image prune -f

.PHONY: fastapi
# Enter in api container
fastapi:
	${EXEC} investic-fastapi-service ${SHELL}

.PHONY: logs
# Prompt logs of container
logs:
	docker logs --follow investic-fastapi-container

.PHONY: ps
# List active containers
ps:
	${COMPOSE} ps -a

.PHONY: perm
# Fix permissions of all files
perm:
	sudo chown -R www-data:$(USER) .
	sudo chmod -R g+rwx .

.PHONY: restart
# Restart api correctly
restart:
	clear
	make perm sr up logs
SHELL ?= /bin/bash
ARGS = $(filter-out $@,$(MAKECMDGOALS))

YELLOW=\033[0;33m
BLUE=\033[0;34m
BOLDGREEN=\033[1;32m

.SILENT: ;
.ONESHELL: ;
.NOTPARALLEL: ;
.EXPORT_ALL_VARIABLES: ;
Makefile: ;

.DEFAULT_GOAL := help

.PHONY: up
up:
	docker-compose up -d

.PHONY: install
install:
	docker-compose exec creator composer install

.PHONY: cv
cv:up
	docker-compose exec creator php /app/create.php

.PHONY: logs
logs:
	docker-compose logs -f ${ARGS}

.PHONY: ps
ps:
	docker-compose ps

.PHONY: stop
stop:
	docker-compose stop ${ARGS}

.PHONY: down
down:
	docker-compose down ${ARGS}

.PHONY: default
default: help

.PHONY: help
help: .title
	printf '\n'
	printf "${BOLDGREEN}Available targets:${NC}\n"
	printf '\n'
	printf "${BLUE}make help${NC}:         ${YELLOW}Show this help${NC}\n"
	printf "${BLUE}make up${NC}:           ${YELLOW}Alias for make up-min${NC}\n"
	printf "${BLUE}make cv${NC}:           ${YELLOW}Convert html to pdf file\n"
	printf "${BLUE}make logs${NC}:         ${YELLOW}Show logs for container {name}. Without arg - for all${NC}\n"
	printf "${BLUE}make stop${NC}:         ${YELLOW}Stop container {name}. Without arg - stop all${NC}\n"
	printf "${BLUE}make down${NC}:         ${YELLOW}Remove container {name}. Without arg - remove all${NC}\n"
	printf "${BLUE}make ps${NC}:           ${YELLOW}Show containers status${NC}\n"
	printf "${BLUE}make install${NC}:      ${YELLOW}Install composer dependencies\n"
	printf '\n'

%:
	@:

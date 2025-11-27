.PHONY: up down restart up.% down.% restart.%

up:
	docker-compose -f database/docker-compose.yml up -d
	docker-compose -f scraping/docker-compose.yml up -d
	docker-compose -f backend/docker-compose.yml up -d --build

down:
	docker-compose -f backend/docker-compose.yml down
	docker-compose -f scraping/docker-compose.yml down
	docker-compose -f database/docker-compose.yml down

restart: down up

up.database:
	docker-compose -f database/docker-compose.yml up -d

up.scraping:
	docker-compose -f scraping/docker-compose.yml up -d

up.backend:
	docker-compose -f backend/docker-compose.yml up -d --build

down.database:
	docker-compose -f database/docker-compose.yml down

down.scraping:
	docker-compose -f scraping/docker-compose.yml down

down.backend:
	docker-compose -f backend/docker-compose.yml down

restart.database: down.database up.database

restart.scraping: down.scraping up.scraping

restart.backend: down.backend up.backend

## Setup

1. Clone the repository with submodules:
```bash
git clone --recurse-submodules <repository-url>
cd player-stats
```

2. Copy the environment file and configure:
```bash
cp .env.example .env
# Edit .env with your database credentials
```

## Running Services

All commands should be run from the `player-stats` root directory to ensure the `.env` file is properly loaded.

### Database

Start the PostgreSQL database:
```bash
docker-compose -f database/docker-compose.yml up -d
```

Check database status:
```bash
docker ps --filter "name=player-stats-db"
```

### Scraping Service

Start the NBA data scraper (runs daily at 5:00 AM EST):
```bash
docker-compose -f scraping/docker-compose.yml up -d
```

Manual backfill example:
```bash
docker exec -it player-stats-scraper cargo run --bin backfill 2023-24 2023-24
```

### backend

Start the backend:
```bash
docker-compose -f backend/docker-compose.yml up -d --build
```

Access the API:
- API endpoint: http://localhost:3000/api/boxscores/count
- Filter endpoint: http://localhost:3000/api/boxscores/filter
- Swagger docs: http://localhost:3000/docs

## Starting All Services

Start everything at once:
```bash
docker-compose -f database/docker-compose.yml up -d && \
docker-compose -f scraping/docker-compose.yml up -d && \
docker-compose -f backend/docker-compose.yml up -d --build
```

## Stopping Services

Stop individual services:
```bash
docker-compose -f database/docker-compose.yml down
docker-compose -f scraping/docker-compose.yml down
docker-compose -f backend/docker-compose.yml down
```

Stop all:
```bash
docker-compose -f database/docker-compose.yml down && \
docker-compose -f scraping/docker-compose.yml down && \
docker-compose -f backend/docker-compose.yml down
```

## Viewing Logs

```bash
docker logs player-stats-db
docker logs player-stats-scraper
docker logs player-stats-backend
```

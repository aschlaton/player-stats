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

All commands should be run from the `player-stats` root directory.

### Start All Services

```bash
make up
```

### Stop All Services

```bash
make down
```

### Restart All Services

```bash
make restart
```

### Individual Services

Start/stop/restart individual services:

```bash
# Database
make up.database
make down.database
make restart.database

# Scraping
make up.scraping
make down.scraping
make restart.scraping

# Backend
make up.backend
make down.backend
make restart.backend
```

### Accessing the API

Once the backend is running:
- API endpoint: http://localhost:3000/api/boxscores/count
- Filter endpoint: http://localhost:3000/api/boxscores/filter
- Swagger docs: http://localhost:3000/docs

### Manual Data Backfill

```bash
docker exec -it player-stats-scraper cargo run --bin backfill 2023-24 2023-24
```

## Viewing Logs

```bash
docker logs player-stats-db
docker logs player-stats-scraper
docker logs player-stats-backend
```

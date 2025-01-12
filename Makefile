
#   Define project variables
DOMAIN_NAME = yourdomain.com
SUBDOMAIN = ai-assistant
GENERIC_TIMEZONE = "America/New_York"

# Default target
all: n8n ollama qdrant

# Build and run n8n container
n8n:
	docker-compose up -d --build n8n

# Build and run ollama container
ollama:
	docker-compose up -d --build ollama

# Build and run qdrant container
qdrant:
	docker-compose up -d --build qdrant

# Stop all containers
stop:
	docker-compose down

# Build all images
build:
	docker-compose build

# Clean all container images and volumes
clean:
	docker-compose down
	docker rmi -f $(docker images -q)
	docker volume rm $(docker volume ls -q)

# Configure Docker Compose
docker-compose:
	cp docker-compose.yml .

# - Clean targets first
.PHONY: clean stop build all
